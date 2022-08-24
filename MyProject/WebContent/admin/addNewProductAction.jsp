<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%


String name=request.getParameter("name");
String category=request.getParameter("category");
int price=Integer.parseInt(request.getParameter("price"));
String active=request.getParameter("active");
Connection con=null;
try{
	con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(product_seq.nextval,?,?,?,?)");
	
	ps.setString(1,name);
	ps.setString(2,category);
	ps.setInt(3,price);
	ps.setString(4,active);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}catch(Exception e){
	System.out.println(e.getMessage());
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>