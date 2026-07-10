<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.bank.model.User"%>

<%
User user=(User)session.getAttribute("user");

Integer totalAccounts=
(Integer)request.getAttribute("totalAccounts");

Double totalBalance=
(Double)request.getAttribute("totalBalance");

Integer totalBeneficiaries=
(Integer)request.getAttribute("totalBeneficiaries");

Integer totalTransactions=
(Integer)request.getAttribute("totalTransactions");
Integer unreadNotifications =
(Integer)request.getAttribute("unreadNotifications");
%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
SimpleDateFormat sdf =
new SimpleDateFormat("EEEE, dd MMMM yyyy");

String today =
sdf.format(new Date());

// Later we'll fetch from DB
String lastLogin = "Today, 10:15 AM";
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Dashboard</title>

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{

background:#F4FBF8;

color:#1E293B;

}

/* ================= HEADER ================= */

.header{

background:linear-gradient(135deg,#0B2E6F,#123D91);

padding:18px 40px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 8px 18px rgba(0,0,0,.15);

border-bottom:4px solid #D4A017;

}

.logo-area{

display:flex;

align-items:center;

gap:18px;

}

.logo-area img{

width:95px;

height:auto;

display:block;

}

.bank-title h1{

font-size:28px;

color:white;

letter-spacing:1px;

margin-bottom:5px;

}

.bank-title p{

font-size:15px;

color:#F8FAFC;

opacity:.9;

}

.header-right{

display:flex;

align-items:center;

gap:18px;

}

.user-box{

display:flex;

align-items:center;

gap:12px;

color:white;

}

.profile-btn{

width:48px;

height:48px;

border-radius:50%;

background:white;

display:flex;

justify-content:center;

align-items:center;

font-size:24px;

text-decoration:none;

transition:.3s;

color:#0B2E6F;

}

.profile-btn:hover{

background:#D4A017;

color:white;

transform:scale(1.08);

}

.user-name{

font-size:20px;

font-weight:bold;

}

.user-text{

font-size:14px;

opacity:.9;

}

.logout-btn{

background:#EF4444;

padding:12px 26px;

border-radius:10px;

color:white;

text-decoration:none;

font-weight:bold;

transition:.3s;

}

.logout-btn:hover{

background:#DC2626;

}

/* ================= CONTAINER ================= */

.container{

width:95%;

max-width:1450px;

margin:35px auto;

}

/* ================= WELCOME ================= */

.welcome-card{

background:white;

border-radius:22px;

padding:32px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 8px 20px rgba(0,0,0,.08);

border-left:5px solid #D4A017;

margin-bottom:32px;

}

.welcome-text h2{

font-size:42px;

color:#0B2E6F;

margin-bottom:15px;

}

.welcome-text p{

font-size:18px;

color:#64748B;

line-height:30px;

max-width:700px;

}

.bank-welcome-icon{

    font-size:130px;
    line-height:1;

    position:relative;
    top:-12px;
}

/* ================= STATS ================= */

.stats-container{

display:grid;

grid-template-columns:repeat(4,1fr);

gap:24px;

margin-bottom:40px;

}

.stat-card{

background:white;

padding:28px;

border-radius:20px;

box-shadow:0 8px 20px rgba(0,0,0,.08);

transition:.3s;

border-top:4px solid #D4A017;

}

.stat-card:hover{

transform:translateY(-8px);

box-shadow:0 18px 35px rgba(0,0,0,.15);

}

.stat-icon{

    width:64px;
    height:64px;

    border-radius:50%;
    background:#EEF4FF;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:34px;      /* Original size */
    margin-bottom:20px;
}
.bank-stat-icon{

    font-size:42px;
    line-height:1;

    position:relative;
    top:-8px;
}

.stat-title{

font-size:16px;

color:#64748B;

margin-bottom:10px;

}

.stat-value{

font-size:42px;

font-weight:bold;

color:#0B2E6F;

}

/* ================= SECTION ================= */

.section-title{

font-size:34px;

color:#0B2E6F;

margin-bottom:25px;

}

/* ================= SERVICES ================= */

.actions-grid{

display:grid;

grid-template-columns:repeat(4,1fr);

gap:24px;

margin-bottom:40px;

}

.service-card{

background:white;

border-radius:20px;

padding:28px;

text-decoration:none;

color:#1E293B;

box-shadow:0 8px 20px rgba(0,0,0,.08);

transition:.35s;

border:2px solid transparent;

}

.service-card:hover{

transform:translateY(-8px);

border-color:#D4A017;

box-shadow:0 18px 35px rgba(0,0,0,.15);

}

.service-icon{

    width:64px;
    height:64px;

    border-radius:50%;
    background:#EEF4FF;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:34px;      
    margin-bottom:20px;
}

.bank-icon{

    font-size:42px;
    line-height:1;

    position:relative;
    top:-7px;     /* Move the icon upward */
}

.service-title{

font-size:23px;

font-weight:bold;

color:#0B2E6F;

margin-bottom:12px;

}

.service-desc{

color:#64748B;

font-size:15px;

line-height:25px;

min-height:60px;

}

.service-open{

margin-top:20px;

font-weight:bold;

color:#D4A017;

}

/* ================= INFO ================= */

.info-section{

display:grid;

grid-template-columns:repeat(2,1fr);

gap:24px;

}

.info-card{

background:white;

padding:30px;

border-radius:20px;

box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.info-card h3{

font-size:26px;

color:#0B2E6F;

margin-bottom:15px;

}

.info-card p{

line-height:30px;

color:#64748B;

font-size:16px;

}

/* ================= FOOTER ================= */

.footer{

margin:45px 0 20px;

text-align:center;

font-size:15px;

color:#64748B;

}

/* ================= RESPONSIVE ================= */

@media(max-width:1100px){

.stats-container,
.actions-grid{

grid-template-columns:repeat(2,1fr);

}

.info-section{

grid-template-columns:1fr;

}

}

@media(max-width:750px){

.header{

flex-direction:column;

gap:20px;

text-align:center;

}

.logo-area{

flex-direction:column;

}

.stats-container,
.actions-grid{

grid-template-columns:1fr;

}

.welcome-card{

flex-direction:column;

text-align:center;

gap:25px;

}

}

</style>

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

    <div class="logo-area">

        <img src="images/logo2.jpeg"
             alt="AURARISE BANK">

        <div class="bank-title">

            <h1>AURA RISE BANK</h1>

            <p>Secure Today. Prosper Tomorrow.</p>

        </div>

    </div>

    <div class="header-right">

        <div class="user-box">

            <a href="ProfileServlet"
               class="profile-btn">

                👤

            </a>

            <div>

                <div class="user-name">

                    <%= user!=null ? user.getFullName() : "Customer" %>

                </div>

                <div class="user-text">

                    Welcome Back!

                </div>

            </div>

        </div>

        <a href="LogoutServlet"
           class="logout-btn">

            Logout

        </a>

    </div>

</div>

<!-- ================= CONTAINER ================= -->

<div class="container">

<!-- ================= WELCOME ================= -->

<div class="welcome-card">

    <div class="welcome-text">

        <h2>

            Welcome,

            <%= user!=null ? user.getFullName() : "Customer" %>

            👋

        </h2>

        <p>

            Welcome back to <b>AURA RISE BANK</b>.

            Manage your accounts, transfer funds, make secure payments,
            and enjoy a modern digital banking experience.

        </p>

    </div>

    <div class="welcome-image">
        <span class="bank-welcome-icon">🏛</span>
    </div>

</div>

<!-- ================= STATISTICS ================= -->

<div class="stats-container">

    <div class="stat-card">

        <div class="stat-icon">
            <span class="bank-stat-icon">🏛</span>
        </div>

        <div class="stat-title">

            Total Accounts

        </div>

        <div class="stat-value">

            <%= totalAccounts!=null ? totalAccounts : 0 %>

        </div>

    </div>

    <div class="stat-card">

        <div class="stat-icon">

            💰

        </div>

        <div class="stat-title">

            Total Balance

        </div>

        <div class="stat-value">

            ₹<%= String.format("%.2f",
            totalBalance!=null ? totalBalance : 0.0) %>

        </div>

    </div>

    <div class="stat-card">

        <div class="stat-icon">

            👥

        </div>

        <div class="stat-title">

            Beneficiaries

        </div>

        <div class="stat-value">

            <%= totalBeneficiaries!=null ? totalBeneficiaries : 0 %>

        </div>

    </div>

    <div class="stat-card">

        <div class="stat-icon">

            📜

        </div>

        <div class="stat-title">

            Transactions

        </div>

        <div class="stat-value">

            <%= totalTransactions!=null ? totalTransactions : 0 %>

        </div>

    </div>

</div>

<!-- ================= QUICK SERVICES ================= -->

<h2 class="section-title">

Quick Banking Services

</h2>

<div class="actions-grid">

<a href="create-account.jsp" class="service-card">

    <div class="service-icon">➕</div>

    <div class="service-title">
        Create Account
    </div>

    <div class="service-desc">
        Open a new Savings or Current Account instantly.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="ViewAccountsServlet" class="service-card">

    <div class="service-icon"><span class="bank-icon">🏛</span></div>

    <div class="service-title">
        View Accounts
    </div>

    <div class="service-desc">
        View all your bank accounts and current balances.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="DepositPageServlet" class="service-card">

    <div class="service-icon">💰</div>

    <div class="service-title">
        Deposit Money
    </div>

    <div class="service-desc">
        Deposit money securely into your selected account.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="WithdrawPageServlet" class="service-card">

    <div class="service-icon">💸</div>

    <div class="service-title">
        Withdraw Money
    </div>

    <div class="service-desc">
        Withdraw available funds safely from your account.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="TransferPageServlet" class="service-card">

    <div class="service-icon">🔄</div>

    <div class="service-title">
        Transfer Money
    </div>

    <div class="service-desc">
        Transfer money instantly to your beneficiaries.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="add-beneficiary.jsp" class="service-card">

    <div class="service-icon">👤</div>

    <div class="service-title">
        Add Beneficiary
    </div>

    <div class="service-desc">
        Register trusted beneficiaries for secure fund transfers.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="ViewBeneficiariesServlet" class="service-card">

    <div class="service-icon">👥</div>

    <div class="service-title">
        View Beneficiaries
    </div>

    <div class="service-desc">
        Manage and view all your registered beneficiaries.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>

<a href="AllTransactionsServlet" class="service-card">

    <div class="service-icon">📜</div>

    <div class="service-title">
        Transaction History
    </div>

    <div class="service-desc">
        View your complete banking transaction history.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>
<a href="raise-complaint.jsp" class="service-card">

    <div class="service-icon">
        📝
    </div>

    <div class="service-title">
        Raise Complaint
    </div>

    <div class="service-desc">
        Submit complaints regarding your account, transactions or banking services.
    </div>

    <div class="service-open">
        Open →
    </div>

</a>
<a href="MyComplaintsServlet" class="service-card">

    <div class="service-icon">📨</div>

    <div class="service-title">

        My Complaints

    </div>

    <div class="service-desc">

        Track your complaint status and view the bank's response.

    </div>

    <div class="service-open">

        Open →

    </div>

</a>
<a href="NotificationServlet" class="service-card">

    <div class="service-icon">

        🔔

    </div>

    <div class="service-title">

        Notifications

        <% if(unreadNotifications != null && unreadNotifications > 0){ %>

            (<%= unreadNotifications %>)

        <% } %>

    </div>

    <div class="service-desc">

        View all banking alerts, deposits,
        transfers, complaints and account updates.

    </div>

    <div class="service-open">

        Open →

    </div>

</a>
</div>

<!-- ================= INFORMATION ================= -->

<div class="info-section">

    <div class="info-card">

        <h3>

            🏛 Banking Overview

        </h3>

        <p>

            Manage multiple accounts, transfer money, deposit funds,
            withdraw cash, add beneficiaries and monitor every
            transaction from one secure banking dashboard.

        </p>

    </div>

    <div class="info-card">

        <h3>

            🛡 Security Status

        </h3>

        <p>

            Your banking session is encrypted and secure.
            Always logout after completing your banking activities.
            Never share your OTP, PIN or password with anyone.

        </p>

    </div>

</div>

<!-- ================= FOOTER ================= -->

<div class="footer">

    © 2026 AURA RISE BANK • Secure Today. Prosper Tomorrow.

</div>

</div>

</body>

</html>

</body>

</html>

</body>
</html>
