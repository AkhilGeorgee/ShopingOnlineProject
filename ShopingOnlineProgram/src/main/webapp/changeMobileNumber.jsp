    <%@include file="changeDetailsHeader.jsp" %>
    <%@include file="footer.jsp" %>
    <%@page import="com.dao.packag.ConnectionProvided  " %>
    <%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>change Mobile Number</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("vaild".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" value="" name="mobileNumber" placeholder="Enter New Mobile Number" required="required">
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" value="" name="password" placeholder="Enter Password (For Security)" required="required">
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>