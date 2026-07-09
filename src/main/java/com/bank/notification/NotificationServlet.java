package com.bank.notification;

import java.io.IOException;
import java.util.List;

import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null){
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        NotificationDAO dao = new NotificationDAO();

        List<Notification> notifications =
                dao.getNotificationsByUserId(
                        user.getUserId());

        int unreadCount =
                dao.getUnreadCount(
                        user.getUserId());

        request.setAttribute(
                "notifications",
                notifications);

        request.setAttribute(
                "unreadCount",
                unreadCount);

        request.getRequestDispatcher(
                "notifications.jsp")
                .forward(request, response);
    }
}