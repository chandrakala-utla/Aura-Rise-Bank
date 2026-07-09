package com.bank.security;

public class HashTest {

    public static void main(String[] args) {

        String password = "123456";

        String hashedPassword =
                PasswordUtil.hashPassword(password);

        System.out.println("Original Password : " + password);

        System.out.println("SHA-256 Hash      : "
                + hashedPassword);
    }
}