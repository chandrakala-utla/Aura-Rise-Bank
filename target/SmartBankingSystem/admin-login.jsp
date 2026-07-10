<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Admin Login</title>

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

    display:flex;

    justify-content:center;

    align-items:center;

    overflow:hidden;

    position:relative;

}

/* Background */

body::before{

    content:"";

    position:absolute;

    width:360px;

    height:360px;

    border-radius:50%;

    background:rgba(212,160,23,.15);

    top:-120px;

    left:-120px;

}

body::after{

    content:"";

    position:absolute;

    width:260px;

    height:260px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-80px;

    right:-80px;

}

/* Login Card */

.card{

    position:relative;

    z-index:2;

    width:500px;

    background:white;

    border-radius:24px;

    border-top:6px solid #D4A017;

    padding:40px;

    box-shadow:0 20px 50px rgba(0,0,0,.25);

    animation:popup .4s ease;

}

@keyframes popup{

from{

opacity:0;

transform:translateY(25px);

}

to{

opacity:1;

transform:translateY(0);

}

}

/* Logo */

.logo{

    text-align:center;

    margin-bottom:28px;

}

.logo img{

    width:180px;

    margin-bottom:10px;

}

.logo h1{

    color:#0B2E6F;

    font-size:34px;

    margin-bottom:8px;

}

.logo p{

    color:#64748B;

    font-size:15px;

}

/* Inputs */

.input-group{

    margin-bottom:18px;

}

.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#374151;

}

.input-group input{

    width:100%;

    padding:14px;

    border:1px solid #D1D5DB;

    border-radius:10px;

    background:#F8FAFC;

    font-size:15px;

    transition:.3s;

}

.input-group input:focus{

    outline:none;

    border-color:#D4A017;

    box-shadow:0 0 10px rgba(212,160,23,.25);

}

/* Button */

.login-btn{

    width:100%;

    padding:15px;

    background:#0B2E6F;

    color:white;

    border:none;

    border-radius:10px;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;

}

.login-btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);

}

/* Links */

.links{

    text-align:center;

    margin-top:20px;

}

.links a{

    text-decoration:none;

    color:#0B2E6F;

    font-weight:bold;

}

.links a:hover{

    color:#D4A017;

}

/* Footer */

.footer{

    position:fixed;

    bottom:20px;

    width:100%;

    text-align:center;

    color:white;

    font-size:14px;

}
.error-box{

    background:#FEE2E2;
    color:#B91C1C;
    border:1px solid #FCA5A5;

    padding:12px;

    margin-bottom:18px;

    border-radius:8px;

    text-align:center;

    font-weight:600;

}

</style>

</head>

<body>

<div class="card">

<div class="logo">

<img src="images/aurarise-logo.png"
alt="AURA RISE BANK">

<h1>

🛡 Admin Login

</h1>

<p>

Secure access for AURA RISE BANK administrators.

</p>

</div>
<%
String error = (String) request.getAttribute("error");
if(error != null){
%>

<div class="error-box">
    <%= error %>
</div>

<%
}
%>
<form action="AdminLoginServlet"
      method="post">

    <div class="input-group">

        <label>

            Username

        </label>

        <input type="text"
               name="username"
               placeholder="Enter Admin Username"
               required>

    </div>

    <div class="input-group">

        <label>

            Password

        </label>

        <input type="password"
               name="password"
               placeholder="Enter Admin Password"
               required>

    </div>

    <button type="submit"
            class="login-btn">

        🔐 Login As Administrator

    </button>

</form>

<div class="links">

    <a href="login.jsp">

        ← Customer Login

    </a>

</div>

</div>

<div class="footer">

    © 2026 <b>AURA RISE BANK</b>
    • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>