package com.ssniwa.servlet;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CheckoutServlet extends HttpServlet {
    
    private static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#,###,###,##0.00");
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("http://s3.amazonaws.com/heroku_pages/error.html");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        process(req, resp);
    }
    
    private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String strName = req.getParameter("name");
            strName = strName == null ? "" : strName.trim().toUpperCase();
            if( "".equals(strName) ) {
                throw new Exception("Post data invalid: name");
            }
            
            String strPhone = req.getParameter("phone");
            strPhone = strPhone == null ? "" : strPhone.trim();
            if( !strPhone.matches("\\d+") ) {
                throw new Exception("Post data is invalid: phone");
            }
            
            String strEmail = req.getParameter("email");
            strEmail = strEmail == null ? "" : strEmail.trim().toLowerCase();
            if( "".equals(strEmail) ) {
                throw new Exception("Post data invalid: email");
            }
            
            String strAmount = req.getParameter("amount");
            strAmount = strAmount == null ? "" : strAmount.trim();
            double dAmount = 0;
            try {
                dAmount = Double.parseDouble(strAmount);
                if( dAmount <= 0d ) {
                    throw new Exception();
                }
            }
            catch(NumberFormatException nfex) {
                throw new Exception("Post data invalid: amount");
            }
            try {
                strAmount = DECIMAL_FORMAT.format(dAmount);
            }
            catch(Exception e) {
                throw new Exception("Post data failed to format: amount");
            }
                        
            req.setAttribute("name", strName);
            req.setAttribute("phone", strPhone);
            req.setAttribute("email", strEmail);
            req.setAttribute("amount", strAmount);
            req.getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(req, resp);
        }
        catch(Throwable th) {
            resp.sendRedirect("http://s3.amazonaws.com/heroku_pages/error.html");
        }
    }
    
}
