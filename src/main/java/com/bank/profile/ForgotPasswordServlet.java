package com.bank.profile;

import java.io.IOException;

import com.bank.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        UserDAO dao =
                new UserDAO();

        if(!dao.emailExists(email)) {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Email Not Found"
                    + "&text=No Account Exists With This Email"
                    + "&redirect=forgot-password.jsp");

            return;
        }

        response.sendRedirect(
                "reset-password.jsp?email=" + email);

    }

}