package utils;

import java.security.MessageDigest;

public class PasswordHash {

    public static String hash(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean verify(String inputPassword, String storedHash) {
        String inputHash = hash(inputPassword);
        return inputHash != null && inputHash.equals(storedHash);
    }
}
