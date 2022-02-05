
<%@page import="com.dalip.Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 <style>
body, html {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  display:block;
}
* {
  box-sizing: border-box;
}
.bg-img {
  /* The image used */
  background-image: url("loginBackground.jpg");
   height: 100%;
  	margin:0;
  	padding:0;
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
   background-attachment: fixed;
  background-size: 100% 100%;  
}
/* Add styles to the form container */
.container {
  position: inline;
  display: inline-block; 
  text-align:left;
  margin-left: auto;
  margin-right: auto;
  margin:5px;
  max-width:600px; 
  padding: 20px;
  background-color: whitesmoke;
}
/* Full-width input fields */
input[type=text], input[type=password], input[type=number], input[type=email] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}
input[type=radio]{
	padding:3px;
	margin: 10px;
	background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus, input[type=number]:focus, input[type=email]:focus {
  background-color: #ddd;
  outline: none;
}
/* Set a style for the submit button */
.btn {
  background-color: #3389ff;
  color: white;
  padding: 16px 20px;
  margin: 5px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
}
.btn:hover {
  opacity: 1;
}
</style>
</head>
<body>

	<% 
		User user = (User)session.getAttribute("keyUser");
	%>

<div class="bg-img">
	<center>
		<h1 style="color:white; padding:15px;"><b>UPDATE YOUR ACCOUNT HERE</b></h1>
	</center>
	
		<form class="container" autocomplete="on" action="editprofile.jsp" method="post"
		   oninput='txtNewPassword2.setCustomValidity(txtNewPassword2.value != txtNewPassword.value ? "Passwords do not match." : "")'
		 >
		<h1><b>EDIT</b></h1>
		 <label for="name"><b>Name:</b></label>
			<input type="text" name="txtName" value="<%=user.name %>" required>	
		<label for="email"><b>Email:</b></label>
			<input type="email" name="txtEmail" value="<%=user.email %>"  required>
		<label for="password"><b>Current Password:</b></label>	
			<input type="password" name="txtCurrentPassword" id="myPassword" required>
		<label for="password"><b>New Password:</b></label>
			<input type="password" name="txtNewPassword" id="myPassword2" placeholder="min 6 characters" required>
		<label for="password"><b>Confirm New Password:</b></label>
			<input type="password" name="txtNewPassword2" id="myPassword3" placeholder="match with new password" required>
			<input type="hidden"   name="userid"  value="<%=user._id %>">
				
			<input type="checkbox" onclick="myFunction()">Show Password<br><br>
			 
			<button type="submit" class="btn">UPDATE</button>
			<button type="reset" class="btn">RESET</button>
		</form>
  
</div>
	
<script>
function myFunction() {
  var x = document.getElementById("myPassword");
  var y = document.getElementById("myPassword2");
  var z = document.getElementById("myPassword3");
  if (x.type === "password" || y.type === "password" || z.type === "password") {
    x.type = "text";
    y.type = "text";
    z.type = "text";
  } else {
    x.type = "password";
    y.type = "password";
    z.type = "password";
  }
}
</script>

	

</body>
</html></html>