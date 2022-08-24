<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
	String email=request.getParameter("email");
	String mobileNumber=request.getParameter("mobileNumber");
	String securityQuestion=request.getParameter("securityQuestion");
	String answer=request.getParameter("answer");
	String newPassword=request.getParameter("newPassword");
	Connection con=null;
	int check=0;
	try{
		con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
		while(rs.next()){
			check=1;
			st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("forgotPassword.jsp?msg=invilid");
		}
		
	}catch(Exception e){
		System.out.println(e);
	}finally{
		con.close();
	}


%>




























