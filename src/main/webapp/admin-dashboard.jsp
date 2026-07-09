<%@page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Integer totalCustomers=(Integer)request.getAttribute("totalCustomers");
Integer totalAccounts=(Integer)request.getAttribute("totalAccounts");
Integer activeAccounts=(Integer)request.getAttribute("activeAccounts");
Integer totalTransactions=(Integer)request.getAttribute("totalTransactions");

if(totalCustomers==null) totalCustomers=0;
if(totalAccounts==null) totalAccounts=0;
if(activeAccounts==null) activeAccounts=0;
if(totalTransactions==null) totalTransactions=0;
%>
<%
String currentPage = (String)request.getAttribute("page");

if(currentPage == null){
    currentPage = "dashboard";
}
%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Admin Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{
background:#EEF3F8;
display:flex;
min-height:100vh;
overflow-x:hidden;
}

/* ===========================
        SIDEBAR
=========================== */

.sidebar{

    width:270px;
    height:100vh;
    background:linear-gradient(180deg,#0B2E6F,#143D92);
    position:fixed;
    left:0;
    top:0;
    color:white;
    box-shadow:6px 0 20px rgba(0,0,0,.15);

}

.logo{

    text-align:center;
    padding:30px 20px;
    border-bottom:1px solid rgba(255,255,255,.15);

}

.logo img{

    width:150px;
    margin-bottom:5px;

}

.logo span{

    color:#D4A017;
    font-size:14px;
    letter-spacing:2px;

}

/* Menu */
.sidebar{

    width:300px;
    height:100vh;
    overflow-y:auto;
 }

.sidebar ul{

    list-style:none;
    padding:25px 15px;

    height:calc(100vh - 170px);

    display:flex;
    flex-direction:column;

}

.sidebar li{

    margin-bottom:12px;
    border-radius:14px;
    overflow:hidden;
    transition:.3s;

}

.sidebar li a{

    display:flex;
    align-items:center;
    gap:15px;

    width:100%;

    padding:16px 20px;

    text-decoration:none;

    color:#FFFFFF;

    font-size:17px;

    font-weight:500;

    transition:.3s;

}

.sidebar li a i{

    width:24px;
    text-align:center;
    font-size:18px;

}

.sidebar li:hover{

    transform:translateX(6px);

}

.sidebar li:hover a{

    background:rgba(255,255,255,.12);

}

.sidebar li.active a{

    background:#D4A017;
    color:#0B2E6F;
    font-weight:700;

}

.sidebar li.logout{

    margin-top:auto;

}

.sidebar li.logout a{

    background:#DC2626;

}

.sidebar li.logout a:hover{

    background:#B91C1C;
    color:white;

}
/* ===========================
        MAIN
=========================== */

.main{

    margin-left:270px;
    width:calc(100% - 270px);

    min-height:100vh;

    display:flex;

    flex-direction:column;

    padding:35px;

}

/* ===========================
        TOPBAR
=========================== */

.topbar{

display:flex;
justify-content:space-between;
align-items:center;

background:white;

padding:20px 30px;

border-radius:18px;

box-shadow:0 8px 25px rgba(0,0,0,.08);

margin-bottom:30px;

}

.topbar h1{

color:#0B2E6F;
font-size:30px;

}

.topbar small{

color:#64748B;
font-size:14px;

}

.top-right{

display:flex;
align-items:center;
gap:25px;

}

.profile{

display:flex;
align-items:center;
gap:15px;

background:#0B2E6F;
color:white;

padding:12px 20px;

border-radius:40px;

}

.profile i{

font-size:22px;

}

/* ===========================
        WELCOME
=========================== */

.welcome{

background:linear-gradient(135deg,#123D91,#0B2E6F);

color:white;

padding:40px;

border-radius:22px;

display:flex;

justify-content:space-between;

align-items:center;

margin-bottom:35px;

box-shadow:0 15px 35px rgba(11,46,111,.25);

}

.welcome h2{

font-size:38px;

margin-bottom:15px;

}

.welcome p{

font-size:17px;

line-height:30px;

opacity:.92;

max-width:700px;

}

.bank-icon{

font-size:95px;

color:#D4A017;

opacity:.9;

}

/* ===========================
        SECTION TITLE
=========================== */

.section-title{

font-size:32px;

color:#0B2E6F;

margin-bottom:8px;

}

.section-subtitle{

color:#64748B;

margin-bottom:30px;

font-size:16px;

}
/* ===================================
            STATISTICS
=================================== */

.stats{

display:grid;

grid-template-columns:repeat(4,1fr);

gap:25px;

margin-bottom:45px;

}

.stat-card{

background:white;

padding:30px;

border-radius:22px;

box-shadow:0 12px 30px rgba(0,0,0,.08);

transition:.35s;

position:relative;

overflow:hidden;

}

.stat-card::before{

content:"";

position:absolute;

left:0;

top:0;

height:5px;

width:100%;

background:#D4A017;

}

.stat-card:hover{

transform:translateY(-10px);

}

.stat-card h4{

margin:18px 0 12px;

color:#64748B;

font-size:17px;

}

.stat-card h2{

font-size:42px;

color:#0B2E6F;

}

.icon{

width:70px;

height:70px;

border-radius:50%;

display:flex;

align-items:center;

justify-content:center;

font-size:28px;

color:white;

}

.blue{

background:#2563EB;

}

.green{

background:#16A34A;

}

.gold{

background:#D4A017;

}

.red{

background:#DC2626;

}

/* ===================================
            GRID
=================================== */
.dashboard-grid{

    display:grid;

    grid-template-columns:2fr 1fr;

    gap:25px;

    margin-top:30px;

    align-items:start;
}

.left-panel{

    background:#fff;

    border-radius:22px;

    padding:25px;

    box-shadow:0 12px 35px rgba(0,0,0,.08);

    display:flex;

    flex-direction:column;

    gap:18px;
}

.right-panel{

    background:#fff;

    border-radius:22px;

    padding:25px;

    box-shadow:0 12px 35px rgba(0,0,0,.08);

    height:fit-content;
}
/* ===================================
        ACTIVITY
=================================== */

.activity{

display:flex;

align-items:center;

gap:18px;

padding:20px;

margin-top:18px;

border-radius:16px;

background:#F8FAFC;

transition:.3s;

}

.activity:hover{

background:#EEF5FF;

}

.activity-icon{

width:60px;

height:60px;

border-radius:50%;

background:#0B2E6F;

display:flex;

justify-content:center;

align-items:center;

color:white;

font-size:22px;

}

.activity h4{

color:#0B2E6F;

margin-bottom:6px;

}

.activity p{

color:#64748B;

}

/* ===================================
            STATUS
=================================== */

.status{

display:flex;

justify-content:space-between;

padding:18px 0;

border-bottom:1px solid #E5E7EB;

}

.status span{

color:#64748B;

}

.status b{

color:#16A34A;

}
/* ===================================
        CUSTOMER TABLE
=================================== */

.customer-table{

    width:100%;

    border-collapse:collapse;

    margin-top:25px;

}

.customer-table thead{

    background:#0B2E6F;

    color:white;

}

.customer-table th{

    padding:16px;

    text-align:left;

    font-size:16px;

}

.customer-table td{

    padding:16px;

    border-bottom:1px solid #E5E7EB;

    color:#374151;

}

.customer-table tbody tr:hover{

    background:#F8FAFC;

}
/* ===================================
            FOOTER
=================================== */

.footer{

    margin-top:auto;

    text-align:center;

    color:#64748B;

    font-size:15px;

    padding:35px 0 20px;

    width:100%;
}

.footer-line{

width:220px;

height:4px;

background:#D4A017;

margin:auto;

margin-bottom:20px;

border-radius:20px;

}

/* ===================================
            RESPONSIVE
=================================== */

@media(max-width:1200px){

.stats{

grid-template-columns:repeat(2,1fr);

}

.operations{

grid-template-columns:repeat(2,1fr);

}

.dashboard-grid{

grid-template-columns:1fr;

}

}

@media(max-width:900px){

.sidebar{

width:90px;

}

.sidebar h2,
.sidebar span{

display:none;

}

.sidebar li{

justify-content:center;

}

.sidebar li a{

    display:flex;

    align-items:center;

    gap:15px;

    width:100%;

    color:inherit;

    text-decoration:none;

}

.sidebar li a i{

    width:24px;

    text-align:center;

}
.sidebar li i{

margin:0;

}

.main{

margin-left:90px;

width:calc(100% - 90px);

}

.topbar{

flex-direction:column;

gap:20px;

}

.search{

width:100%;

}

}

@media(max-width:700px){

.stats{

grid-template-columns:1fr;

}

.operations{

grid-template-columns:1fr;

}

.welcome{

flex-direction:column;

text-align:center;

gap:25px;

}

.bank-icon{

font-size:60px;

}

.top-right{

flex-direction:column;

width:100%;

}

}
/* ===========================
   Customer Search Bar
=========================== */

.search-bar{
    margin:25px 0;
}

.search-bar form{
    display:flex;
    align-items:center;
    gap:15px;
}

.search-bar input{
    width:350px;
    padding:12px 18px;
    border:2px solid #d6dbe8;
    border-radius:10px;
    font-size:15px;
    outline:none;
    transition:.3s;
    background:#fff;
}

.search-bar input:focus{
    border-color:#1b3c88;
    box-shadow:0 0 10px rgba(27,60,136,.15);
}

.search-bar button{
    background:#1b3c88;
    color:white;
    border:none;
    padding:12px 24px;
    border-radius:10px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.search-bar button i{
    margin-right:8px;
}

.search-bar button:hover{
    background:#102d6c;
    transform:translateY(-2px);
}
.data-table{
    width:100%;
    border-collapse:collapse;
    background:#fff;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.data-table th{
    background:#163a82;
    color:#fff;
    padding:16px;
    text-align:left;
}

.data-table td{
    padding:16px;
    border-bottom:1px solid #eee;
}

.data-table tr:hover{
    background:#f5f9ff;
}

.account-status{

    display:inline-block;

    padding:6px 14px;

    border-radius:30px;

    font-size:13px;

    font-weight:600;

}
.account-status.active{
    background:#dff6e5;
    color:#16823d;
}

.account-status.closed{
    background:#ffe3e3;
    color:#d32f2f;
}

.no-data{
    text-align:center;
    padding:30px;
    color:#888;
}
/* Transaction Badges */

.badge{

display:inline-block;

padding:7px 14px;

border-radius:25px;

font-size:13px;

font-weight:600;

}

.deposit{

background:#DCFCE7;

color:#15803D;

}

.withdraw{

background:#FEE2E2;

color:#DC2626;

}

.transferin{

background:#DBEAFE;

color:#1D4ED8;

}

.transferout{

background:#FEF3C7;

color:#B45309;

}
/* ===========================
      UPDATE BUTTON
=========================== */

.update-btn{

background:#0B2E6F;

color:white;

border:none;

padding:10px 18px;

border-radius:8px;

cursor:pointer;

font-weight:600;

transition:.3s;

}

.update-btn:hover{

background:#D4A017;

color:#0B2E6F;

}

/* ===========================
        MODAL
=========================== */

.modal{

display:none;

position:fixed;

left:0;

top:0;

width:100%;

height:100%;

background:rgba(0,0,0,.45);

justify-content:center;

align-items:center;

z-index:9999;

}

.modal-content{

background:#fff;

width:480px;

padding:30px;

border-radius:15px;

box-shadow:0 15px 40px rgba(0,0,0,.3);

}

.modal-content h2{

margin-bottom:20px;

color:#0B2E6F;

}

.modal-content label{

display:block;

margin-top:15px;

margin-bottom:8px;

font-weight:600;

}

.modal-content select,

.modal-content textarea{

width:100%;

padding:12px;

border:1px solid #ddd;

border-radius:8px;

font-size:15px;

}

.modal-buttons{

display:flex;

justify-content:flex-end;

gap:15px;

margin-top:25px;

}

.cancel-btn{

background:#999;

color:white;

border:none;

padding:10px 20px;

border-radius:8px;

cursor:pointer;

}

.save-btn{

background:#0B2E6F;

color:white;

border:none;

padding:10px 25px;

border-radius:8px;

cursor:pointer;

}

.save-btn:hover{

background:#D4A017;

color:#0B2E6F;

}
</style>

</head>

<body>

<div class="sidebar">

    <div class="logo">

        <img src="images/logo2.jpeg">
        <br>

        <span>ADMIN PANEL</span>

    </div>

    <ul>

<li class="<%= "dashboard".equals(currentPage) ? "active" : "" %>">
    <a href="AdminDashboardServlet?page=dashboard">
        <i class="fa-solid fa-house"></i>
        <span>Dashboard</span>
    </a>
</li>

<li class="<%= request.getServletPath().equals("/AdminViewCustomersServlet") ? "active" : "" %>">
    <a href="AdminViewCustomersServlet">
        <i class="fa-solid fa-users"></i>
        <span>Customers</span>
    </a>
</li>

<li class="<%= "accounts".equals(currentPage) ? "active" : "" %>">
    <a href="AdminViewAccountsServlet">
        <i class="fa-solid fa-building-columns"></i>
        <span>Accounts</span>
    </a>
</li>

<li class="<%= "transactions".equals(currentPage) ? "active" : "" %>">
    <a href="AdminViewTransactionsServlet">
        <i class="fa-solid fa-money-bill-transfer"></i>
        <span>Transactions</span>
    </a>
</li>

<li class="<%= "requests".equals(currentPage) ? "active" : "" %>">
    <a href="ClosureRequestsServlet">
        <i class="fa-solid fa-file-circle-check"></i>
        <span>Requests</span>
    </a>
</li>
<li class="<%= "messages".equals(currentPage) ? "active" : "" %>">

    <a href="AdminDashboardServlet?page=messages">

        <i class="fa-solid fa-envelope"></i>

        <span>Contact Messages</span>

    </a>

</li>
<li class="<%= "settings".equals(currentPage) ? "active" : "" %>">
    <a href="AdminDashboardServlet?page=settings">
        <i class="fa-solid fa-gear"></i>
        <span>Settings</span>
    </a>
</li>

<li class="logout">
    <a href="AdminLogoutServlet">
        <i class="fa-solid fa-right-from-bracket"></i>
        <span>Logout</span>
    </a>
</li>

</ul>

</div>

<div class="main">

    <div class="topbar">

        <div>

            <h1>

                AURA RISE BANK

            </h1>

            <small>

                Smart Banking Administration

            </small>

        </div>

        <div class="top-right">

            <div class="profile">

                <i class="fa-solid fa-user-shield"></i>

                <div>

                    <b>Administrator</b>

                    <small>Online</small>

                </div>

            </div>

        </div>

    </div>

    <div class="welcome">

        <div>

            <h2>

                Welcome Back Administrator 👋

            </h2>

            <p>

                Monitor customers, accounts, transactions and banking operations from one secure dashboard.

            </p>

        </div>

        <i class="fa-solid fa-building-columns bank-icon"></i>

    </div>
<% if(currentPage.equals("dashboard")){ %>
<!-- ===============================
        DASHBOARD STATISTICS
================================ -->

<div class="stats">

    <div class="stat-card">

        <div class="icon blue">

            <i class="fa-solid fa-users"></i>

        </div>

        <h4>Total Customers</h4>

        <h2><%= totalCustomers %></h2>

    </div>

    <div class="stat-card">

        <div class="icon green">

            <i class="fa-solid fa-building-columns"></i>

        </div>

        <h4>Total Accounts</h4>

        <h2><%= totalAccounts %></h2>

    </div>

    <div class="stat-card">

        <div class="icon gold">

            <i class="fa-solid fa-wallet"></i>

        </div>

        <h4>Active Accounts</h4>

        <h2><%= activeAccounts %></h2>

    </div>

    <div class="stat-card">

        <div class="icon red">

            <i class="fa-solid fa-money-bill-transfer"></i>

        </div>

        <h4>Transactions</h4>

        <h2><%= totalTransactions %></h2>

    </div>

</div>

<!-- ===============================
      DASHBOARD GRID
================================ -->
<div class="dashboard-grid">

    <!-- LEFT PANEL -->

    <div class="left-panel">

        <h2 class="section-title">
            Latest Activity
        </h2>

        <%@ page import="java.util.List" %>
        <%@ page import="com.bank.transaction.Transaction" %>

        <%
        List<Transaction> latestActivities =
                (List<Transaction>) request.getAttribute("latestActivities");

        if (latestActivities != null && !latestActivities.isEmpty()) {

            for (Transaction t : latestActivities) {

                String icon = "fa-money-bill";
                String title = "";
                String desc = "";
                String color = "#0B2E6F";

                if ("DEPOSIT".equalsIgnoreCase(t.getTransactionType())) {

                    icon = "fa-sack-dollar";
                    title = "Deposit";
                    desc = t.getCustomerName()
                            + " deposited ₹"
                            + String.format("%.2f", t.getAmount());
                    color = "#16A34A";

                } else if ("WITHDRAW".equalsIgnoreCase(t.getTransactionType())) {

                    icon = "fa-wallet";
                    title = "Withdrawal";
                    desc = t.getCustomerName()
                            + " withdrew ₹"
                            + String.format("%.2f", t.getAmount());
                    color = "#DC2626";

                } else if ("TRANSFER_OUT".equalsIgnoreCase(t.getTransactionType())) {

                    icon = "fa-money-bill-transfer";
                    title = "Transfer";
                    desc = t.getCustomerName()
                            + " transferred ₹"
                            + String.format("%.2f", t.getAmount());
                    color = "#2563EB";

                } else if ("TRANSFER_IN".equalsIgnoreCase(t.getTransactionType())) {

                    continue;
                }
        %>

        <div class="activity">

            <div class="activity-icon"
                 style="background:<%=color%>">

                <i class="fa-solid <%=icon%>"></i>

            </div>

            <div>

                <h4><%=title%></h4>

                <p>

                    <%=desc%>

                    <br>

                    <small>

                        <%= new java.text.SimpleDateFormat(
                                "dd MMM yyyy, hh:mm a")
                                .format(t.getTransactionDate()) %>

                    </small>

                </p>

            </div>

        </div>

        <%
            }

        } else {
        %>

        <div class="activity">

            <div class="activity-icon">

                <i class="fa-solid fa-clock"></i>

            </div>

            <div>

                <h4>No Recent Activity</h4>

                <p>No transactions found.</p>

            </div>

        </div>

        <%
        }
        %>

    </div>

    <!-- RIGHT PANEL -->

    <div class="right-panel">

        <h2 class="section-title">
            System Status
        </h2>

        <div class="status">

            <span>Database</span>

            <b><%=request.getAttribute("databaseStatus")%></b>

        </div>

        <div class="status">

            <span>Bank Services</span>

            <b>Running</b>

        </div>

        <div class="status">

            <span>Security</span>

            <b>Protected</b>

        </div>

        <div class="status">

            <span>Server</span>

            <b><%=request.getAttribute("serverStatus")%></b>

        </div>

    </div>

</div>
<% } %>
<% if(currentPage.equals("customers")){ %>

<h2 class="section-title">
    Customers
</h2>

<p class="section-subtitle">
    View all registered customers.
</p>
<div class="search-bar">
    <form action="AdminViewCustomersServlet" method="get">
        <input type="hidden" name="page" value="customers">

        <input
            type="text"
            name="search"
            value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
            placeholder="Search by ID, Name, Email or Phone">

        <button type="submit">
            <i class="fa-solid fa-magnifying-glass"></i>
            Search
        </button>
    </form>
</div>
<table class="customer-table">

    <thead>

        <tr>
            <th>User ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
        </tr>

    </thead>

    <tbody>

        <tr>

           <%@ page import="java.util.List" %>
<%@ page import="com.bank.model.User" %>

<%
List<User> customers =
(List<User>)request.getAttribute("customers");

if(customers != null && !customers.isEmpty()){

    for(User u : customers){
%>

<tr>

    <td><%=u.getUserId()%></td>

    <td><%=u.getFullName()%></td>

    <td><%=u.getEmail()%></td>

    <td><%=u.getPhone()%></td>

    <td><%=u.getRole()%></td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="5" style="text-align:center;">
No Customers Found
</td>

</tr>

<%
}
%>
        </tr>

    </tbody>

</table>

<% } %>
<% if(currentPage.equals("accounts")){ %>

<%@ page import="java.util.List"%>
<%@ page import="com.bank.account.Account"%>

<h1>Accounts</h1>

<p>View all customer bank accounts.</p>

<div class="search-bar">

<form action="AdminViewAccountsServlet" method="get">

<input type="text"
name="search"
placeholder="Search Account No, Customer or Type"
value="<%=request.getParameter("search")==null?"":request.getParameter("search")%>">

<button type="submit">
<i class="fa-solid fa-magnifying-glass"></i>
Search
</button>

</form>

</div>

<table class="data-table">
    <thead>
        <tr>
            <th>Account No</th>
            <th>Customer</th>
            <th>Type</th>
            <th>Balance</th>
            <th>Status</th>
        </tr>
    </thead>

    <tbody>

<%
List<Account> accounts =
(List<Account>)request.getAttribute("accounts");

if(accounts!=null && !accounts.isEmpty()){

    for(Account a : accounts){
%>

<tr>
    <td><%=a.getAccountNumber()%></td>
    <td><%=a.getCustomerName()%></td>
    <td><%=a.getAccountType()%></td>

    <td>
        ₹ <%=String.format("%.2f",a.getBalance())%>
    </td>

    <td>

<%
if("ACTIVE".equalsIgnoreCase(a.getStatus())){
%>

<span class="account-status active">
    ACTIVE
</span>

<%
}else{
%>

<span class="account-status closed">
    CLOSED
</span>

<%
}
%>

    </td>

</tr>

<%
    }
}else{
%>

<tr>
    <td colspan="5" class="no-data">
        No Accounts Found
    </td>
</tr>

<%
}
%>

    </tbody>
</table>

<% } %>
<%@ page import="java.util.List"%>
<%@ page import="com.bank.transaction.Transaction"%>

<% if(currentPage.equals("transactions")){ %>

<h2 class="section-title">
    Transactions
</h2>

<p class="section-subtitle">
    View all banking transactions.
</p>

<div class="search-bar">

<form action="AdminViewTransactionsServlet" method="get">

<input
type="text"
name="search"
value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
placeholder="Search Transaction ID, Account No or Type">

<button type="submit">

<i class="fa-solid fa-magnifying-glass"></i>

Search

</button>

</form>

</div>
<table class="data-table">

    <thead>

        <tr>
            <th>ID</th>
            <th>Account No</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Balance After</th>
            <th>Date</th>
        </tr>

    </thead>

    <tbody>

<%
List<Transaction> transactions =
(List<Transaction>)request.getAttribute("transactions");

if(transactions != null && !transactions.isEmpty()){

    for(Transaction t : transactions){
%>

        <tr>

            <td><%= t.getTransactionId() %></td>

            <td><%= t.getAccountNumber() %></td>

            <td>

<%
String type = t.getTransactionType();

if(type.equalsIgnoreCase("DEPOSIT")){
%>

<span class="badge deposit">DEPOSIT</span>

<%
}else if(type.equalsIgnoreCase("WITHDRAW")){
%>

<span class="badge withdraw">WITHDRAW</span>

<%
}else if(type.equalsIgnoreCase("TRANSFER_IN")){
%>

<span class="badge transferin">TRANSFER IN</span>

<%
}else{
%>

<span class="badge transferout">TRANSFER OUT</span>

<%
}
%>

</td>

            <td>

<%
if(t.getTransactionType().equalsIgnoreCase("DEPOSIT")
|| t.getTransactionType().equalsIgnoreCase("TRANSFER_IN")){
%>

<span style="color:#16A34A;font-weight:700;">
+ ₹ <%= String.format("%.2f",t.getAmount()) %>
</span>

<%
}else{
%>

<span style="color:#DC2626;font-weight:700;">
- ₹ <%= String.format("%.2f",t.getAmount()) %>
</span>

<%
}
%>

</td>

            <td>₹ <%= String.format("%.2f", t.getBalanceAfter()) %></td>

            <td>

<%= new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a")
        .format(t.getTransactionDate()) %>

</td>

        </tr>

<%
    }

}else{
%>

        <tr>
            <td colspan="6" style="text-align:center;">
                No Transactions Found
            </td>
        </tr>

<%
}
%>

    </tbody>

</table>

<% } %>
<%@ page import="com.bank.account.Account"%>

<% if(currentPage.equals("requests")){ %>

<h2 class="section-title">
    Closure Requests
</h2>

<p class="section-subtitle">
    Manage account closure requests.
</p>

<table class="data-table">

<thead>
<tr>
    <th>Account No</th>
    <th>Customer</th>
    <th>Status</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
List<Account> requests =
(List<Account>)request.getAttribute("requests");

if(requests != null && !requests.isEmpty()){

    for(Account a : requests){

        String status = a.getClosureRequest();
%>

<tr>

<td><%=a.getAccountNumber()%></td>

<td><%=a.getCustomerName()%></td>

<td>

<%
if("PENDING".equals(status)){
%>

<span class="badge transferout">PENDING</span>

<%
}else if("APPROVED".equals(status)){
%>

<span class="badge deposit">APPROVED</span>

<%
}else{
%>

<span class="badge withdraw">REJECTED</span>

<%
}
%>

</td>

<td>

<%
if("PENDING".equals(status)){
%>

<a href="ApproveClosureServlet?id=<%=a.getAccountId()%>"
style="background:#16A34A;color:white;padding:8px 15px;border-radius:8px;text-decoration:none;">
Approve
</a>

&nbsp;

<a href="RejectClosureServlet?id=<%=a.getAccountId()%>"
style="background:#DC2626;color:white;padding:8px 15px;border-radius:8px;text-decoration:none;">
Reject
</a>

<%
}else if("APPROVED".equals(status)){
%>

<span style="color:#16A34A;font-weight:bold;">
✔ Account Closed
</span>

<%
}else{
%>

<span style="color:#DC2626;font-weight:bold;">
✖ Request Rejected
</span>

<%
}
%>

</td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="4" class="no-data">
No Closure Requests
</td>

</tr>

<%
}
%>

</tbody>

</table>
<% } %>
<% if(currentPage.equals("messages")){ %>

<div class="content-header">

    <h2 style="margin-bottom:18px;">Contact Messages</h2>

</div>

<table class="data-table">

    <thead>

        <tr>

           <th>ID</th>
           <th>Name</th>
           <th>Email</th>
           <th>Subject</th>
           <th>Message</th>
           <th>Status</th>
           <th>Admin Remark</th>
           <th>Date</th>
           <th>Action</th>

        </tr>

    </thead>

    <tbody>

<%
List<com.bank.contact.Contact> messages =
(List<com.bank.contact.Contact>)request.getAttribute("messages");

java.text.SimpleDateFormat dateFormat =
    new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a");

if(messages != null && !messages.isEmpty()){

    for(com.bank.contact.Contact msg : messages){
%>

<tr>

<td><%= msg.getMessageId() %></td>

<td><%= msg.getFullName() %></td>

<td><%= msg.getEmail() %></td>

<td><%= msg.getSubject() %></td>

<td><%= msg.getMessage() %></td>

<td><%= msg.getStatus() %></td>

<td>
<%= msg.getAdminRemark()==null ? "-" : msg.getAdminRemark() %>
</td>

<td>
<%= dateFormat.format(msg.getCreatedAt()) %>
</td>

<td>

<button class="update-btn"
onclick="openModal(
'<%=msg.getMessageId()%>',
'<%=msg.getStatus()%>',
'<%=msg.getAdminRemark()==null?"":msg.getAdminRemark()%>'
)">

<i class="fa-solid fa-pen"></i>
Update

</button>

</td>

</tr>

<%
    }
}else{
%>

<tr>
    <td colspan="9" style="text-align:center;">
        No messages found.
    </td>
</tr>

<%
}
%>
    </tbody>

</table>
<% } %>
<% if(currentPage.equals("settings")){ %>

<h2 class="section-title">
    System Settings
</h2>

<p class="section-subtitle">
    Manage administrator and system information.
</p>

<div class="dashboard-grid">

    <div class="left-panel">

        <h3 style="color:#0B2E6F;margin-bottom:25px;">
            <i class="fa-solid fa-user-shield"></i>
            Administrator Details
        </h3>

        <div class="status">
            <span>Name</span>
            <b><%=request.getAttribute("adminName")%></b>
        </div>

        <div class="status">
            <span>Username</span>
            <b><%=request.getAttribute("username")%></b>
        </div>

        <div class="status">
            <span>Role</span>
            <b><%=request.getAttribute("role")%></b>
        </div>

        <br>

        <a href="change-password.jsp"
           style="background:#0B2E6F;
                  color:white;
                  padding:12px 22px;
                  border-radius:10px;
                  text-decoration:none;">
            <i class="fa-solid fa-key"></i>
            Change Password
        </a>

    </div>

    <div class="right-panel">

        <h3 style="color:#0B2E6F;margin-bottom:25px;">
            <i class="fa-solid fa-server"></i>
            System Information
        </h3>

        <div class="status">
            <span>Database</span>
            <b style="color:green;">
                <%=request.getAttribute("databaseStatus")%>
            </b>
        </div>

        <div class="status">
            <span>Server</span>
            <b style="color:green;">
                <%=request.getAttribute("serverStatus")%>
            </b>
        </div>

        <div class="status">
            <span>Version</span>
            <b><%=request.getAttribute("version")%></b>
        </div>

        <br>

    </div>

</div>

<% } %>

<!-- =======	========================
            FOOTER
================================ -->

<div class="footer">

    <div class="footer-line"></div>

    <p>

        © 2026 <strong>AURA RISE BANK</strong>
        • Administrator Control Center
        • Secure Today. Prosper Tomorrow.

    </p>

</div>
<!-- ===========================
      UPDATE COMPLAINT MODAL
=========================== -->

<div id="updateModal" class="modal">

<div class="modal-content">

<h2>Update Complaint</h2>

<form action="UpdateContactStatusServlet"
      method="post">

<input
type="hidden"
id="messageId"
name="id">

<label>Status</label>

<select
id="status"
name="status">

<option value="Pending">Pending</option>

<option value="In Progress">In Progress</option>

<option value="Resolved">Resolved</option>

</select>

<label>Admin Remark</label>

<textarea
id="adminRemark"
name="adminRemark"
rows="5"></textarea>

<div class="modal-buttons">

<button
type="button"
class="cancel-btn"
onclick="closeModal()">

Cancel

</button>

<button
type="submit"
class="save-btn">

Save

</button>

</div>

</form>

</div>

</div>
<script>

function openModal(id,status,remark){

document.getElementById("updateModal").style.display="flex";

document.getElementById("messageId").value=id;

document.getElementById("status").value=status;

document.getElementById("adminRemark").value=remark;

}

function closeModal(){

document.getElementById("updateModal").style.display="none";

}

window.onclick=function(event){

let modal=document.getElementById("updateModal");

if(event.target==modal){

modal.style.display="none";

}

}

</script>
</body>

</html>