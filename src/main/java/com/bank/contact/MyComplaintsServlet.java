package com.bank.contact;

import java.io.IOException;
import java.util.List;

import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyComplaintsServlet")
public class MyComplaintsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check Login
        if(session == null || session.getAttribute("user") == null){

            response.sendRedirect("login.jsp");

            return;
        }

        User user = (User) session.getAttribute("user");

        String email = user.getEmail();

        ContactDAO dao = new ContactDAO();

        List<Contact> complaints =
                dao.getMessagesByEmail(email);

        request.setAttribute(
                "complaints",
                complaints);

        request.getRequestDispatcher(
                "my-complaints.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}