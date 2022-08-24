<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
System.out.println("Id : "+id);
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
Connection con=null;
  
try{
	con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	if(active.equals("yes")){
	st.executeUpdate("Update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	response.sendRedirect("allProductEditProduct.jsp?msg=updated");
	}
	System.out.println("Query Update done now ...");
	if(active.equals("no")){
		st.executeUpdate("delete from cart where product_id ='"+id+"'");
	
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	}
	
	
}catch(Exception e){
	System.out.println(e.getMessage());
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>