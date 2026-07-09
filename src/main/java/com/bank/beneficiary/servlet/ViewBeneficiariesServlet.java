package com.bank.beneficiary.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.beneficiary.Beneficiary;
import com.bank.beneficiary.BeneficiaryDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewBeneficiariesServlet")
public class ViewBeneficiariesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        BeneficiaryDAO dao =
                new BeneficiaryDAO();

        List<Beneficiary> beneficiaries =
                dao.getBeneficiariesByUserId(
                        user.getUserId());

        request.setAttribute(
                "beneficiaries",
                beneficiaries);

        request.getRequestDispatcher(
                "view-beneficiaries.jsp")
                .forward(request, response);
    }
}