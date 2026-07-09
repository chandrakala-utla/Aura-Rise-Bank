package com.bank.admin;

import java.io.IOException;
import java.util.List;

import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminViewTransactionsServlet")
public class AdminViewTransactionsServlet extends HttpServlet {

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

        TransactionDAO dao = new TransactionDAO();

        String keyword = request.getParameter("search");

        List<Transaction> transactions;

        if(keyword != null && !keyword.trim().isEmpty()){
            transactions = dao.searchTransactions(keyword);
        }else{
            transactions = dao.getAllTransactions();
        }

        request.setAttribute("transactions", transactions);
        request.setAttribute("page", "transactions");

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