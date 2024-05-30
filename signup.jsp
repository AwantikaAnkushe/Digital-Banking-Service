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
<h1 class="display-6 text-center">Account SignUp Page</h1>
<%@include file="msg.jsp" %>

<div class="container w-75">


<form action="signin">

<label for="uid">Account Id</label>
<input type="text" name="uid" id="uid" class="form-control">

<label for="upass">Account Password</label>
<input type="password" name="upass" id="upass" class="form-control">

<label for="uphone">Contact no</label>
<input type="text" name="uphone" id="uphone" class="form-control">

<label for="uemail">Email Id</label>
<input type="email" name="uemail" id="uemail" class="form-control">

<label for="ucity">City</label>
<input type="text" name="ucity" id="ucity" class="form-control">

<label for="uahname">Account holder Name</label>
<input type="text" name="uahname" id="uahname" class="form-control">

<p>Select Account type:</p>
<label for="saving">Saving</label>
<input type="radio" name="actype" id="saving"  value="saving" class="form-input">

<label for="current">Current</label>
<input type="radio" name="actype" id="current"  value="current" class="form-input">


<p class="mt-3">ATM</p>
<label for="y">Yes</label>
<input type="radio" name="atm" id="y"  value="allocated" class="form-input">

<label for="n">No</label>
<input type="radio" name="atm" id="n"  value="not allocated" class="form-input">


<button class="btn btn-success text-center d-block">Create Account</button>
</form>

</div>
</body>
</html>