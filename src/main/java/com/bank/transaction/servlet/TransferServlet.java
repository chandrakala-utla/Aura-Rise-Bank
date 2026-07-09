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
@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fromAccountNumber =
                request.getParameter("fromAccount");

        String toAccountNumber =
                request.getParameter("toAccount");
        if(toAccountNumber == null ||
        		   toAccountNumber.trim().isEmpty()) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Enter Receiver Account Number"
        			+ "&redirect=transfer.jsp");

        			return;
        		}

        double amount =
                Double.parseDouble(
                        request.getParameter("amount"));

        AccountDAO accountDAO =
                new AccountDAO();

        Account sender =
                accountDAO.getAccountByNumber(
                        fromAccountNumber);

        Account receiver =
                accountDAO.getAccountByNumber(
                        toAccountNumber);

        if(sender == null || receiver == null) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Invalid Account Number"
        			+ "&redirect=transfer.jsp");

        			return;
        }

        if("CLOSED".equals(sender.getStatus())) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Source Account Is Closed"
        			+ "&redirect=transfer.jsp");

        			return;
        }

        if("CLOSED".equals(receiver.getStatus())) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Destination Account Is Closed"
        			+ "&redirect=transfer.jsp");

        			return;
        }

        if(sender.getAccountNumber()
                .equals(receiver.getAccountNumber())) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Cannot Transfer To Same Account"
        			+ "&redirect=transfer.jsp");

        			return;
        }
        if(amount <= 0) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Amount Must Be Greater Than Zero"
        			+ "&redirect=transfer.jsp");

        			return;
        }
        if(amount > sender.getBalance()) {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Insufficient Balance"
        			+ "&redirect=transfer.jsp");

        			return;
        }

        double senderNewBalance =
                sender.getBalance() - amount;

        double receiverNewBalance =
                receiver.getBalance() + amount;

        boolean senderUpdated =
                accountDAO.updateBalance(
                        sender.getAccountId(),
                        senderNewBalance);

        boolean receiverUpdated =
                accountDAO.updateBalance(
                        receiver.getAccountId(),
                        receiverNewBalance);

        if(senderUpdated && receiverUpdated) {

            TransactionDAO transactionDAO =
                    new TransactionDAO();

            Transaction transferOut =
                    new Transaction();

            transferOut.setAccountId(
                    sender.getAccountId());

            transferOut.setTransactionType(
                    "TRANSFER_OUT");

            transferOut.setAmount(amount);

            transferOut.setBalanceAfter(
                    senderNewBalance);

            // New Fields

            transferOut.setFromAccount(
                    sender.getAccountNumber());

            transferOut.setToAccount(
                    receiver.getAccountNumber());

            transactionDAO.addTransaction(
                    transferOut);
            
            NotificationDAO notificationDAO =
                    new NotificationDAO();


            // Sender Notification

            Notification senderNotification =
                    new Notification();

            senderNotification.setUserId(
                    sender.getUserId());

            senderNotification.setTitle(
                    "Transfer Successful");

            senderNotification.setMessage(
                    "₹" + amount
                    + " has been transferred successfully to Account "
                    + receiver.getAccountNumber() + ".");

            notificationDAO.addNotification(
                    senderNotification);


            // Receiver Notification

            Notification receiverNotification =
                    new Notification();

            receiverNotification.setUserId(
                    receiver.getUserId());

            receiverNotification.setTitle(
                    "Amount Received");

            receiverNotification.setMessage(
                    "₹" + amount
                    + " has been received from Account "
                    + sender.getAccountNumber() + ".");

            notificationDAO.addNotification(
                    receiverNotification);

            Transaction transferIn =
                    new Transaction();

            transferIn.setAccountId(
                    receiver.getAccountId());

            transferIn.setTransactionType(
                    "TRANSFER_IN");

            transferIn.setAmount(amount);

            transferIn.setBalanceAfter(
                    receiverNewBalance);

            // New Fields

            transferIn.setFromAccount(
                    sender.getAccountNumber());

            transferIn.setToAccount(
                    receiver.getAccountNumber());

            transactionDAO.addTransaction(
                    transferIn);

            response.sendRedirect(
            		"message.jsp?icon=success"
            		+ "&title=Transfer Successful"
            		+ "&text=Amount Transferred Successfully"
            		+ "&redirect=DashboardServlet");

        } else {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Transfer Failed"
        			+ "&text=Unable To Transfer Amount"
        			+ "&redirect=transfer.jsp");
        }
    }
}