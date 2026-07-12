package com.bank.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter({
    "/AdminDashboardServlet",
    "/AdminViewCustomersServlet",
    "/AdminViewAccountsServlet",
    "/AdminViewTransactionsServlet",
    "/ClosureRequestsServlet",
    "/ApproveClosureServlet",
    "/RejectClosureServlet",
    "/UpdateContactStatusServlet",
    "/admin-dashboard.jsp"
})
public class AdminAuthenticationFilter extends HttpFilter implements Filter {

    @Override
    protected void doFilter(HttpServletRequest request,
                            HttpServletResponse response,
                            FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}