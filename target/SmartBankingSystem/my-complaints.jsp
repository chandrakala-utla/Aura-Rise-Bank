<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.bank.contact.Contact"%>
<%@ page import="com.bank.model.User"%>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

List<Contact> complaints =
(List<Contact>)request.getAttribute("complaints");

SimpleDateFormat sdf =
new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Complaints</title>

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

max-width:1300px;

margin:40px auto;

}

.page-title{

font-size:34px;

color:#123D91;

margin-bottom:10px;

}

.page-desc{

color:#64748B;

margin-bottom:30px;

}

.table-card{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.08);

}

table{

width:100%;

border-collapse:collapse;

}

thead{

background:#123D91;

color:white;

}

thead th{

padding:18px;

text-align:left;

font-size:16px;

}

tbody td{

padding:18px;

border-bottom:1px solid #E5E7EB;

vertical-align:top;

}

tbody tr:hover{

background:#F8FAFC;

}

.status{

padding:6px 15px;

border-radius:30px;

font-weight:bold;

font-size:14px;

display:inline-block;

}

.pending{

background:#FEF3C7;

color:#92400E;

}

.progress{

background:#DBEAFE;

color:#1D4ED8;

}

.resolved{

background:#DCFCE7;

color:#166534;

}

.no-data{

padding:40px;

text-align:center;

color:#64748B;

font-size:18px;

}

.back-btn{

display:inline-block;

margin-top:25px;

background:#123D91;

color:white;

text-decoration:none;

padding:12px 24px;

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

My Complaints

</h1>

<p class="page-desc">

Track your complaint status and view bank responses.

</p>

<div class="table-card">

<table>

<thead>

<tr>

<th>ID</th>
<th>Subject</th>
<th>Complaint</th>
<th>Status</th>
<th>Bank Reply</th>
<th>Date</th>

</tr>

</thead>

<tbody>

<%

if(complaints != null && !complaints.isEmpty()){

for(Contact c : complaints){

String statusClass="pending";

if("In Progress".equals(c.getStatus())){

statusClass="progress";

}

else if("Resolved".equals(c.getStatus())){

statusClass="resolved";

}

%>

<tr>

<td><%= c.getMessageId() %></td>

<td><%= c.getSubject() %></td>

<td><%= c.getMessage() %></td>

<td>

<span class="status <%=statusClass%>">

<%= c.getStatus() %>

</span>

</td>

<td>

<%= c.getAdminRemark()==null || c.getAdminRemark().trim().isEmpty()

? "-"

: c.getAdminRemark() %>

</td>

<td>

<%= c.getUpdatedAt() != null
        ? sdf.format(c.getUpdatedAt())
        : sdf.format(c.getCreatedAt()) %>

</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="6" class="no-data">

No complaints found.

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<a href="DashboardServlet" class="back-btn">

← Back to Dashboard

</a>

</div>

</body>

</html>