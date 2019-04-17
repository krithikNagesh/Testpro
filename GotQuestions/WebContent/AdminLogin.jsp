<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header>
<br><br><br><br><br><br><br><br><br><br>

<center>
<form action="HomServlet" method="post"> 
<table>
<tr>
<td>Admin Name:</td>
<td><input type="text" name="username"/><br></td>
</tr>

<tr><td>Admin Password:</td>
<td><input type="password" name="userpass"/><br/> </td>
</tr>
</table> 
<input type="submit" name="process" value="Login"/>
  
</form>  
</center>
</body>
</html>