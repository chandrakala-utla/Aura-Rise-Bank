package com.bank.transaction.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.account.Account;
import com.bank.account.AccountDAO;
import com.bank.model.User;
import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {

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

        String accountNumber =
                request.getParameter("accountNumber");

        AccountDAO accountDAO =
                new AccountDAO();

        Account account =
                accountDAO.getAccountByNumber(
                        accountNumber);

        TransactionDAO transactionDAO =
                new TransactionDAO();

        String type =
                request.getParameter("type");

        List<Transaction> transactions;

        if(type != null && !type.equals("ALL")) {

            transactions =
                    transactionDAO.getTransactionsByType(
                            account.getAccountId(),
                            type);

        } else {

            transactions =
                    transactionDAO.getTransactionsByAccountId(
                            account.getAccountId());
        }

        request.setAttribute(
                "transactions",
                transactions);

        request.setAttribute(
                "accountNumber",
                accountNumber);

        request.setAttribute(
                "selectedType",
                type);

        request.getRequestDispatcher(
                "transaction-history.jsp")
                .forward(request, response);
    }
}