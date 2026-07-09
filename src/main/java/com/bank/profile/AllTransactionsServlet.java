package com.bank.profile;

import java.io.IOException;
import java.util.List;

import com.bank.model.User;
import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AllTransactionsServlet")
public class AllTransactionsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        User user = (User) session.getAttribute("user");

        TransactionDAO dao = new TransactionDAO();

        List<Transaction> transactions =
                dao.getAllTransactionsByUserId(user.getUserId());

        request.setAttribute("transactions", transactions);

        request.getRequestDispatcher("all-transactions.jsp")
               .forward(request, response);

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}