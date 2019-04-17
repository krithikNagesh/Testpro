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
select distinct(p.environment_name),p.environment_id from environment p
</sql:query>
<center>
 <%-- <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header> --%>
<br><br><br><br><br><br><br><br>

<%-- <c:set var="category" value="${category}" />
 Hello <c:out value="${category}"/>
  --%>
 
<form action="HomServlet" method="post">
<table>
<tr>
<td>Select Environment:</td>
<td><select name='envProd'>
<%-- <option value="empty" ${param.catProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result.rows}" var="envProd">
    <c:if test="${envProd.environment_id != selected}">
            <option value="${envProd.environment_id}" ${envProd.environment_id == category ? 'selected="selected"' : ''}>${envProd.environment_name}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr>

<tr>
<td></td>
<td><input type="text" id="text" name="eQuest" style="width: 300px;" /></td>
</tr>

<tr>
<td>Add environment question:</td>
<td><input type="text" id="text" name="eAns" style="width: 300px;" /></td>
</tr>
</table>

<table>
<tr>
<td>Add environment answer:</td>
<td><input type="submit" name="process" value="Add Question"/></td></tr>
</table> 
</form>
</body>
</html>