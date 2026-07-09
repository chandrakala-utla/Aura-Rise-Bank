package com.bank.admin;

import java.io.IOException;

import com.bank.account.AccountDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ApproveClosureServlet")
public class ApproveClosureServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int accountId =
                Integer.parseInt(request.getParameter("id"));

        AccountDAO dao = new AccountDAO();

        dao.approveClosure(accountId);

        response.sendRedirect("ClosureRequestsServlet");
    }

}