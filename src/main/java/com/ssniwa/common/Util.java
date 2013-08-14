package com.ssniwa.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;

public class Util {
    
    public static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#,###,###,##0.00");

    public static String generateSignature(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(input.getBytes("UTF-8")); // step 3
        byte raw[] = md.digest(); // step 4
        String hash = new String(Base64.encode(raw)); // step 5
        return hash; // step 6
    }
    
    public static String getAmountForHash(String strAmount) {
        String result = strAmount.replaceAll("\\.", "");
        result = result.replaceAll(",", "");
        return result;
    }
    
    public static String getSignatureInputForRequest(String strRefNo, String strAmount) {
        StringBuffer sb = new StringBuffer();
        sb.append(Constant.merchantKey);
        sb.append(Constant.merchantCode);
        sb.append(strRefNo);
        sb.append(getAmountForHash(strAmount));
        sb.append(Constant.currency);
        return sb.toString();
    }
    
    public static String getSignatureInputForResponse(String strPaymentId, String strRefNo, String strAmount, String strCurrency) {
        StringBuffer sb = new StringBuffer();
        sb.append(Constant.merchantKey);
        sb.append(Constant.merchantCode);
        sb.append(strPaymentId);
        sb.append(strRefNo);
        sb.append(getAmountForHash(strAmount));
        sb.append(strCurrency);
        sb.append(Constant.RESP_STATUS_SUCCESS);
        return sb.toString();
    }
}
