
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
<title>Got Questions?</title>
<style>
body {
    color: #1D5658;
   	font-size: 130%;
}
textarea {
    color: #1D5658;
    font-size: 100%;
}
</style>
</head>
<body>
<c:set var="qNum" value="${question_number}" />
<%--  Hello <c:out value="${question_number}"/>
 --%> 
 
<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="ADMIN"  password="admin123"/>
           

<sql:query dataSource="${snapshot}" var="result">
SELECT question_id,number_question,question,answer from question WHERE number_question = ?
<sql:param value="${question_number}" />
</sql:query>
<center>
 <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header>
<br><br><br><br><br><br><br><br>

<form action="HomServlet" method="post">
<table>
<c:forEach var="answerReq" items="${result.rows}">
<tr><td>Here is your answer: </td> 
   <td><textarea name="answer" readonly="readonly" style="border: 2px solid #765942;  border-radius: 10px; height: 60px; width: 900px;">${answerReq.answer}</textarea></td>
 </tr>
 </c:forEach>
</table>
<center><a href="Home.jsp">Return to Home Page</a></center>

</form>
</body>
</html>