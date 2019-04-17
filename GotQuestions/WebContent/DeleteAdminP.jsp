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
<%--  <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header> --%>
<br><br><br><br><br><br><br><br>


<form action="HomServlet" method="post">
<table>
<tr>
<td><select name='delProd' onchange="this.form.submit()">
    		<option value="0" ${param.delProd == '0' ? 'selected' : ''}>------------------------</option>
            <option value="1" ${param.delProd == '1' ? 'selected' : ''}>Aggregation-REST Wrapper</option>
            <option value="2" ${param.delProd == '2' ? 'selected' : ''}>IAV-REST wrapper</option>
            <option value="3" ${param.delProd == '3' ? 'selected' : ''}>Aggregation-REST</option>
            <option value="4" ${param.delProd == '4' ? 'selected' : ''}>IAV-REST</option>
            <option value="5" ${param.delProd == '5' ? 'selected' : ''}>Fastlink 2.0-IAV</option>    
</select></td>
</tr>
</table>
</form>

<c:set var="delProd_id" value="${delProd_id}" />
 <%-- Hello <c:out value="${delProd_id}"/> --%>
 
<sql:query dataSource="${snapshot}" var="result1">
select distinct(q.question),q.number_question,p.product_id from product p, question q where p.product_id = ?
<sql:param value="${delProd_id}" />
</sql:query>



<form action="HomServlet" method="post">
<table>
<tr>
<td><select name='delProdQuest'>
<%-- <option value="empty" ${param.delProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result1.rows}" var="delProdQuest">
    <c:if test="${delProdQuest.product_id != selected}">
            <option value="${delProdQuest.question}" ${delProdQuest.question == category ? 'selected="selected"' : ''}>${delProdQuest.question}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr>
<tr><td><input type="submit" name="process" value="Delete Product Question"/></td></tr>
</form>


</body></html>


