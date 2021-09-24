package com.ray.jstl.utilities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CryptoUtil {
    private static String SALT = "123456";

    final protected static char[] hexArray = "0123456789ABCDEF".toCharArray();

    public static String hashPassword(String inputString) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(SALT.getBytes()); // prepend SALT
            messageDigest.update(inputString.getBytes());
            //messageDigest.update(SALT.getBytes()); // or append SALT

            byte[] outputString = messageDigest.digest();

            return bytesToHex(outputString);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    private static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        int v;
        for (int j = 0; j < bytes.length; j++) {
            v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }
}
