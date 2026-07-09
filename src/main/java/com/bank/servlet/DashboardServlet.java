package com.bank.servlet;

import java.io.IOException;

import com.bank.account.AccountDAO;
import com.bank.beneficiary.BeneficiaryDAO;
import com.bank.model.User;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.bank.notification.NotificationDAO;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
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

        NotificationDAO notificationDAO =
                new NotificationDAO();

        int unreadNotifications =
                notificationDAO.getUnreadCount(
                        user.getUserId());
        System.out.println("Unread Notifications = " + unreadNotifications);

        int userId = user.getUserId();

        AccountDAO accountDAO =
                new AccountDAO();

        BeneficiaryDAO beneficiaryDAO =
                new BeneficiaryDAO();

        TransactionDAO transactionDAO =
                new TransactionDAO();

        int totalAccounts =
                accountDAO.getTotalAccountsByUserId(
                        userId);

        double totalBalance =
                accountDAO.getTotalBalanceByUserId(
                        userId);

        int totalBeneficiaries =
                beneficiaryDAO.getTotalBeneficiariesByUserId(
                        userId);

        int totalTransactions =
                transactionDAO.getTotalTransactionsByUserId(
                        userId);

        request.setAttribute(
                "totalAccounts",
                totalAccounts);

        request.setAttribute(
                "totalBalance",
                totalBalance);

        request.setAttribute(
                "totalBeneficiaries",
                totalBeneficiaries);

        request.setAttribute(
                "totalTransactions",
                totalTransactions);
        request.setAttribute(
                "unreadNotifications",
                unreadNotifications);
        request.getRequestDispatcher(
                "dashboard.jsp")
                .forward(request, response);
    }
}