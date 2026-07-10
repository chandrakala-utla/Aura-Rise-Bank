<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURARISE BANK | Forgot Password</title>

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

/* Decorative Background */

body::before{

    content:"";

    position:absolute;

    width:350px;

    height:350px;

    border-radius:50%;

    background:rgba(212,160,23,.15);

    top:-120px;

    left:-120px;
}

body::after{

    content:"";

    position:absolute;

    width:280px;

    height:220px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-100px;

    right:-100px;
}

/* Card */

.card{

    position:relative;

    z-index:2;

    width:470px;

    background:white;

    padding:35px;

    border-radius:22px;

    border-top:6px solid #D4A017;

    box-shadow:0 25px 60px rgba(0,0,0,.25);

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

/* Logo */

.logo{

    text-align:center;

    margin-bottom:10px;
}

.logo img{

    width:190px;

    height:auto;
}

/* Heading */

h1{

    text-align:center;

    color:#0B2E6F;

    font-size:36px;

    margin-bottom:10px;
}

.subtitle{

    text-align:center;

    color:#6B7280;

    line-height:24px;

    margin-bottom:25px;
}

/* Form */

label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#374151;
}

input{

    width:100%;

    padding:12px;

    border:1px solid #D1D5DB;

    background:#F8FAFC;

    border-radius:10px;

    margin-bottom:22px;

    font-size:15px;

    transition:.3s;
}

input:focus{

    outline:none;

    border-color:#D4A017;

    box-shadow:0 0 10px rgba(212,160,23,.25);
}

/* Button */

button{

    width:100%;

    padding:13px;

    background:#0B2E6F;

    color:white;

    border:none;

    border-radius:10px;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;
}

button:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);
}

/* Back Link */

.back{

    display:block;

    text-align:center;

    margin-top:20px;

    text-decoration:none;

    color:#0B2E6F;

    font-weight:bold;
}

.back:hover{

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

</style>

</head>

<body>

<div class="card">

    <div class="logo">

        <img src="images/aurarise-logo.png"
             alt="AURARISE BANK">

    </div>

    <h1>Forgot Password</h1>

    <p class="subtitle">

        Enter your registered email address to verify your identity and continue resetting your password.

    </p>

    <form action="ForgotPasswordServlet" method="post">

        <label>Email Address</label>

        <input
        type="email"
        name="email"
        placeholder="Enter your registered email"
        required>

        <button type="submit">

            Verify Email

        </button>

    </form>

    <a href="login.jsp" class="back">

        ← Back To Login

    </a>

</div>

<div class="footer">

© 2026 AURARISE BANK • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>