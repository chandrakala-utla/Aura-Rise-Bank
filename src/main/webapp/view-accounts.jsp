<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.bank.account.Account"%>
<%@ page import="com.bank.model.User"%>

<%
@SuppressWarnings("unchecked")
List<Account> accounts =
(List<Account>)request.getAttribute("accounts");

User user =
(User)session.getAttribute("user");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | My Accounts</title>

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

/* Decorative Background */

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

/* Main Container */

.container{
    width:95%;
    max-width:1450px;
    margin:35px auto 60px;
}

/* Header Card */

.header-card{
    background:#fff;
    border-radius:24px;
    border-top:6px solid #D4A017;
    padding:30px 35px;
    box-shadow:0 20px 45px rgba(0,0,0,.18);
    margin-bottom:35px;
}

/* Logo */

.logo{
    text-align:center;
    margin-bottom:15px;
}

.logo img{
    width:185px;
}

/* Heading */

.heading{
    text-align:center;
    margin-bottom:25px;
}

.heading h2{
    font-size:38px;
    color:#0B2E6F;
    margin-bottom:8px;
    font-weight:700;
}

.heading p{
    color:#64748B;
    font-size:16px;
}

/* User */

.user-box{
    background:#EEF6FF;
    border-left:5px solid #2563EB;
    padding:15px 18px;
    border-radius:10px;
    margin-bottom:20px;
    color:#374151;
    font-size:16px;
}

/* Search */

.filter-box{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
    align-items:center;
}

.filter-box input{
    flex:1;
    min-width:240px;
    padding:13px;
    border:1px solid #D1D5DB;
    border-radius:10px;
    background:#F8FAFC;
    font-size:15px;
}

.filter-box select{
    padding:13px;
    border:1px solid #D1D5DB;
    border-radius:10px;
    background:#F8FAFC;
    font-size:15px;
}

.filter-box button{
    background:#0B2E6F;
    color:#fff;
    border:none;
    padding:13px 24px;
    border-radius:10px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.filter-box button:hover{
    background:#D4A017;
    color:#0B2E6F;
}

.clear-btn{
    text-decoration:none;
    background:#DC2626;
    color:#fff;
    padding:13px 24px;
    border-radius:10px;
    font-weight:600;
    transition:.3s;
}

.clear-btn:hover{
    background:#B91C1C;
}

/* =========================
   Account Cards
========================= */

.accounts-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(360px,1fr));

    gap:28px;

    margin-top:30px;

}

.account-card{

    background:#FFFFFF;

    border-radius:22px;

    border-top:6px solid #D4A017;

    padding:28px;

    box-shadow:0 15px 35px rgba(0,0,0,.18);

    transition:all .35s ease;

    position:relative;

    overflow:hidden;

}

.account-card:hover{

    transform:translateY(-8px);

    box-shadow:0 22px 45px rgba(0,0,0,.25);

}

.account-title{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:22px;

}

.account-title h3{

    color:#0B2E6F;

    font-size:24px;

    font-weight:700;

}

.status{

    color:#FFFFFF;

    padding:7px 16px;

    border-radius:25px;

    font-size:13px;

    font-weight:700;

    letter-spacing:.4px;

}

.active{

    background:#16A34A;

}

.closed{

    background:#6B7280;

}

.info{

    margin:15px 0;

}

.info label{

    display:block;

    color:#6B7280;

    font-size:14px;

    margin-bottom:6px;

    font-weight:500;

}

.info p{

    color:#111827;

    font-size:17px;

    font-weight:700;

}

.actions{

    display:grid;

    gap:12px;

    margin-top:25px;

}

.btn{

    display:block;

    text-align:center;

    text-decoration:none;

    color:#FFFFFF;

    padding:13px;

    border-radius:10px;

    font-size:15px;

    font-weight:600;

    transition:.30s;

}

.history{

    background:#2563EB;

}

.statement{

    background:#16A34A;

}

.close{

    background:#DC2626;

}

.btn:hover{

    transform:translateY(-2px);

    opacity:.95;

}

.pending{

    background:#F59E0B;

    color:#FFFFFF;

    padding:13px;

    border-radius:10px;

    text-align:center;

    font-weight:600;

}

.closed-box{

    background:#6B7280;

    color:#FFFFFF;

    padding:13px;

    border-radius:10px;

    text-align:center;

    font-weight:600;

}
/* ===========================================
   Bottom Section
=========================================== */

.bottom-section{

    margin-top:50px;

    display:flex;

    justify-content:center;

    align-items:center;

}

/* Dashboard Button */

.dashboard-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    gap:8px;

    background:#0B2E6F;

    color:#FFFFFF;

    text-decoration:none;

    padding:15px 40px;

    border-radius:12px;

    font-size:16px;

    font-weight:600;

    transition:.30s;

    box-shadow:0 10px 25px rgba(0,0,0,.20);

}

.dashboard-btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-3px);

}

/* ===========================================
   Footer
=========================================== */

.footer{

    margin-top:60px;

    padding:35px 20px 25px;

    text-align:center;

}

.footer-line{

    width:190px;

    height:4px;

    background:#D4A017;

    margin:0 auto 20px;

    border-radius:20px;

}

.footer p{

    color:#FFFFFF;

    font-size:17px;

    font-weight:600;

    margin-bottom:8px;

}

.footer span{

    color:#E2E8F0;

    font-size:15px;

    letter-spacing:.4px;

}

/* ===========================================
   Responsive
=========================================== */

@media (max-width:992px){

    .accounts-grid{

        grid-template-columns:repeat(auto-fit,minmax(320px,1fr));

    }

}

@media (max-width:768px){

    .container{

        width:92%;

    }

    .header-card{

        padding:25px;

    }

    .logo img{

        width:150px;

    }

    .heading h2{

        font-size:30px;

    }

    .heading p{

        font-size:15px;

    }

    .filter-box{

        flex-direction:column;

    }

    .filter-box input,

    .filter-box select,

    .filter-box button,

    .clear-btn{

        width:100%;

    }

    .accounts-grid{

        grid-template-columns:1fr;

    }

    .dashboard-btn{

        width:100%;

    }

}

@media (max-width:480px){

    .account-card{

        padding:22px;

    }

    .account-title{

        flex-direction:column;

        gap:12px;

        align-items:flex-start;

    }

    .account-title h3{

        font-size:21px;

    }

    .info p{

        font-size:16px;

    }

}
</style>

</head>

<body>

<div class="container">

<div class="header-card">

<div class="logo">

<img src="images/aurarise-logo.png"
alt="Aura Rise Bank">

</div>

<div class="heading">

<h2>My Bank Accounts</h2>

<p>View and manage all your bank accounts securely.</p>

</div>

<div class="user-box">

<strong>Account Holder :</strong>

<%= user.getFullName() %>

</div>
<div class="user-box">

<!-- Search & Filter -->

<form
action="ViewAccountsServlet"
method="get">

<div class="filter-box">

<input
type="text"
name="keyword"
placeholder="Search by Account Number..."
value="<%= request.getParameter("keyword")==null?"":request.getParameter("keyword") %>">

<select name="status">

<option value="">All Status</option>

<option value="ACTIVE"
<%= "ACTIVE".equals(request.getParameter("status"))?"selected":"" %>>

Active

</option>

<option value="CLOSED"
<%= "CLOSED".equals(request.getParameter("status"))?"selected":"" %>>

Closed

</option>

</select>

<button type="submit">

🔍 Search

</button>

<a
href="ViewAccountsServlet"
class="clear-btn">

Clear

</a>

</div>

</form>

</div>
</div> 
<!-- Accounts -->

<div class="accounts-grid">

<%

if(accounts!=null && !accounts.isEmpty()){

for(Account account:accounts){

%>

<div class="account-card">

<div class="account-title">

<h3>

<%= account.getAccountType() %>

</h3>

<%

if("ACTIVE".equals(account.getStatus())){

%>

<span class="status active">

ACTIVE

</span>

<%

}
else{

%>

<span class="status closed">

CLOSED

</span>

<%

}

%>

</div>

<div class="info">

<label>

Account Number

</label>

<p>

<%= account.getAccountNumber() %>

</p>

</div>

<div class="info">

<label>

Available Balance

</label>

<p>

₹ <%= String.format("%.2f",
account.getBalance()) %>

</p>

</div>

<div class="info">

<label>

Created On

</label>

<p>

<%
String createdDate = "";

if(account.getCreatedAt()!=null){

java.sql.Timestamp ts =
java.sql.Timestamp.valueOf(account.getCreatedAt());

java.text.SimpleDateFormat sdf =
new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a");

createdDate = sdf.format(ts);

}
%>

<%= createdDate %>

</p>

</div>

<div class="actions">

<a
href="TransactionHistoryServlet?accountNumber=<%=account.getAccountNumber()%>"
class="btn history">

📜 View Transactions

</a>

<a
href="DownloadStatementServlet?accountNumber=<%=account.getAccountNumber()%>"
class="btn statement">

📄 Download Statement

</a>
<%

if("ACTIVE".equals(account.getStatus())){

    if("NONE".equals(account.getClosureRequest())
        || "REJECTED".equals(account.getClosureRequest())){

%>

<a
href="CloseAccountServlet?accountNumber=<%=account.getAccountNumber()%>"
class="btn close"
onclick="return confirm('Are you sure you want to submit the account closure request?');">

🔒 Request Closure

</a>

<%

    }
    else if("PENDING".equals(account.getClosureRequest())){

%>

<div class="pending">

⏳ Closure Request Pending

</div>

<%

    }
    else if("APPROVED".equals(account.getClosureRequest())){

%>

<div class="closed-box">

✔ Closure Approved

</div>

<%

    }

}
else{

%>

<div class="closed-box">

✔ Account Closed

</div>

<%

}

%>

</div>

</div>

<%

}

}
else{

%>

<div
style="
grid-column:1/-1;
background:white;
padding:60px;
border-radius:20px;
text-align:center;
box-shadow:0 15px 35px rgba(0,0,0,.18);">

<div style="font-size:70px;">🏦</div>

<h2
style="
margin-top:20px;
color:#0B2E6F;">

No Accounts Found

</h2>

<p
style="
margin-top:10px;
color:#64748B;">

You don't have any bank accounts.

</p>

</div>

<%

}

%>
</div>   <!-- accounts-grid ends -->

<div class="bottom-section">

    <a href="DashboardServlet"
       class="dashboard-btn">

        🏠 Back To Dashboard

    </a>

</div>

<footer class="footer">

    <div class="footer-line"></div>

    <p>© 2026 <strong>AURA RISE BANK</strong></p>

    <span>Secure Today. Prosper Tomorrow.</span>

</footer>

</div>   <!-- container ends -->

</body>

</html>