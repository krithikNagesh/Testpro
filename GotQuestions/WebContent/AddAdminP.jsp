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
<title>Add Questions</title>
<style>
body {
    color: #1D5658;
   	font-size: 130%;
}
option {
    color: #1D5658;
    font-size: 100%;
}

select {
    color: #1D5658;
    font-size: 100%;
}
</style>
</head>
<body>

<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="ADMIN"  password="admin123"/>

<sql:query dataSource="${snapshot}" var="result">
select distinct(p.product_name),p.product_id from product p
</sql:query>
 <center>
 <%-- <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header> --%>
<br><br><br><br><br><br><br><br>
 
<form action="HomServlet" method="post">
<table>
<tr>
<td>Select Product</td>
<td><select name='catProd'>
<%-- <option value="empty" ${param.catProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result.rows}" var="catProd">
    <c:if test="${catProd.product_id != selected}">
            <option value="${catProd.product_id}" ${catProd.product_id == category ? 'selected="selected"' : ''}>${catProd.product_name}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr>

<tr>
<td>Enter product question:</td>
<td><input type="text" id="text" name="pQuest" style="width: 300px;" /></td>
</tr>

<tr>
<td>Enter product answer:</td>
<td><input type="text" id="text" name="pAns" style="width: 300px;" /></td>
</tr>
</table>

<table>
<tr><td><input type="submit" name="process" value="Add"/></td></tr>
</table> 
</form>
</body>
</html>