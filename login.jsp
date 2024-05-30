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
<h1 class="display-6 text-center">Account Login Page</h1>
<%@include file="msg.jsp" %>

<div class="container w-50">


<form action="login">

<label for="uid">Account Id</label>
<input type="text" name="uid" id="uid" class="form-control">

<label for="upass">Account Password</label>
<input type="password" name="upass" id="upass" class="form-control">

<button class="btn btn-success mt-3">Login</button>
</form>
</div>
</body>
</html>