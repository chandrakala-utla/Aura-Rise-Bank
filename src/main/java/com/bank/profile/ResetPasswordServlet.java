package com.bank.profile;

import java.io.IOException;

import com.bank.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");

        // Passwords don't match
        if(!newPassword.equals(confirmPassword)) {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Reset Failed"
                    + "&text=Passwords Do Not Match"
                    + "&redirect=forgot-password.jsp");

            return;
        }

        UserDAO dao = new UserDAO();

        boolean status =
                dao.updatePasswordByEmail(
                        email,
                        newPassword);

        if(status) {

            response.sendRedirect(
                    "message.jsp?icon=success"
                    + "&title=Password Reset Successful"
                    + "&text=Please Login With Your New Password"
                    + "&redirect=login.jsp");

        } else {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Reset Failed"
                    + "&text=Unable To Reset Password"
                    + "&redirect=forgot-password.jsp");
        }
    }
}