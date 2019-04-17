
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
</head>
<body>
<form action="HomServlet" method="post" >
<input type="hidden" name="viewid" value="Home.jsp">
<h2><center>Build your question and get your answer</center></h2>
<table>
<tr>
<td>Which product are you using?</td>
<td><select name="productLookingOFF" onchange="this.form.submit()"  >
<option value="empty" ${param.productLooking == 'empty' ? 'selected' : ''}>--------------------</option>
<option value="apoorv" ${param.productLooking == 'apoorv' ? 'selected' : ''} >Aggregation-REST wrapper</option>
<option value="IAV-REST" ${param.productLooking == 'IAV-REST' ? 'selected' : ''}>IAV-REST wrapper</option>
<option value="Aggregation-YSL" ${param.productLooking == 'Aggregation-YSL' ? 'selected' : ''}>Aggregation-REST</option>
<option value="Fastlink 2.0-YSL" ${param.productLooking == 'Fastlink 2.0-YSL' ? 'selected' : ''}>IAV-REST</option>
<option value="Fastlink 2.0-REST" ${param.productLooking == 'Fastlink 2.0-REST' ? 'selected' : ''}>Fastlink 2.0-REST</option>
<option value="Fastlink 2.0-IAV" ${param.productLooking == 'Fastlink 2.0-IAV' ? 'selected' : ''}>Fastlink 2.0-IAV</option>
</select></td>
</tr>
</table>
</form>





<c:set var="pdt" value="${product}" />
 Hello <c:out value="${product}"/>
<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="admin"  password="admin123"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT name,email_id,product_detail,location from Client where name=?
<sql:param value="${pdt}" />
</sql:query>
 
 
<%--  <sql:query dataSource="${snapshot}" var="result1">
SELECT product_name from product
<sql:param value="${pdt}" />
</sql:query> --%>
 
 <form action="HomServlet" method="post" >
<input type="hidden" name="viewid" value="Home.jsp">
<h2><center>Build your question and get your answer</center></h2>
<table>
<tr>
<td>Which product are you using?</td>
<td><select name='productLooking'>
    <c:forEach items="${result1.rows}" var="role1">
        <c:if test="${role1.product_name != selected}">
            <option value="${role1.product_name}">${role1.product_name}</option>
        </c:if>
    </c:forEach>
</select></td>
</tr>
</table>
</form>
 
 
 <form action="HomServlet" method="post" >
<table border="1" width="100%">
<tr>
   <th>Name:</th>
   <th>Email</th>
   <th>Product</th>
   <th>Loc</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.email_id}"/></td>
   <td><c:out value="${row.product_detail}"/></td>
   <td><c:out value="${row.location}"/></td>
</tr>
</c:forEach>



<tr>
   <td>
   <select name='role'>
    <c:forEach items="${result.rows}" var="role">
        <c:if test="${role.name != selected}">
            <option value="${role.email_id}">${role.email_id}</option>
        </c:if>
    </c:forEach>
</select>
</td>
 </tr>

</table>
</form>

</body>
</html>