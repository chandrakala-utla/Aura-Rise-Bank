package com.bank.dao;

import com.bank.model.User;

public class RegisterTest {

    public static void main(String[] args) {

        User user = new User();

        user.setFullName("Chandrakala");
        user.setEmail("chandrakala2@test.com");
        user.setPhone("9876543211");
        user.setPassword("123456");
        user.setRole("CUSTOMER");

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if (status) {
            System.out.println("User Registered Successfully!");
        } else {
            System.out.println("Registration Failed!");
        }
    }
}