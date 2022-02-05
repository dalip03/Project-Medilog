<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
   body {   background-image: url("https://i.pinimg.com/originals/6c/89/a3/6c89a34e16fc91b26fada94f0cc4c8d5.jpg")
  !important; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;} 
 
 </style>


</head>
<body>

	<center>
		<h1 style="margin-top:50px;">OOPS! Something Went Wrong</h1>
		<h2>Message: <%= exception %></h2>
	</center>

</body>
</html></html>