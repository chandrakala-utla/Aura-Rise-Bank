<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.bank.notification.Notification"%>
<%@ page import="com.bank.model.User"%>

<%
User user = (User)session.getAttribute("user");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}

List<Notification> notifications =
(List<Notification>)request.getAttribute("notifications");

SimpleDateFormat sdf =
new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Notifications</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{
background:#F4F7FC;
}

.container{

width:92%;

max-width:1200px;

margin:40px auto;

}

.page-title{

font-size:36px;

color:#123D91;

margin-bottom:10px;

}

.page-desc{

color:#64748B;

margin-bottom:35px;

}
/* ===========================
   UNREAD NOTIFICATION
=========================== */

.unread{

background:#EEF6FF;

border-left:6px solid #2563EB;

}

/* ===========================
   READ NOTIFICATION
=========================== */

.read{

background:#FFFFFF;

border-left:6px solid #D1D5DB;

}

/* ===========================
   TITLE ROW
=========================== */

.title-row{

display:flex;

justify-content:space-between;

align-items:center;

margin-bottom:10px;

}

/* ===========================
   NEW BADGE
=========================== */

.badge{

background:#16A34A;

color:white;

padding:4px 10px;

border-radius:20px;

font-size:12px;

font-weight:bold;

letter-spacing:.5px;

}
.card{

background:#fff;

border-radius:18px;

padding:22px;

box-shadow:0 10px 25px rgba(0,0,0,.08);

margin-bottom:18px;

border-left:6px solid #123D91;

transition:.3s;

}

.card:hover{

transform:translateY(-3px);

}

.title{

font-size:20px;

font-weight:bold;

color:#123D91;

margin-bottom:10px;

}

.message{

font-size:16px;

color:#374151;

line-height:28px;

margin-bottom:12px;

}

.date{

font-size:14px;

color:#94A3B8;

}

.empty{

background:white;

padding:50px;

border-radius:18px;

text-align:center;

font-size:20px;

color:#64748B;

box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.back-btn{

display:inline-block;

margin-top:25px;

padding:12px 24px;

background:#123D91;

color:white;

text-decoration:none;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.back-btn:hover{

background:#D4A017;

color:#123D91;

}

</style>

</head>

<body>

<div class="container">

<h1 class="page-title">

🔔 Notifications

</h1>

<p class="page-desc">

Stay updated with your latest banking activities.

</p>

<%

if(notifications!=null && !notifications.isEmpty()){

for(Notification n : notifications){

%>

<div class="card <%= "UNREAD".equals(n.getStatus()) ? "unread" : "read" %>">

    <div class="title-row">

        <div class="title">

            <%= n.getTitle() %>

        </div>

        <% if("UNREAD".equals(n.getStatus())){ %>

            <span class="badge">

                NEW

            </span>

        <% } %>

    </div>

    <div class="message">

        <%= n.getMessage() %>

    </div>

    <div class="date">

        <%= sdf.format(n.getCreatedAt()) %>

    </div>

</div>

<%

}

}else{

%>

<div class="empty">

No notifications available.

</div>

<%

}

%>

<a href="DashboardServlet" class="back-btn">

← Back to Dashboard

</a>

</div>
<script>

setTimeout(function(){

    fetch("MarkNotificationsReadServlet")
    .then(response => response.text())
    .then(data => {

        console.log("Notifications marked as READ.");

    });

},3000);

</script>
</body>

</html>