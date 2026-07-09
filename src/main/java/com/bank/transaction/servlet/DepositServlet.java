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

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {

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
        if(amount <= 0) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Deposit Failed"
        			+ "&text=Amount Must Be Greater Than Zero"
        			+ "&redirect=deposit.jsp");

        			return;
        }

        AccountDAO accountDAO = new AccountDAO();

        Account account =
                accountDAO.getAccountByNumber(accountNumber);
       
        if(account == null) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Deposit Failed"
        			+ "&text=Account Not Found"
        			+ "&redirect=deposit.jsp");

        			return;
        }
        

        if("CLOSED".equals(account.getStatus())) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Deposit Failed"
        			+ "&text=Account Is Closed"
        			+ "&redirect=deposit.jsp");

        			return;
        }
        double newBalance =
                account.getBalance() + amount;

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
                    "DEPOSIT");

            transaction.setAmount(amount);

            transaction.setBalanceAfter(
                    newBalance);

            // New Fields

            transaction.setFromAccount("-");

            transaction.setToAccount(
                    account.getAccountNumber());
            TransactionDAO transactionDAO =
                    new TransactionDAO();

            transactionDAO.addTransaction(
                    transaction);
            Notification notification =
                    new Notification();

            notification.setUserId(
                    account.getUserId());

            notification.setTitle(
                    "Deposit Successful");

            notification.setMessage(
                    "₹" + amount +
                    " has been deposited successfully into Account "
                    + account.getAccountNumber() + ".");

            NotificationDAO notificationDAO =
                    new NotificationDAO();

            notificationDAO.addNotification(
                    notification);

            response.sendRedirect(
            		"message.jsp?icon=success"
            		+ "&title=Deposit Successful"
            		+ "&text=Amount Deposited Successfully"
            		+ "&redirect=DashboardServlet");

        } else {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Deposit Failed"
        			+ "&text=Unable To Deposit Amount"
        			+ "&redirect=deposit.jsp");
        }
    }
}