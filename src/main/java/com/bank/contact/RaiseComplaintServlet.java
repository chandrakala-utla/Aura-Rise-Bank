package com.bank.contact;

import java.io.IOException;

import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.bank.notification.Notification;
import com.bank.notification.NotificationDAO;
@WebServlet("/RaiseComplaintServlet")
public class RaiseComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Logged-in customer
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // Complaint Details
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Create Complaint Object
        Contact complaint = new Contact();

        complaint.setFullName(user.getFullName());
        complaint.setEmail(user.getEmail());

        complaint.setSubject(subject);
        complaint.setMessage(message);

        // Save Complaint
        ContactDAO dao = new ContactDAO();

        boolean status = dao.saveMessage(complaint);

        if (status) {
        	Notification notification =
        	        new Notification();

        	notification.setUserId(
        	        user.getUserId());

        	notification.setTitle(
        	        "Complaint Submitted");

        	notification.setMessage(
        	        "Your complaint regarding '"
        	        + subject
        	        + "' has been submitted successfully. Our team will review it shortly.");

        	NotificationDAO notificationDAO =
        	        new NotificationDAO();

        	notificationDAO.addNotification(
        	        notification);
            response.sendRedirect(
                    "raise-complaint.jsp?success=true");

        } else {

            response.sendRedirect(
                    "raise-complaint.jsp?error=true");

        }

    }

}