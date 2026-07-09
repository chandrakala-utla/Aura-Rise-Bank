package com.bank.admin;

import java.io.IOException;
import java.util.List;

import com.bank.dao.UserDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminViewCustomersServlet")
public class AdminViewCustomersServlet extends HttpServlet {

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

        UserDAO dao = new UserDAO();

        String keyword = request.getParameter("search");

        List<User> customers;

        if(keyword != null && !keyword.trim().isEmpty()){
            customers = dao.searchCustomers(keyword);
        }else{
            customers = dao.getAllCustomers();
        }
      
        request.setAttribute("customers", customers);
        request.setAttribute("page", "customers");

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