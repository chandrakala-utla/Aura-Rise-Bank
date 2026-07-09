package com.bank.beneficiary.servlet;

import java.io.IOException;

import com.bank.beneficiary.BeneficiaryDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.bank.model.User;
import com.bank.notification.Notification;
import com.bank.notification.NotificationDAO;
@WebServlet("/DeleteBeneficiaryServlet")
public class DeleteBeneficiaryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int beneficiaryId =
                Integer.parseInt(
                        request.getParameter(
                                "id"));

        BeneficiaryDAO dao =
                new BeneficiaryDAO();
        HttpSession session =
                request.getSession(false);

        User user =
                (User) session.getAttribute("user");
        dao.deleteBeneficiary(
                beneficiaryId);
        Notification notification =
                new Notification();

        notification.setUserId(
                user.getUserId());

        notification.setTitle(
                "Beneficiary Removed");

        notification.setMessage(
                "A beneficiary has been removed successfully.");

        NotificationDAO notificationDAO =
                new NotificationDAO();

        notificationDAO.addNotification(
                notification);
        response.sendRedirect(
                "ViewBeneficiariesServlet");
    }
}