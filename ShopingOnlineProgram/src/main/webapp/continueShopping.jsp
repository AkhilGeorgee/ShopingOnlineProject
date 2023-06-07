<%@page import="com.dao.packag.ConnectionProvided  " %>
<%@page import="java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String status="processing";
try
{
	Connection con=ConnectionProvided.getCon();
 	PreparedStatement ps=con.prepareStatement("update carte set status=? where email=? and status=''bill");
 	ps.setString(1,status);
 	ps.setString(2,email);
 	ps.executeUpdate();
 	response.sendRedirect("home.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>