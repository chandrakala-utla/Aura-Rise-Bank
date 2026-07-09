package com.bank.notification;

import java.io.IOException;

import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MarkNotificationsReadServlet")
public class MarkNotificationsReadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null){
            return;
        }

        User user =
                (User) session.getAttribute("user");

        if(user == null){
            return;
        }

        NotificationDAO dao =
                new NotificationDAO();

        dao.markAllAsRead(
                user.getUserId());

        response.getWriter().print("OK");
    }
}