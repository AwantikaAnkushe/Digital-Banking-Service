<%@page import="java.util.List"%>
<%@page import="com.Entity.TxnHistory"%>
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
	List<TxnHistory> al = (List<TxnHistory>) session.getAttribute("al");
%>

<h1 class="display-6 text-center">Transaction History</h1>
<table class="table table-bordered w-50">
<thead>
<tr>
<th>Account Number</th>
<th>Amount</th>
<th>TStatus</th>
<th>Date</th>
<th>Available Bal</th>
</tr>
</thead>
<tbody>
<%
for(TxnHistory txn:al)
{
%>
<tr>
<td><%=txn.getAcno() %></td>
<td><%=txn.getAmount() %></td>
<td><%=txn.getTstatus() %></td>
<td><%=txn.getDate()%></td>
<td><%=txn.getBal() %></td>
</tr>
<%} %>
</tbody>
</table>
<%}
else
{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>