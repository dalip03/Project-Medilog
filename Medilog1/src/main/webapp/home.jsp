

<%@page import="com.dalip.Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Welcome home</title>

  <link rel="stylesheet" href="medilogindex.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	
</head>
<body>
 

	<% 
		User user = (User)session.getAttribute("keyUser"); //from HttpSession
	%>

		
		
		 <nav class="navbar  navbar-expand-md bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="#">Medilog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="register.html">REGISTER</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">CONTACT US</a>
      </li>
    
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        SERVICES
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="logmedicine.jsp">Add medicines</a>
        <a class="dropdown-item" href="searchmedicine.jsp">Search</a>
        
      </div>
    </li>  
    
    <li class="nav-item dropdown ml-auto">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       <i class="fa fa-fw fa-user"></i> <%=user.name %>
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="viewmedicines.jsp">view medicines</a>
        <a class="dropdown-item" href="searchmedicine.jsp"><i class="fa fa-fw fa-search"></i>Search</a>
        <a class="dropdown-item" href="Logout"><i class="fa fa-fw fa-user"></i>Logout</a>
        <a class="dropdown-item" href="profile.jsp"><i class="fa fa-fw fa-edit"></i>edit-profile</a>
      </div>
    </li> 
        
    </ul>
    
    <form class="form-inline my-2 my-lg-0 ml-auto" autocomplete="on" action="viewSearchMedicine.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="searchmedicine" aria-label="Search">
	  <input type="hidden" name="userid" value="<%=user._id %>"  >
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
    </form>

  </div>  
</nav> 
		
		<div style="background-image:url('home.jpg');">
		<center>
		
			<div class="container" style="margin-top:60px;">
			 <div class="alert alert-success alert-dismissible fade show">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <strong>Login Success!</strong> Successfully Login to Medilog.
	  		</div>
		</div>
		
		<br><br>
		
		<div class="container  pt-3 text-center">
  				<h2><b>Welcome Dear <%= user.name %></b></h2>
		<div class="jumbotron text-white jumbotron-image shadow"  style="margin-top:30px;">
			<h4 style="color:black">Medilog will help you to manage your MEDICINES </h4>
		 </div>
		<br>
	
		<img title="Medicines"  class="rounded-circle" src=" cartoon-pills_home.jpg" alt="cartoon - pills" width="50%" height="15%">		
			
			<br><br>
			<button type="button" class="btn btn-primary" onclick="document.location='logmedicine.jsp'"   title="logmedicine">
		ADD MEDICINE</button>
			<button type="button" class="btn btn-primary"onclick="document.location='searchmedicine.jsp?userid=<%=user._id %>'" title="SearchMedicine">
		SEARCH</button>
			<button type="button" class="btn btn-primary"onclick="document.location='viewmedicines.jsp'" title="SearchMedicine">
		VIEW ALL MEDICINES</button><br><br>
	</div>
	</center>
	
	<div class="jumbotron text-center text-white jumbotron-image shadow" style="margin-bottom:0">
		<p class='text-footer'>
		copyright &copy; Medilog 2021- All rights reserved
		</p>
	</div> 
 
</body>
</html>