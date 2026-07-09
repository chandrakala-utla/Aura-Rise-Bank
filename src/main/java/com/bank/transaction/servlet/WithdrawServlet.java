package com.bank.transaction.servlet;

import java.io.IOException;

import com.bank.account.Account;
import com.bank.account.AccountDAO;
import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bank.notification.Notification;
import com.bank.notification.NotificationDAO;

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber =
                request.getParameter("accountNumber");

        double amount =
                Double.parseDouble(
                        request.getParameter("amount"));

        AccountDAO accountDAO =
                new AccountDAO();

        Account account =
                accountDAO.getAccountByNumber(
                        accountNumber);

        if(account == null) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Withdraw Failed"
        			+ "&text=Invalid Account Number"
        			+ "&redirect=withdraw.jsp");

            return;
        }
        if("CLOSED".equals(account.getStatus())) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Withdraw Failed"
        			+ "&text=Account Is Closed"
        			+ "&redirect=withdraw.jsp");

            return;
        }

        if(amount > account.getBalance()) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Withdraw Failed"
        			+ "&text=Insufficient Balance"
        			+ "&redirect=withdraw.jsp");

            return;
        }

        double newBalance =
                account.getBalance() - amount;

        boolean updated =
                accountDAO.updateBalance(
                        account.getAccountId(),
                        newBalance);

        if(updated) {

            Transaction transaction =
                    new Transaction();

            transaction.setAccountId(
                    account.getAccountId());

            transaction.setTransactionType(
                    "WITHDRAW");

            transaction.setAmount(
                    amount);

            transaction.setBalanceAfter(
                    newBalance);

            // New Fields

            transaction.setFromAccount(
                    account.getAccountNumber());

            transaction.setToAccount("-");

            TransactionDAO transactionDAO =
                    new TransactionDAO();

            transactionDAO.addTransaction(
                    transaction);
         // ==========================
         // Save Notification
         // ==========================

         Notification notification =
                 new Notification();

         notification.setUserId(
                 account.getUserId());

         notification.setTitle(
                 "Withdrawal Successful");

         notification.setMessage(
                 "₹" + amount +
                 " has been withdrawn successfully from Account "
                 + account.getAccountNumber() + ".");

         NotificationDAO notificationDAO =
                 new NotificationDAO();

         notificationDAO.addNotification(
                 notification);

            response.sendRedirect(
            		"message.jsp?icon=success"
            		+ "&title=Withdraw Successful"
            		+ "&text=Amount Withdrawn Successfully"
            		+ "&redirect=DashboardServlet");

        } else {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Withdraw Failed"
        			+ "&text=Unable To Process Withdrawal"
        			+ "&redirect=withdraw.jsp");
        }
    }
}