<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.bank.account.Account"%>

<%
List<Account> accounts =
(List<Account>)request.getAttribute("accounts");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Deposit Money</title>

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

    width:540px;

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

    margin-bottom:2px;
}

.heading p{

    color:#6B7280;

    font-size:15px;
}

/* Note */

.note{

    background:#EEF6FF;

    border-left:5px solid #2563EB;

    padding:14px;

    border-radius:10px;

    margin-bottom:20px;

    color:#374151;

    line-height:20px;

    font-size:14px;
}

/* Input */

.input-group{

    margin-bottom:10px;
}

.input-group label{

    display:block;

    margin-bottom:2px;

    font-weight:600;

    color:#374151;
}

.input-group select,
.input-group input{

    width:100%;

    padding:12px 13px;

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

/* Button */

.btn{

    width:100%;

    padding:13px;

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
<%@ include file="includes/toast.jsp" %>
<div class="card">

    <!-- Logo -->

    <div class="logo">

        <img src="images/aurarise-logo.png"
             alt="AURA RISE BANK">

    </div>

    <!-- Heading -->

    <div class="heading">

        <h2>Deposit Money</h2>

        <p>

            Deposit funds into your AURA RISE BANK account securely.

        </p>

    </div>

    <!-- Information -->

    <div class="note">

        💰 Deposit funds securely into your selected account.<br><br>

        <b>Minimum Deposit:</b> ₹1<br>

        Your deposit will be credited instantly after successful verification.

    </div>

    <!-- Deposit Form -->

    <form action="DepositServlet" method="post">

        <div class="input-group">

            <label>

                Select Account

            </label>

            <select name="accountNumber" required>

                <option value="">

                    -- Select Your Account --

                </option>

                <%
                if(accounts != null){

                    for(Account account : accounts){
                %>

                <option value="<%= account.getAccountNumber() %>">

                    <%= account.getAccountNumber() %>

                    -

                    <%= account.getAccountType() %>

                </option>

                <%
                    }
                }
                %>

            </select>

        </div>

        <div class="input-group">

            <label>

                Deposit Amount (₹)

            </label>

            <input

                type="number"

                name="amount"

                placeholder="Enter deposit amount"

                min="1"

                step="0.01"

                required>

        </div>

        <button
            type="submit"
            class="btn">

            Deposit Money

        </button>

    </form>

    <div class="links">

        <a href="DashboardServlet">

            ← Back To Dashboard

        </a>

    </div>

</div>
<div class="footer">

    © 2026 AURA RISE BANK • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>