<%@include file="header.jsp" %>
    <%@include file="footer.jsp" %>
     <%@page import="com.dao.packag.ConnectionProvided  " %>
      <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<% 
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<% 
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<% 
if("remove".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>

<%
int total=0;
int sno=0;

try
{
	 Connection con=ConnectionProvided.getCon();
  	 Statement st=con.createStatement();
  	 ResultSet rs=st.executeQuery("select sum(total) from carte where email='"+email+"' and address is NULL");
  
  	 while(rs.next())
  	 {
  		 total=rs.getInt(1);
  	 }%>

          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
            <%if(total>0){%> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs1=st.executeQuery("select * from product inner join carte on product.id=carte.product_id and carte.email='"+email+"' and carte.address is NULL");
      
      while(rs1.next())
      {
      %>
          <tr>
          <%sno=sno+1 ;%>
           <td><%out.println(sno); %></td>
            <td><%=rs1.getString(2) %></td>
            <td><%=rs1.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(8)%><a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(10) %> </td>
            <td><a href="removeFromCart.jsp?id<%=rs1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
     <% }
    }
catch(Exception e)
{
	System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>