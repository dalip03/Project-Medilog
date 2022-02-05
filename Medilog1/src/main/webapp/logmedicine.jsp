<%@page import="com.dalip.Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log medicine here</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
   body {   background-image: url("ImageBackground.jpg")
  !important; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;} 
  
  .form{
  margin-left: auto;
  margin-right: auto;	
  margin:10px;
  }
  
 .btn-r{
 	background-color: #ff3300;
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

		<center>
		<h2 style="margin-top:20px;">Dear <%=user.name %>, Log Your Medicine Details Here: </h2><br>
		   <button type="button" class="btn btn-success"onclick="document.location='viewmedicines.jsp'" title="SearchMedicine">
		VIEW ALL MEDICINES</button><br><br>
	
		
		<form autocomplete="on" action="addmedicine.jsp" method="get" class="form" >
		<fieldset style="background-color:whitesmoke; width:700px;" >
		<legend><b>Medicine Info</b></legend>
		 Name:
		    <br>
			<input type="text" name="mdname" placeholder="Medicine Name">
			<br><br>
		 Expiry Date:
		    <br>
			<input type="date" name="mdexpirydate" placeholder="Expiry Date">
			<br>
		    <br>
		 Medicine's Treatment:
			<br>
			<input type="text" name="mdtreatment" placeholder="Treatments like fever, headche">
            <br><br>
         Quantity:
			<br>
			<input type="number" name="mdquantity" >
            <br><br><br>		
			<button type="submit" class="btn btn-success">ADD MEDICINE</button>
			<button type="reset" class="btn btn-r btn-success">RESET</button><br><br>
			</fieldset>
	
		</form>
		
		</center>

</body>
</html>l>