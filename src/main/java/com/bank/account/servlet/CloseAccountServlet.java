package com.bank.account.servlet;

import java.io.IOException;

import com.bank.account.Account;
import com.bank.account.AccountDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber =
                request.getParameter("accountNumber");

        AccountDAO dao =
                new AccountDAO();

        Account account =
                dao.getAccountByNumber(accountNumber);

        if(account == null) {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Request Failed"
                    + "&text=Account Not Found"
                    + "&redirect=ViewAccountsServlet");

            return;
        }

        if(account.getBalance() > 0) {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Request Failed"
                    + "&text=Account Balance Must Be Zero"
                    + "&redirect=ViewAccountsServlet");

            return;
        }

        if("PENDING".equals(account.getClosureRequest())) {

            response.sendRedirect(
                    "message.jsp?icon=info"
                    + "&title=Request Already Sent"
                    + "&text=Your Closure Request Is Waiting For Admin Approval"
                    + "&redirect=ViewAccountsServlet");

            return;
        }

        dao.requestClosure(accountNumber);

        response.sendRedirect(
                "message.jsp?icon=success"
                + "&title=Request Submitted"
                + "&text=Your Account Closure Request Has Been Sent To The Administrator"
                + "&redirect=ViewAccountsServlet");
    }
}