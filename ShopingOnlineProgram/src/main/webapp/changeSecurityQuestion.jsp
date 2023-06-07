    <%@include file="changeDetailsHeader.jsp" %>
    <%@include file="footer.jsp" %>
    <%@page import="com.dao.packag.ConnectionProvided  " %>
    <%@page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");

if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
 <form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Security Question</h3>
  <select class="input-style" name="securityQuestion">
     <option value="what was your first car?">what was your first car?</option>
     <option value="what was your second place?">what was your second place?</option>
     <option value="what is your pet name?">what is your pet name?</option>
     <option value="your first school?">your first school?</option>
 </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input  class="input-style" type="text" name="newAnswer" placeholder="Enter Your New Answer" required="required">
<hr>
<h3>Enter Password (For Security)</h3>
<input  class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required="required">
<hr>
<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>