<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String email=request.getParameter("email");
try{
        	Connection con=ConnectionProvider.getCon();
        	Statement st=con.createStatement();
        	response.sendRedirect("ordersReceived.jsp?msg=cancel");
        	
}catch(Exception e){
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
 %>
 