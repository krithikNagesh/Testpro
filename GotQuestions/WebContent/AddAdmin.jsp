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
</head>
<body>

<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="ADMIN"  password="admin123"/>

<sql:query dataSource="${snapshot}" var="result">
select distinct(p.product_name),p.product_id from product p, question q where p.product_id=q.question_id
</sql:query>

<sql:query dataSource="${snapshot}" var="result1">
select distinct(p.environment_name),p.environment_id from environment p, envquestion q where p.environment_id=q.env_question_id
</sql:query>
<center>
 <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header>
<br><br><br><br><br><br><br><br>

<c:set var="category" value="${category}" />
 Hello <c:out value="${category}"/>
 
 
<form action="HomServlet" method="post">
<table>
<tr>
<td>Select category:</td>
<td>
<select name='questionType' onchange="this.form.submit()">
<option value="empty" selected="selected">-------------</option>
<option value="product"> Product</option>
<option value="environment">Environment</option>
<option value="error">Error</option>
<option></option>
</select>
</td>
</tr>

<tr>
<%-- <% 
String catg=request.getAttribute("category").toString();
System.out.println("catg in AddAdmin.jsp---------------->"+catg);
if( catg.equalsIgnoreCase("product")) { %> --%>


<c:choose>
  <c:when test="${category==product}">
<td><select name='catProd' onchange="this.form.submit()">
<%-- <option value="empty" ${param.catProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result.rows}" var="catProd">
    <c:if test="${catProd.product_id != selected}">
            <option value="${catProd.product_id}" ${catProd.product_id == category ? 'selected="selected"' : ''}>${catProd.product_name}</option>
    </c:if>
    </c:forEach>  
</select></td>
</c:when>
<%-- <%}
else if( catg.equalsIgnoreCase("environment")) {  %> --%>


<c:when test="${category==environment}">
<td><select name='envProd' onchange="this.form.submit()">
<%-- <option value="empty" ${param.catProd == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
    <c:forEach items="${result1.rows}" var="envProd">
    <c:if test="${envProd.environment_id != selected}">
            <option value="${envProd.environment_id}" ${envProd.environment_id == category ? 'selected="selected"' : ''}>${envProd.environment_name}</option>
    </c:if>
    </c:forEach>  
</select></td>
</c:when>

</c:choose>

<%-- <% }else if( catg.equalsIgnoreCase("error")) {  }%>
 --%>
</tr>
<%-- <c:choose>
    <c:when test="${category=='1'}">
        pizza. 
        <br />
    </c:when>    
    <c:otherwise>
        pizzas. 
        <br />
    </c:otherwise>
</c:choose>
 --%>


</table>
</form>
</body>
</html>