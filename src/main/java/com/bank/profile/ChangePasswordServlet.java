package com.bank.profile;

import java.io.IOException;

import com.bank.dao.UserDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        if(user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword =
                request.getParameter(
                        "currentPassword");

        String newPassword =
                request.getParameter(
                        "newPassword");

        String confirmPassword =
                request.getParameter(
                        "confirmPassword");

        UserDAO dao =
                new UserDAO();

        if(!dao.verifyPassword(
                user.getUserId(),
                currentPassword)) {

        	response.sendRedirect(
        	        "message.jsp?icon=error"
        	        + "&title=Password Change Failed"
        	        + "&text=Current Password Is Incorrect"
        	        + "&redirect=change-password.jsp");

        	return;
        }

        if(!newPassword.equals(
                confirmPassword)) {

        	response.sendRedirect(
        	        "message.jsp?icon=error"
        	        + "&title=Password Change Failed"
        	        + "&text=Passwords Do Not Match"
        	        + "&redirect=change-password.jsp");

        	return;
        }

        boolean status =
                dao.updatePassword(
                        user.getUserId(),
                        newPassword);

        if(status) {

        	response.sendRedirect(
        	        "message.jsp?icon=success"
        	        + "&title=Password Updated"
        	        + "&text=Your Password Has Been Changed Successfully"
        	        + "&redirect=ProfileServlet");

        } else {

        	response.sendRedirect(
        	        "message.jsp?icon=error"
        	        + "&title=Password Change Failed"
        	        + "&text=Unable To Update Password"
        	        + "&redirect=change-password.jsp");
        }
    }
}