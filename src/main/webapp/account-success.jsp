<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String accountNumber =
    (String) session.getAttribute("accountNumber");

if(accountNumber == null){
    response.sendRedirect("dashboard.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Created</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);
    overflow:hidden;
}

/* Decorative circles */

body::before{
    content:"";
    position:absolute;
    width:320px;
    height:320px;
    background:rgba(212,160,23,.15);
    border-radius:50%;
    top:-120px;
    left:-120px;
}

body::after{
    content:"";
    position:absolute;
    width:260px;
    height:260px;
    background:rgba(255,255,255,.08);
    border-radius:50%;
    bottom:-80px;
    right:-80px;
}

.card{

    position:relative;
    z-index:2;

    width:560px;

    background:white;
    border-top:6px solid #D4A017;
    padding:45px;

    border-radius:22px;

    text-align:center;

    box-shadow:0 25px 60px rgba(0,0,0,.25);
}
.card{

    animation:popup .5s ease;
}

@keyframes popup{

    from{

        opacity:0;

        transform:translateY(30px);
    }

    to{

        opacity:1;

        transform:translateY(0);
    }
}
.brand{

    text-align:center;

    margin-bottom:25px;
}

.brand img{
    width:170px;
    height:auto;
    margin-bottom:8px;
}

.brand h2{

    color:#0B2E6F;

    font-size:32px;

    font-weight:700;

    letter-spacing:1px;

    margin-bottom:6px;
}

.brand p{

    color:#6B7280;

    font-size:15px;

    font-weight:500;
}
.logo{

    font-size:15px;

    font-weight:700;

    letter-spacing:2px;

    color:#0B2E6F;

    margin-bottom:5px;
}

.tagline{

    color:#6b7280;

    font-size:13px;

    margin-bottom:25px;
}

.success{

    width:90px;

    height:90px;

    margin:auto;

    border-radius:50%;

    background:#ecfdf5;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:42px;

    border:4px solid #16a34a;
}

h1{

    margin-top:20px;

    color:#0B2E6F;

    font-size:30px;
}

.message{

    color:#6b7280;

    margin-top:12px;

    line-height:24px;
}

.account-box{

    margin-top:30px;

    background:#F8FAFC;

    border:2px solid #D4A017;

    border-radius:16px;

    padding:22px;
}

.account-box p{

    color:#6b7280;

    font-size:15px;
}

.account-number{

    margin-top:12px;

    font-size:30px;

    font-weight:bold;

    letter-spacing:2px;

    color:#0B2E6F;
}

.btn{

    display:inline-block;

    margin-top:35px;

    background:#0B2E6F;

    color:white;

    padding:14px 34px;

    border-radius:10px;

    text-decoration:none;

    font-weight:bold;

    transition:.3s;
}

.btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);
}

</style>

</head>
<body>

<div class="card">

    <div class="brand">

    <img src="images/aurarise-logo.png"
         alt="Aurarise Bank Logo">


</div>

<div class="success">
    ✔
</div>

<h1>
   Welcome to Aurarise Bank!
   Your new account has been created successfully.
</h1>

<p class="message">
Thank you for choosing Aurarise Bank.

Your account is now active and ready for secure banking services.
</p>

    <div class="account-box">

        <p>Your New Account Number</p>

        <div class="account-number">
            <%= accountNumber %>
        </div>

    </div>

    <a href="DashboardServlet" class="btn">
        🏠 Go To Dashboard
    </a>

</div>

</body>
</html>