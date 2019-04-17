
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
<title>Here are your Questions</title>

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
<body fon>
<c:set var="pdt" value="${product_id}" />
 <%-- Hello <c:out value="${product_id}"/> --%>
 
 
<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="ADMIN"  password="admin123"/>
           

<sql:query dataSource="${snapshot}" var="result">
SELECT question_id,number_question,question,answer from question WHERE Question_id = ?
<sql:param value="${product_id}" />
</sql:query>
<center>
 <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header>
<br><br><br><br><br><br><br><br>

<form action="HomServlet" method="post">
<table>
<tr><td>Please select your question:</td> 
   <td>
   <select name='questionReq' onchange="this.form.submit()">       		
   <%-- <option value="empty" ${param.questionReq == 'empty' ? 'selected' : ''}>---------------------------</option>   --%>
    <c:forEach items="${result.rows}" var="questionReq">
            <option value="${questionReq.number_question}" ${questionReq.number_question == pdt ? 'selected="selected"' : ''}>${questionReq.question}</option>
    </c:forEach>
    <option value="0" selected="selected" ${param.questionReq == '0' ? 'selected' : ''}>------------------------</option> 
</select>
</td>
 </tr>
</table>
<br>
<center><a href="Home.jsp">Return to Home Page</a></center>
</form>
</body>
</html>