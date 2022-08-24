<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotPasswordAction.jsp" method="post">
  	<input type="email" name="email" placeholder="Enter Email" required>
  	<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
  	<select name="securityQuestion">
  		<option value="what was the first school">what was the first school?</option>
    	<option value="what was the first car">what was the first car?</option>
    	<option value="what was the town you born">what was the town you born?</option>
    		
  	</select>
	<input type="text" name="answer" placeholder="Enter answer" placeholder="Enter your answer here" required>  	
	<input type="text" name="newPassword" placeholder="Enter New Password to set" required>
	<input type="submit" value="save">
  </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
  %>
<h1>Password Changed Successfully!</h1>
<%} %>
<%
if("invilid".equals(msg))
{
%>

<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>