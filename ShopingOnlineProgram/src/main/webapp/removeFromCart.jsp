<%@page import="com.dao.packag.ConnectionProvided  " %>
      <%@page import="java.sql.*" %>
      
       <%
       String email=session.getAttribute("email").toString();
       String product_id=request.getParameter("id");
       
       try
       {
    	   Connection con=ConnectionProvided.getCon();
  	  	 Statement st=con.createStatement();
  	  	st.executeUpdate("delete from carte where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
  	  	 
  	  	 response.sendRedirect("myCart.jsp?msg=remove");
       }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
       %>