<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.bank.beneficiary.Beneficiary" %>

<%
List<Beneficiary> beneficiaries =
        (List<Beneficiary>)
        request.getAttribute("beneficiaries");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | My Beneficiaries</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",sans-serif;
}

body{

    background:linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);

    min-height:100vh;

    overflow-x:hidden;
}

/* Background */

body::before{

    content:"";

    position:fixed;

    width:350px;

    height:350px;

    border-radius:50%;

    background:rgba(212,160,23,.15);

    top:-120px;

    left:-120px;

    z-index:-1;
}

body::after{

    content:"";

    position:fixed;

    width:260px;

    height:260px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-90px;

    right:-90px;

    z-index:-1;
}

/* Container */

.container{

    width:95%;

    max-width:1350px;

    margin:35px auto;
}

/* Header */

.header-card{

    background:white;

    border-radius:24px;

    border-top:6px solid #D4A017;

    padding:30px;

    text-align:center;

    box-shadow:0 20px 45px rgba(0,0,0,.20);

    margin-bottom:35px;
}

.logo img{

    width:180px;

    margin-bottom:10px;
}

.header-card h2{

    color:#0B2E6F;

    font-size:36px;

    margin-bottom:8px;
}

.header-card p{

    color:#64748B;

}

/* Grid */

.grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));

    gap:25px;
}

/* Card */

.card{

    background:white;

    border-radius:22px;

    border-top:6px solid #D4A017;

    padding:28px;

    box-shadow:0 15px 35px rgba(0,0,0,.18);

    transition:.3s;
}

.card:hover{

    transform:translateY(-6px);
}

.icon{

    width:80px;

    height:80px;

    border-radius:50%;

    background:#EEF4FF;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:42px;

    margin:0 auto 20px;
}
.card h3{

    color:#0B2E6F;

    font-size:25px;

    margin-bottom:20px;
}

.info{

    margin-bottom:15px;
}

.info label{

    display:block;

    color:#64748B;

    font-size:14px;

    margin-bottom:4px;
}

.info p{

    font-weight:bold;

    color:#1F2937;

    font-size:17px;
}

/* Buttons */

.delete-btn{

    display:block;

    margin-top:22px;

    text-align:center;

    background:#DC2626;

    color:white;

    padding:13px;

    text-decoration:none;

    border-radius:10px;

    font-weight:bold;

    transition:.3s;
}

.delete-btn:hover{

    background:#B91C1C;
}

.empty{

    background:white;

    border-radius:20px;

    padding:50px;

    text-align:center;

    color:#64748B;

    box-shadow:0 15px 35px rgba(0,0,0,.18);
}

/* Bottom */

.bottom{

    margin-top:40px;

    text-align:center;
}

.dashboard-btn{

    display:inline-block;

    background:#0B2E6F;

    color:white;

    text-decoration:none;

    padding:15px 35px;

    border-radius:10px;

    font-weight:bold;

    transition:.3s;
}

.dashboard-btn:hover{

    background:#D4A017;

    color:#0B2E6F;
}

.footer{

    margin:35px 0 25px;

    color:white;

    text-align:center;
}

.footer-line{

    width:180px;

    height:3px;

    background:#D4A017;

    margin:0 auto 15px;
}

.footer p{

    color:#E5E7EB;
}

</style>

</head>
<body>

<div class="container">

    <!-- Header -->

    <div class="header-card">

        <div class="logo">

            <img src="images/aurarise-logo.png"
                 alt="AURA RISE BANK">

        </div>

        <h2>

            👥 My Beneficiaries

        </h2>

        <p>

            Manage all your registered beneficiaries securely.

        </p>

    </div>

    <!-- Beneficiary Cards -->

    <div class="grid">

<%

if(beneficiaries != null &&
   !beneficiaries.isEmpty()){

for(Beneficiary beneficiary : beneficiaries){

%>

        <div class="card">

            <div class="icon">
              👥
            </div>

            <h3>

                <%= beneficiary.getBeneficiaryName() %>

            </h3>

            <div class="info">

                <label>

                    Beneficiary ID

                </label>

                <p>

                    <%= beneficiary.getBeneficiaryId() %>

                </p>

            </div>

            <div class="info">

                <label>

                    Account Number

                </label>

                <p>

                    <%= beneficiary.getBeneficiaryAccountNumber() %>

                </p>

            </div>
            <a
            href="DeleteBeneficiaryServlet?id=<%= beneficiary.getBeneficiaryId() %>"
            class="delete-btn"
            onclick="return confirm('Are you sure you want to delete this beneficiary?');">

                🗑 Remove Beneficiary

            </a>

        </div>

<%

    }

}else{

%>

    <div class="empty">

        <div style="font-size:70px;margin-bottom:20px;">

            👥

        </div>

        <h2
        style="
        color:#0B2E6F;
        margin-bottom:12px;">

            No Beneficiaries Found

        </h2>

        <p
        style="
        margin-bottom:25px;">

            No beneficiaries have been added to your account yet.

        </p>

        <a
        href="add-beneficiary.jsp"
        class="dashboard-btn">

            👤 Add New Beneficiary

        </a>

    </div>

<%

}

%>

    </div>

    <!-- Bottom Section -->

    <div class="bottom">

        <a href="DashboardServlet"
           class="dashboard-btn">

            🏠 Back To Dashboard

        </a>

        <div class="footer">

            <div class="footer-line"></div>

            <p>

                © 2026 <b>AURA RISE BANK</b>

                • Secure Today. Prosper Tomorrow.

            </p>

        </div>

    </div>

</div>

</body>

</html>