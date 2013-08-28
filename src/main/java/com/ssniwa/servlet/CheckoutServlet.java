package com.ssniwa.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssniwa.common.Constant;
import com.ssniwa.common.Util;

@SuppressWarnings("serial")
public class CheckoutServlet extends HttpServlet {
    
    private static final Random RANDOM = new Random();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        process(req, resp);
    }
    
    private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String urlToForward = null;
        try {
            String strName = req.getParameter("name");
            strName = strName == null ? "" : strName.trim().toUpperCase();
            if( "".equals(strName) ) {
                throw new Exception("Post data invalid: name");
            }
            
            String strPhone = req.getParameter("phone");
            strPhone = strPhone == null ? "" : strPhone.trim();
            if( !strPhone.matches("\\d+") ) {
                throw new Exception("Post data invalid: phone");
            }
            
            String strEmail = req.getParameter("email");
            strEmail = strEmail == null ? "" : strEmail.trim().toLowerCase();
            if( "".equals(strEmail) ) {
                throw new Exception("Post data invalid: email");
            }
            
            String strAmount = req.getParameter("amount");
            strAmount = strAmount == null ? "" : strAmount.trim();
            double dOriginalAmount = 0d;
            double dAmount = 0d;
            double dFee = 0d;
            String strOriginalAmount = "";
            String strFee = "";
            try {
                if( strAmount.length() > 8 ) {
                    throw new Exception();
                }
                
                dOriginalAmount = Double.parseDouble(strAmount);
                if( dOriginalAmount <= 0d ) {
                    throw new Exception();
                }
                
                if( dOriginalAmount >= 15d ) {
                    dAmount = dOriginalAmount * 1.04d;
                }
                else {
                    dAmount = dOriginalAmount + 0.6d;
                }
                
                dFee = dAmount - dOriginalAmount;
            }
            catch(Exception e) {
                throw new Exception("Post data invalid: amount");
            }
            try {
                strAmount = Util.DECIMAL_FORMAT.format(dAmount);
                strOriginalAmount = Util.DECIMAL_FORMAT.format(dOriginalAmount);
                strFee = Util.DECIMAL_FORMAT.format(dFee);
            }
            catch(Exception e) {
                throw new Exception("Post data failed to format: amount");
            }
            
            String strProdDesc = req.getParameter("vtype");
            strProdDesc = strProdDesc == null ? "" : strProdDesc.trim();
            if( "".equals(strProdDesc) ) {
                throw new Exception("Post data invalid: vtype");
            }
            
            String strPeriod = req.getParameter("period");
            strPeriod = strPeriod == null ? "" : strPeriod.trim();
            if( "".equals(strPeriod) ) {
                throw new Exception("Post data invalid: period");
            }
            
            String strRefNo = getRefNo();
                        
            req.setAttribute("MerchantCode", Constant.merchantCode);
            req.setAttribute("PaymentId", "");
            req.setAttribute("RefNo", strRefNo);
            req.setAttribute("Amount", strAmount);
            req.setAttribute("Currency", Constant.currency);
            req.setAttribute("ProdDesc", strProdDesc);
            req.setAttribute("UserName", strName);
            req.setAttribute("UserEmail", strEmail);
            req.setAttribute("UserContact", strPhone);
            req.setAttribute("Remark", strPeriod);
            req.setAttribute("Lang", Constant.lang);            
            req.setAttribute("Signature", Util.generateSignature(Util.getSignatureInputForRequest(strRefNo, strAmount)));
            req.setAttribute("ResponseURL", Constant.responseURL);
            req.setAttribute("BackendURL", "");
            req.setAttribute("OriginalAmount", strOriginalAmount);
            req.setAttribute("Fee", strFee);

            urlToForward = "/WEB-INF/jsp/checkout.jsp";
        }
        catch(Throwable th) {
            urlToForward = "/WEB-INF/jsp/error.jsp";
        }
        
        req.getRequestDispatcher(urlToForward).forward(req, resp);
    }
    
    private String getRefNo() {
        long lRandom = RANDOM.nextInt();
        String random = lRandom < 0L ? String.valueOf(lRandom * (-1L)) : String.valueOf(lRandom);
        while( random.length() < 2 ) {
            random += random;
        }
        String refNo = random.substring(0, 2) + String.valueOf(System.currentTimeMillis());
        return refNo.length() > 20 ? refNo.substring(0, 20) : refNo;
    }
    
}
