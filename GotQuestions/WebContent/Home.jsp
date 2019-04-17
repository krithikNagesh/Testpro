
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
<title>Got Questions?- Home</title>
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
<style>
body {
    color: #1D5658;
}
</style>
</head>
<body>
<%-- <form action="HomServlet" method="post" >
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
</form> --%>

<%-- <c:set var="pdt" value="${product_id}" />
 Hello <c:out value="${product_id}"/>
 
 <c:set var="qst" value="${question_id}" />
 Hello <c:out value="${question_id}"/> --%>
 
<sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
     url="jdbc:oracle:thin:@localhost:1521:XE"
     user="ADMIN"  password="admin123"/>
           
<sql:query dataSource="${snapshot}" var="result1">
SELECT product_id,product_name from product
</sql:query>

<sql:query dataSource="${snapshot}" var="result2">
SELECT ENVIRONMENT_ID,ENVIRONMENT_NAME from environment
</sql:query>
 <center>
 <header>
 <%@include file="Header.html" %>
  <%@include file="Footer.html" %> 
</header>
<br><br>
 <form action="HomServlet" method="post">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <h4><a href="AdminLogin.jsp">Admin?</a></h4>
<h2><center>Build your question and get your answer</center></h2> 

<table>
<tr>
<td>Do you have questions related to product?</td>
<td><select name='productLooking' onchange="this.form.submit()">
<%-- <option value="empty" ${param.productLooking == 'empty' ? 'selected' : ''}>---------------------------</option> --%>
        		<option value="0" ${param.productLooking == '0' ? 'selected' : ''}>------------------------</option>
    <c:forEach items="${result1.rows}" var="productLooking">
    <c:if test="${productLooking.product_id != selected}">
            <option value="${productLooking.product_id}" ${productLooking.product_id == pdt ? 'selected="selected"' : ''}>${productLooking.product_name}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr>

<%-- <tr>
<td>Do you have questions related to environment- Stage, Production, Developer Portal?</td>
<td><select name='environment' onchange="this.form.submit()">
<option value="empty" ${param.productLooking == 'empty' ? 'selected' : ''}>---------------------------</option>
    <c:forEach items="${result2.rows}" var="environment">
    <c:if test="${environment.ENVIRONMENT_ID != selected}">
            <option value="${environment.ENVIRONMENT_ID}" ${environment.ENVIRONMENT_ID == env ? 'selected="selected"' : ''}>${environment.ENVIRONMENT_NAME}</option>
    </c:if>
    </c:forEach>  
</select></td>
</tr> --%>
</table>
</form>

<form action="HomServlet" method="post">
<table>
<tr>
<td>Do you have questions related to environment- Stage, Production, Developer Portal?</td>
<td><select name='environment' onchange="this.form.submit()">
<option value="empty" ${param.environment == 'empty' ? 'selected' : ''}>---------------------------</option>
    <c:forEach items="${result2.rows}" var="environment">
            <option value="${environment.ENVIRONMENT_ID}" ${environment.ENVIRONMENT_ID == env ? 'selected="selected"' : ''}>${environment.ENVIRONMENT_NAME}</option>
    </c:forEach>  
</select></td>
</tr>
</table>
</form>

</center>




<%-- <sql:query dataSource="${snapshot}" var="result">
SELECT question_id,number_question,question,answer from question WHERE Question_id = ?
<sql:param value="${pdt}" />
</sql:query>

<form action="HomServlet" method="post">
<table>
<tr><td>Which product are you using?</td> 
   <td>
   <select name='questionReq' onchange="this.form.submit()">
   <option value="empty" ${param.questionReq == 'empty' ? 'selected' : ''}>---------------------------</option>  
    <c:forEach items="${result.rows}" var="questionReq">
            <option value="${questionReq.question_id}" ${questionReq.question_id == pdt ? 'selected="selected"' : ''}>${questionReq.question}</option>
    </c:forEach>
</select>
</td>
 </tr>
 
 <tr><td>Here is your answer</td> 
   <td><textarea name="answer" readonly="readonly">${questionReq.answer}</textarea>

</td>
 </tr>
 
</table>

 <sql:query dataSource="${snapshot}" var="result2">
SELECT question_id,number_question,question,answer from question WHERE Number_question = ?
<sql:param value="${qst}" />
</sql:query>
</form> --%>


</body>
</html>