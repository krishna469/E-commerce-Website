<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
Connection con=null;
try{
	con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(name varchar2(100),email varchar2(50)primary key,mobileNumber number,securityQuestion varchar2(200),answer varchar2(200),password varchar2(100),address varchar2(200),city varchar2(100),state varchar2(100),country varchar2(100))";
	String q2="create table product(id number(10),name varchar2(50),category varchar2(50),price number(8),active varchar2(10))";
	String q3="create table cart(email varchar2(50),product_id number(5),quantity number(5),price number(5),total number(7),address varchar2(200),city varchar2(20),state varchar2(20),country varchar2(20),mobileNumber varchar2(12),orderDate varchar2(50),deliveryDate varchar2(50),paymentMethod varchar2(100),transactionId varchar2(50),status varchar2(10))";
	String q4="create table message(id number(5) primary key,email varchar2(100),subject varchar2(200),body varchar2(1000))";
	System.out.print(q2);
	//st.execute(q1);
	//st.execute(q2);
	//System.out.print("table Created");
	
	
}catch(Exception e){
	System.out.println(e);
}finally{
	ConnectionProvider.closeConnection(con); 
}
%>
