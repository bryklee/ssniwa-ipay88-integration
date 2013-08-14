package com.ssniwa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssniwa.common.Constant;
import com.ssniwa.common.Util;

@SuppressWarnings("serial")
public class COResponseServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        process(req, resp);
    }
    
    private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String referer = req.getHeader("referer");
            referer = referer == null ? "" : referer.trim().toLowerCase();
            if( referer.indexOf(Constant.responseReferer) == -1 ) {
                throw new Exception("Request header invalid referer");
            }
            
            String status = req.getParameter("Status");
            status = status == null ? "" : status.trim();
            if( "".equals(status) ) {
                throw new Exception("Post data invalid: Status");
            }
            
            if( !status.equals(Constant.RESP_STATUS_SUCCESS) ) {
                String errDesc = req.getParameter("ErrDesc");
                errDesc = errDesc == null ? "" : errDesc.trim();
                
                req.setAttribute("Status", Constant.RESP_STATUS_FAIL);
                req.setAttribute("ErrDesc", errDesc);
                req.getRequestDispatcher("/WEB-INF/jsp/coresponse.jsp").forward(req, resp);
                return;
            }
            
            String paymentId = req.getParameter("PaymentId");
            paymentId = paymentId == null ? "" : paymentId.trim();
            if( "".equals(paymentId) ) {
                throw new Exception("Post data invalid: PaymentId");
            }
            
            String refNo = req.getParameter("RefNo");
            refNo = refNo == null ? "" : refNo.trim();
            if( "".equals(refNo) ) {
                throw new Exception("Post data invalid: RefNo");
            }
            
            String amount = req.getParameter("Amount");
            amount = amount == null ? "" : amount.trim();
            double dAmount = 0;
            try {
                dAmount = Double.parseDouble(amount);
                if( dAmount <= 0d ) {
                    throw new Exception();
                }
            }
            catch(Exception e) {
                throw new Exception("Post data invalid: amount");
            }
            String strAmount = String.valueOf(dAmount);
            try {
                strAmount = Util.DECIMAL_FORMAT.format(dAmount);
            }
            catch(Exception e) {
                throw new Exception("Post data failed to format: amount");
            }

            String currency = req.getParameter("Currency");
            currency = currency == null ? "" : currency.trim();
            if( "".equals(currency) ) {
                throw new Exception("Post data invalid: Currency");
            }
            
            String generatedSignature = Util.generateSignature(
                    Util.getSignatureInputForResponse(paymentId, refNo, amount, currency));
            
            String signature = req.getParameter("Signature");
            signature = signature == null ? "" : signature.trim();
            if( !signature.equals(generatedSignature) ) {
                throw new Exception("Post data invalid: Signature");
            }
            
            String transId = req.getParameter("TransId");
            transId = transId == null ? "" : transId.trim();
            
            req.setAttribute("Status", Constant.RESP_STATUS_SUCCESS);
            req.setAttribute("RefNo", refNo);
            req.setAttribute("TransId", transId);
            req.setAttribute("Amount", strAmount);
            req.getRequestDispatcher("/WEB-INF/jsp/coresponse.jsp").forward(req, resp);
            return;
        }
        catch(Throwable th) {
            resp.sendRedirect("http://s3.amazonaws.com/heroku_pages/error.html");
        }
    }
}
