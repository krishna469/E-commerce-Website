<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>SignUp</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    	<input type="text" name="name" placeholder="Enter Name " required>
    	<input type="email" name="email" placeholder="abc@gmail.com " required>
    	<input type="number" name="mobileNumber" placeholder="Enter Mobile No. " required>
    	<select name="securityQuestion" required>
    		<option value="what was the first school">what was the first school?</option>
    		<option value="what was the first car">what was the first car?</option>
    		<option value="what was the town you born">what was the town you born?</option>
    		
    	</select>
    <input type="text" name="answer" placeholder="Enter Answer "required>
    <input type="password" name="password" placeholder="Enter password "required>
    <input type="submit" value="Signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
 if("valid".equals(msg))
 {
%>
<h1>Successfully Registered !</h1>
<%} %>
<%
 if("invalid".equals(msg))
 {
%>
<h1>Something Went wrong TryAgain !</h1>
<%} %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>