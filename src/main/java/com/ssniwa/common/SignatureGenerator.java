package com.ssniwa.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SignatureGenerator {

    public static String generate(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(input.getBytes("UTF-8")); // step 3
        byte raw[] = md.digest(); // step 4
        String hash = new String(Base64.encode(raw)); // step 5
        return hash; // step 6
    }
}
