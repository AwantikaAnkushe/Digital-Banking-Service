<%@page import="com.Entity.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String check=(String)session.getAttribute("check");
if(check!=null)
{
Account ac=(Account) session.getAttribute("ac");
%>
<h1 class="display-6 text-center">Account Details</h1>
<%@include file="msg.jsp" %>
<a href="logout" class="btn btn-danger">Logout</a>
<form action="readtxn">
<input type="hidden" name="uid" value="<%=check %>">
<button class="btn btn-info">Transaction History</button>
</form>
<div class="container border">

<div class="row overflow-hidden g-5 m-3">
<div class="col col-md-4">
	<div class="border">
		<span>User Id</span>
		<p><%=ac.getUserid() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Password</span>
		<p><%=ac.getPass() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Contact</span>
		<p><%=ac.getContact() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Email</span>
		<p><%=ac.getEmail() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>City</span>
		<p><%=ac.getCity() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Account holder Name</span>
		<p><%=ac.getAchname() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Account Type</span>
		<p><%=ac.getActype() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Atm</span>
		<p><%=ac.getAtm() %></p>
	</div>
</div>
<div class="col col-md-4">
	<div class="border">
		<span>Account number</span>
		<p><%=ac.getAcno() %></p>
	</div>
</div>
<div class="col  col-md-4 offset-md-4">
	<div class="border">
		<span>Account Balance</span>
		<p><%=ac.getBal()%></p>
	</div>
</div>
</div>

</div>
<!-- start of Account Services -->
<h1 class="display-6 text-center">Account Services</h1>
<div class="container border mb-5">

<div class="row overflow-hidden g-5">

<div class="col col-md-6">
	<div >
		<span>Deposit</span>
		<div class="w-50">
			<form action="deposit">
			<label for="am">Enter Amount</label>
			<input type="text" name="am" id="am" class="form-control">
			<input type="hidden" name="uid" value="<%=check %>">
			<button class="btn btn-success mt-3">Deposit</button>
		</form>
		</div>
	</div>
	
</div>

<div class="col col-md-6">
	
	<div>
		<span>Withdraw</span>
		<div class="w-50">
			<form action="withdraw">
			<label for="am">Enter Amount</label>
			<input type="text" name="am" id="am" class="form-control">
			<input type="hidden" name="uid" value="<%=check %>">
			<button class="btn btn-success mt-3">Withdraw</button>
		</form>
		</div>
	</div>
	
</div>
<div class="col col-md-12">
	
	<div>
		<span>Money Transfer</span>
		<div class="w-25">
			<form action="">
			<label for="am">Enter Amount</label>
			<input type="text" name="am" id="am" class="form-control">
			<label for="acnob">Enter Account number</label>
			<input type="text" name="acnob" id="acnob" class="form-control">
			<button class="btn btn-success mt-3">Transfer</button>
		</form>
		</div>
	</div>
</div>
</div>

</div>
<%}
else
{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>