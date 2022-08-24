<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		session.setAttribute("email",email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	else{
		int z=0;
		Connection con=null;
		PreparedStatement pstmt  = null;
		ResultSet rs = null;
		try{
			con=ConnectionProvider.getCon();
			String sql="  select * from users"
					+ " where email=? and password=?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs  = pstmt.executeQuery();
			while(rs.next()){
				z=1;
				session.setAttribute("email",email);
				response.sendRedirect("home.jsp");								 
			}
			if(z==0)
				response.sendRedirect("login.jsp?msg=notexist");

			
		}catch(Exception e){
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=invilid");			
		}
	}
%>

























