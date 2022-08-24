<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
int total=0;
Connection con=null;
//String status=(String)request.getAttribute("status");
try{
	con=ConnectionProvider.getCon();
	PreparedStatement st=con.prepareStatement("select sum(total) from cart where email=?");
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	System.out.println("bill");
	if(rs.next()){
		total=rs.getInt(1);
	}

	st=con.prepareStatement("select * from users u inner join cart c on u.email=c.email");

	//st.setString(1,email);
//	st.setString(2,status);
	//System.out.println("cart");
	ResultSet rs1=st.executeQuery();
	System.out.println("All Details Fetched Successfully");
	if(rs1.next()){
%>
<h3>Online shopping Bill </h3>
<hr>

<div class="left-div"><h3>Name: <%=rs1.getString(1) %>  </h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email); %>  </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs1.getString(20) %>  </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs1.getString(21) %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs1.getString(23) %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs1.getString(22) %> </h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=rs1.getString(24) %></h3></div>
<div class="right-div-right"><h3>City: <%=rs1.getString(17) %> </h3></div> 
<div class="right-div"><h3>Address: <%=rs1.getString(16) %> </h3></div> 

<div class="left-div"><h3>State:  <%=rs1.getString(18) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs1.getString(19) %></h3></div>  

<hr>

	
	<br>
	<%} %>
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>S
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%

  int sno=0;
  //select * from users u inner join cart c on u.email=c.email
  PreparedStatement ps=con.prepareStatement("select *from cart c inner join product p on c.product_id=p.id and email=?");
  ps.setString(1,email);
  ResultSet rs2=ps.executeQuery();
	System.out.println("going to run second query"); 
  while(rs2.next()){
	  
  sno=sno+1;
  int p1=Integer.parseInt(rs2.getString(3));
  int p2=Integer.parseInt(rs2.getString(4));
  int stot=p1*p2;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs2.getString(17) %></td>
    <td><%=rs2.getString(18) %></td>
    <td><%=rs2.getString(3) %></td>
    <td><%=rs2.getString(4) %></td>
    <td><%=stot %></td> 
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%=total %></h3>
<a href="home.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}catch(Exception e){
	System.out.println(e);
	System.out.println("Goes in Cache Exception");
	e.printStackTrace();
}
%>
</body>
</html>