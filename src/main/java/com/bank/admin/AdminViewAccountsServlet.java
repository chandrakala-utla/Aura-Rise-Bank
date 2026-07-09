package com.bank.admin;

import java.io.IOException;
import java.util.List;

import com.bank.account.Account;
import com.bank.account.AccountDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/AdminViewAccountsServlet")
public class AdminViewAccountsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null || session.getAttribute("admin")==null){
            response.sendRedirect("admin-login.jsp");
            return;
        }

        AccountDAO dao = new AccountDAO();

        String keyword = request.getParameter("search");

        List<Account> accounts;

        if(keyword!=null && !keyword.trim().isEmpty()){
            accounts = dao.searchAccounts(keyword);
        }else{
            accounts = dao.getAllAccounts();
        }

        request.setAttribute("accounts", accounts);
        request.setAttribute("page","accounts");

        request.getRequestDispatcher("admin-dashboard.jsp")
               .forward(request,response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request,response);
    }
}