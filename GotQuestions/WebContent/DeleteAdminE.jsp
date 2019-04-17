<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<center>
 <%-- <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header> --%>
<br><br><br><br><br><br><br><br>


<form action="HomServlet" method="post">
<table>
<tr>
<td><select name='delEnv' onchange="this.form.submit()">
    		<option value="0" ${param.delEnv == '0' ? 'selected' : ''}>------------------------</option>
            <option value="1" ${param.delEnv == '1' ? 'selected' : ''}>Developer Portal</option>
            <option value="2" ${param.delEnv == '2' ? 'selected' : ''}>Stage Environment</option>
            <option value="3" ${param.delEnv == '3' ? 'selected' : ''}>Production Environment</option>           
</select></td>
</tr>
</table>
</form>

<c:set var="delEnv_id" value="${delEnv_id}" />
<%--  Hello <c:out value="${delEnv_id}"/>
 --%> 
<sql:query dataSource="${snapshot}" var="result1">
select distinct(q.env_question),q.env_number_question,p.environment_id from environment p, envquestion q where p.environment_id = ?
<sql:param value="${delEnv_id}" />
</sql:query>



<form action="HomServlet" method="post">
<table>
<tr>
<td><select name='delEnvQuest'>
<%-- <option value="empty" ${param.delProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result1.rows}" var="delEnvQuest">
    <c:if test="${delEnvQuest.environment_id != selected}">
            <option value="${delEnvQuest.env_question}" ${delEnvQuest.env_question == category ? 'selected="selected"' : ''}>${delEnvQuest.env_question}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr>
<tr><td><input type="submit" name="process" value="Delete Environment Question"/></td></tr>
</form>


</body></html>


