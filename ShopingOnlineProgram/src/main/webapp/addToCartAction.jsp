 <%@include file="header.jsp" %>
 <%@include file="footer.jsp" %>
 <%@page import="com.dao.packag.ConnectionProvided  " %>
 <%@page import="java.sql.*" %>
 <%
   String emailid=session.getAttribute("email").toString();
   String product_id=request.getParameter("id");
   
   int quantity=1;
   int product_price=0;
   int product_total=0;
   int carte_total=0;
   
   int z=0;
   
   try
   {
  	 
  	 Connection con=ConnectionProvided.getCon();
  	 Statement st=con.createStatement();
  	 ResultSet rs=st.executeQuery("select * from product where id='"+product_id+"'");
  	 while(rs.next())
  	 {  
  	   product_price=rs.getInt(4);
  	   product_total=product_price;
  	 }
  	ResultSet rs1=st.executeQuery("select * from carte where product_id='"+product_id+"' and email='"+emailid+"' and address is NULL");
  	while(rs1.next())
  	{
  		carte_total=rs1.getInt(5);
  		carte_total=carte_total+product_total;
  		quantity=rs1.getInt(3);
  		quantity=quantity+1;
  		
  		z=1;
  	}
  	if(z==1)
  	{
  		st.executeUpdate("update carte set total='"+carte_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+emailid+"'and address is NULL");
  		response.sendRedirect("home.jsp?msg=exist");
  	}
  	if(z==0)
  	{
  		PreparedStatement ps=con.prepareStatement("insert into carte(email,product_id,quantity,price,total)values(?,?,?,?,?)");
  		ps.setString(1,emailid);
  		ps.setString(2,product_id);
  		ps.setInt(3,quantity);
  		ps.setInt(4,product_price);
  		ps.setInt(5,product_total);
  		ps.executeUpdate();
  		response.sendRedirect("home.jsp?msg=added");
  		
  	}
   }
   catch(Exception e)
   {
	   System.out.println(e);
	   response.sendRedirect("home.jsp?msg=invalid");
   }
 %>