<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin- Home</title>
</head>
<body>
<%-- <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header> --%>
<br><br><br>
<center>
<center><h5>Hello Admin!</h5></center>
<table>
<tr>
<td><h3>Add Questions</h3></td>
</tr>
<tr>
<td><a href="AddAdminP.jsp">Add Questions- Based on Product</a></td>
</tr>
<tr>
<td><a href="AddAdminE.jsp">Add Questions- Based on Environment</a></td>
</tr>
<tr>
<td><h5>Delete Questions</h5></td>
</tr>
<tr>
<td><a href="DeleteAdminP.jsp">Delete Questions- Based on Product</a></td>
</tr>
<tr>
<td><a href="DeleteAdminE.jsp">Delete Questions- Based on Environment</a></td>
</tr>
</table>
</center>
</body>
</html>