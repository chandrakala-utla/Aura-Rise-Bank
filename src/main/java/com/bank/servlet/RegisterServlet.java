package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.UserDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

public RegisterServlet() {
    super();
}

@Override
protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    String fullName =
            request.getParameter("fullName");

    String email =
            request.getParameter("email");

    String phone =
            request.getParameter("phone");

    String password =
            request.getParameter("password");

    // Full Name Validation
    if(fullName == null ||
       fullName.trim().length() < 3) {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Full Name Must Contain At Least 3 Characters"
    			+ "&redirect=register.jsp");

    			return;
    }

    // Email Validation
    String emailRegex =
            "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

    if(!email.matches(emailRegex)) {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Invalid Email Format"
    			+ "&redirect=register.jsp");

    			return;
    }

    // Mobile Number Validation
    if(!phone.matches("^[6-9][0-9]{9}$")) {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Invalid Mobile Number"
    			+ "&redirect=register.jsp");

    			return;
    }

    // Password Validation
    String passwordRegex =
    		"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,20}$";
    

    if(!password.matches(passwordRegex)) {

    	response.sendRedirect(
    		    "message.jsp?icon=error"
    		    + "&title=Registration Failed"
    		    + "&text=Password Must Contain Uppercase, Lowercase, Number And Special Character"
    		    + "&redirect=register.jsp");

    		return;
    }

    UserDAO dao = new UserDAO();

    if(dao.emailExists(email)) {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Email Already Registered"
    			+ "&redirect=register.jsp");

    			return;

    }

    if(dao.phoneExists(phone)) {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Phone Number Already Registered"
    			+ "&redirect=register.jsp");

    			return;

    }
    
    
    User user = new User();

    user.setFullName(fullName);
    user.setEmail(email);
    user.setPhone(phone);
    user.setPassword(password);
    user.setRole("CUSTOMER");


    boolean status =
            dao.registerUser(user);

    if(status) {

    	response.sendRedirect(
    			"message.jsp?icon=success"
    			+ "&title=Registration Successful"
    			+ "&text=Account Created Successfully"
    			+ "&redirect=login.jsp");

    } else {

    	response.sendRedirect(
    			"message.jsp?icon=error"
    			+ "&title=Registration Failed"
    			+ "&text=Please Try Again"
    			+ "&redirect=register.jsp");
    }
}


}
