package com.bank.admin;

import java.io.IOException;
import com.bank.contact.ContactDAO;
import com.bank.account.AccountDAO;
import com.bank.dao.UserDAO;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }
        String page = request.getParameter("page");

        if(page == null){
            page = "dashboard";
        }

        request.setAttribute("page", page);

        UserDAO userDAO = new UserDAO();
        AccountDAO accountDAO = new AccountDAO();
        TransactionDAO transactionDAO = new TransactionDAO();

        String adminName = "Administrator";
        String username = "admin";
        String role = "System Administrator";

        request.setAttribute("adminName", adminName);
        request.setAttribute("username", username);
        request.setAttribute("role", role);

        request.setAttribute("databaseStatus", "Connected");
        request.setAttribute("serverStatus", "Running");
        request.setAttribute("version", "1.0");

        request.setAttribute("latestActivities",
                transactionDAO.getLatestActivities());

        request.setAttribute("totalCustomers",
                userDAO.getTotalUsers());

        request.setAttribute("totalAccounts",
                accountDAO.getTotalAccounts());

        request.setAttribute("activeAccounts",
                accountDAO.getActiveAccounts());

        request.setAttribute("totalTransactions",
                transactionDAO.getTotalTransactions());
     // ===============================
     // Contact Messages
     // ===============================

     if(page.equals("messages")){

         ContactDAO contactDAO = new ContactDAO();

         request.setAttribute(
                 "messages",
                 contactDAO.getAllMessages()
         );

     }
        // Open Dashboard
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