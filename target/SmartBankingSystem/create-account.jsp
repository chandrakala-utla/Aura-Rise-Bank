<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Create Account</title>

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

/* Background */

body::before{

    content:"";

    position:absolute;

    width:340px;

    height:340px;

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

    bottom:-90px;

    right:-90px;
}

/* Card */

.card{

    position:relative;

    z-index:2;

    width:520px;

    background:white;

    border-radius:24px;

    border-top:6px solid #D4A017;

    padding:25px 35px;

    box-shadow:0 25px 60px rgba(0,0,0,.25);

    animation:popup .45s ease;
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

    margin-bottom:0px;
}

.logo img{

    width:180px;
}

/* Heading */

.heading{

    text-align:center;

    margin-bottom:10px;
}

.heading h2{

    color:#0B2E6F;

    font-size:34px;

    margin-bottom:5px;
}

.heading p{

    color:#6B7280;

    font-size:15px;
}

/* Inputs */

.input-group{

    margin-bottom:15px;
}

.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#374151;
}

.input-group select,

.input-group input{

    width:100%;

    padding:13px 15px;

    border:1px solid #D1D5DB;

    border-radius:10px;

    background:#F8FAFC;

    font-size:15px;

    transition:.3s;
}

.input-group select:focus,

.input-group input:focus{

    outline:none;

    border-color:#D4A017;

    box-shadow:0 0 10px rgba(212,160,23,.25);
}

/* Info Box */

.note{

    background:#EEF6FF;

    border-left:5px solid #2563EB;

    padding:14px;

    border-radius:10px;

    margin-bottom:22px;

    color:#374151;

    font-size:14px;

    line-height:24px;
}

/* Button */

.btn{

    width:100%;

    padding:14px;

    border:none;

    border-radius:10px;

    background:#0B2E6F;

    color:white;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;
}

.btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);
}

/* Links */

.links{

    text-align:center;

    margin-top:18px;
}

.links a{

    color:#0B2E6F;

    text-decoration:none;

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

</style>

</head>

<body>

<div class="card">

<div class="logo">

<img src="images/aurarise-logo.png"
alt="AURA RISE BANK">

</div>

<div class="heading">

<h2>Create Account</h2>

<p>

Open your Savings or Current Account securely.

</p>

</div>

<div class="note">

🏛 Minimum opening balance is <b>₹500</b>.

Choose your preferred account type and enter the initial deposit amount.

</div>

<form action="CreateAccountServlet" method="post">

<div class="input-group">

<label>

Account Type

</label>

<select name="accountType" required>

<option value="">

Select Account Type

</option>

<option value="SAVINGS">

🏛 Savings Account

</option>

<option value="CURRENT">

💼 Current Account

</option>

</select>

</div>

<div class="input-group">

<label>

Initial Deposit (₹)

</label>

<input

type="number"

name="balance"

placeholder="Enter opening balance"

min="500"

step="0.01"

required>

</div>

<button type="submit" class="btn">

Create Bank Account

</button>

</form>

<div class="links">

<a href="DashboardServlet">

← Back To Dashboard

</a>

</div>

</div>

<div class="footer">

© 2026 AURARISE BANK • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>