<%@page import="com.dao.packag.ConnectionProvided  " %>
      <%@page import="java.sql.*" %>
      <%
      String email=session.getAttribute("email").toString();
      String id=request.getParameter("id");
      String incdec=request.getParameter("quanrity");
      
      int price=0;
      int total=0;
      int quanrity=0;
      int final_total=0;
      
      try
      {
    	  Connection con=ConnectionProvided.getCon();
    	  	 Statement st=con.createStatement();
    	  	 ResultSet rs=st.executeQuery("select * from carte where email='"+email+"' and product_id='"+id+"' and address is NULL");
    	  	 
    	  	 while(rs.next())
    	  	 {
    	  		 price=rs.getInt(4);
    	  		 total=rs.getInt(5);
    	  		 quanrity=rs.getInt(3);
    	  	 }
    	  	 if(quanrity==1 && incdec.equals("dec"))
    	  	 
    	  		 response.sendRedirect("myCart.jsp?msg=notPossible");
    	  	 else if(quanrity!=1 && incdec.equals("dec"))
    	  	 {
    	  		 total=total-price;
    	  		 quanrity=quanrity-1;
    	  		 st.executeUpdate("update carte set total='"+total+"',quanrity='"+quanrity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
    	  		 response.sendRedirect("myCart.jsp?msg=dec");
    	  	 }
    	  	 else
    	  	 {
    	  		 total=total+price;
    	  		 quanrity=quanrity+1;
    	  		 st.executeUpdate("update carte set total='"+total+"',quanrity='"+quanrity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
    	  		 response.sendRedirect("myCart.jsp?msg=inc");
    	  	 }
    	  	 
      }
      catch(Exception e)
      {
    	  System.out.println(e);
      }
      %>