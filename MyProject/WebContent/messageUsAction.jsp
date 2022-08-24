<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
System.out.println("*********************");
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
	Connection con=ConnectionProvider.getCon();
	
	PreparedStatement ps=con.prepareStatement("insert into message(id,email,subject,body) values(msg_seq.nextval,?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	
	ps.executeUpdate();
	System.out.println("Message Action  query Successfull");
	response.sendRedirect("message_us.jsp?msg=valid");
}catch(Exception e){
	System.out.println(e);
	e.printStackTrace();
	response.sendRedirect("message_us.jsp?msg=invalid");
}
%>