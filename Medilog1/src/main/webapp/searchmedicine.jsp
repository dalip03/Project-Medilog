<%@page import="com.dalip.Model.Medicine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
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
  border-radius: 15px;  
 }
</style>
</head>
<body>


	<% 
		 String userId = request.getParameter("userid");
		
		%>

	<div class="container" style="margin-top: 30px; border-radius: 15px;" >
	  <h2 >SEARCH FOR MEDICINES </h2>
	  <br>
	  <button type="button" class="btn btn-primary" onclick="document.location='home.jsp'"  style="padding:8px;"  title="LogIN">
		Home</button> 
  <button type="button" class="btn btn-primary" onclick="document.location='logmedicine.jsp'" style="padding:8px;"  title="LogIN">
		ADD MEDICINE</button>
   	<button type="button" class="btn btn-primary"onclick="document.location='viewmedicines.jsp'" title="SearchMedicine">
		VIEW ALL MEDICINES</button>
   		
 
  	 <br><br><br>
		
		
		<center>
		<h4>PLEASE Search, for which treatment you need medicine OR Medicine Name</h4>
		
		<form class="form" autocomplete="on" action="viewSearchMedicine.jsp" method="post">
			<fieldset style="background-color:whitesmoke; width:550px;" >
				<br>
			<input type="search" name="searchmedicine" placeholder="like fever, headache" required>
			<br>
			<input type="hidden" name="userid" value="<%=userId %>"  >
			<br><br>
		   <button type="submit" class="btn btn-success">SEARCH</button>
				
			<br><br>
			</fieldset>
		</form>
		<br>
		
		
		<!-- </form> -->
		
		</center>
	</div>
		

</body>
</html></html>