<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String email=(String)session.getAttribute("email");
long product_id=Long.parseLong(request.getParameter("id"));
int quantity=1;
int product_price=0;
int product_total=0;
long cart_total=0;
int z=0;


Connection con=null;
try{
con=ConnectionProvider.getCon();
PreparedStatement st=con.prepareStatement("select * from product where id= ?");
st.setLong(1,product_id);
ResultSet rs=st.executeQuery();

while(rs.next())
{
	product_price=rs.getInt(4);
	product_total=product_price;
}
System.out.println("Fetch Product Details Completed"+email);
st=con.prepareStatement("select * from cart where product_id=? and email=? and address is NULL");
st.setLong(1,product_id);
st.setString(2,email);
ResultSet rs1=st.executeQuery();


while(rs1.next()){
	cart_total=rs1.getInt(5);
	cart_total=cart_total+product_total;
	quantity=rs1.getInt(3);
	quantity=quantity+1;
	z=1;
}
System.out.println("Execute Query  Completed");
if(z==1){
	st=con.prepareStatement("update cart set total=?,quantity=? where product_id=? and email=? and address=NULL");
	st.setLong(1,cart_total);
	st.setInt(2,quantity);
	st.setLong(3,product_id);
	st.setString(4,email);
	int result=st.executeUpdate();


	response.sendRedirect("home.jsp?msg=exist");
}
if(z==0){
	PreparedStatement ps=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
	ps.setString(1, email);
	ps.setLong(2, product_id);
	ps.setInt(3, quantity);
	ps.setInt(4, product_price);
	ps.setInt(5, product_total);
	ps.executeUpdate();
	response.sendRedirect("home.jsp?msg=added");
}
}catch(Exception e){
	System.out.println(e.getMessage());
	e.printStackTrace();
	response.sendRedirect("home.jsp?msg=invilid");
}
%>