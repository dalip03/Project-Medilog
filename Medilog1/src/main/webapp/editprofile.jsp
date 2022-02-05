<%@page import="com.dalip.Model.User"%>
<%@page import="com.dalip.dao.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile here</title>
</head>
<body>

	<% 
		User user = (User)session.getAttribute("keyUser"); //from HttpSession
	%>
	

	
	

	<%
		String userId = request.getParameter("userid");
		String userName = request.getParameter("txtName");
		String userEmail = request.getParameter("txtEmail");
		String userCurrentPassword = request.getParameter("txtCurrentPassword");
		String userNewPassword = request.getParameter("txtNewPassword");
		
		String userCurrentPasswordHash = user.makePasswordSecure(userCurrentPassword);
		System.out.println("userCurrentPasswordHash: "+userCurrentPasswordHash);
		System.out.println("Password: "+user.password);
		
		if(userCurrentPasswordHash.equals(user.password)){
			String userNewPasswordHash = user.makePasswordSecure(userNewPassword);
			DB db = new DB();
			db.updateUser(userName, userEmail, userNewPasswordHash, userId);
			
			%>
		
		<!-- <div class="container" style="margin-top:90px;"> -->
	 <div class="alert alert-success alert-dismissible fade show">
    	<button type="button" class="close" data-dismiss="alert">&times;</button>
    	<strong>profile Updated!</strong> Your profile updated successfully, Please  <a href="login.html" title="LOGIN">LOGIN</a>  again
  	<!-- </div> -->
  </div>
		<% 	
		
         /* String redirectURL = "login.html";
        response.sendRedirect(redirectURL); */ 
	 	request.getRequestDispatcher("home.jsp").include(request, response);  
		%>
	<% 
			
		}else{
	%>	
			   <div class="container" style="margin-top:90px;">
				 <div class="alert alert-danger alert-dismissible fade show">
			    	<button type="button" class="close" data-dismiss="alert">&times;</button>
			    	<strong>Wrong Password!</strong> Current password is wrong.
			  	</div>
			  </div>
			
	<% 
	request.getRequestDispatcher("profile.jsp").include(request, response);
		} 
	%>	
	
	<!-- 
	<h3>Medicine Updated</h3><br>
	<h3><a href='viewmedicines.jsp'>View all MEDICINES RECORDS</a></h3>  -->
	
	
</body>
</html>