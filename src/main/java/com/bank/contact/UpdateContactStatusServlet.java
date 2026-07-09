package com.bank.contact;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bank.notification.Notification;
import com.bank.notification.NotificationDAO;
import com.bank.model.User;


@WebServlet("/UpdateContactStatusServlet")
public class UpdateContactStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String status = request.getParameter("status");

        String adminRemark = request.getParameter("adminRemark");

        ContactDAO dao = new ContactDAO();

        Contact complaint =
                dao.getMessageById(id);

        boolean updated =
                dao.updateMessageStatus(
                        id,
                        status,
                        adminRemark);

        if(updated && complaint != null){

            Notification notification =
                    new Notification();

            notification.setUserId(
                    complaint.getUserId());

            notification.setTitle(
                    "Complaint Updated");

            notification.setMessage(
                    "Your complaint '"
                    + complaint.getSubject()
                    + "' has been updated to "
                    + status + ".");

            NotificationDAO notificationDAO =
                    new NotificationDAO();

            notificationDAO.addNotification(
                    notification);
        }

        response.sendRedirect("AdminDashboardServlet?page=messages");

    }

}