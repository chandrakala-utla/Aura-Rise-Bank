package com.bank.admin;

import java.io.IOException;
import java.util.List;

import com.bank.account.Account;
import com.bank.account.AccountDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ClosureRequestsServlet")
public class ClosureRequestsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("admin-login.jsp");
            return;
        }

        AccountDAO dao = new AccountDAO();

        List<Account> requests = dao.getAllClosureRequests();

        request.setAttribute("requests", requests);
        request.setAttribute("page", "requests");

        request.getRequestDispatcher("admin-dashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}