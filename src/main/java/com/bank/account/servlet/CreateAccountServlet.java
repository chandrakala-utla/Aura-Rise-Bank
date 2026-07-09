package com.bank.account.servlet;

import java.io.IOException;

import com.bank.account.Account;
import com.bank.account.AccountDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accountType =
                request.getParameter("accountType");

        double balance =
                Double.parseDouble(
                        request.getParameter("balance"));

        AccountDAO dao = new AccountDAO();

        Account account = new Account();

        account.setUserId(user.getUserId());

        account.setAccountNumber(
                dao.generateAccountNumber());

        account.setAccountType(accountType);

        account.setBalance(balance);

        account.setStatus("ACTIVE");

        boolean result =
                dao.createAccount(account);

        if(result) {

            Account createdAccount =
                    dao.getAccountByNumber(
                            account.getAccountNumber());

            Transaction transaction =
                    new Transaction();

            transaction.setAccountId(
                    createdAccount.getAccountId());

            transaction.setTransactionType(
                    "DEPOSIT");

            transaction.setAmount(
                    balance);

            transaction.setBalanceAfter(
                    balance);

            TransactionDAO transactionDAO =
                    new TransactionDAO();

            transactionDAO.addTransaction(
                    transaction);

            session.setAttribute(
                    "accountNumber",
                    account.getAccountNumber());

            response.sendRedirect(
            		"message.jsp?icon=success"
            		+ "&title=Account Created"
            		+ "&text=Your Account Has Been Created Successfully"
            		+ "&redirect=DashboardServlet");

        } else {

        	response.sendRedirect(
        			"message.jsp?icon=error"
        			+ "&title=Account Creation Failed"
        			+ "&text=Unable To Create Account"
        			+ "&redirect=create-account.jsp");
        }
    }
}