package com.bank.transaction.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.account.Account;
import com.bank.account.AccountDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DepositPageServlet")
public class DepositPageServlet extends HttpServlet {

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
    	
        AccountDAO dao = new AccountDAO();

        List<Account> accounts =
                dao.getAccountsByUserId(
                        user.getUserId());

        request.setAttribute(
                "accounts",
                accounts);

        request.getRequestDispatcher(
                "deposit.jsp")
                .forward(request, response);
        
    }
}