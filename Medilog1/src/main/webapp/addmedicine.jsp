
<%@page import="com.dalip.Model.Medicine"%>
<%@page import="com.dalip.dao.DB"%>
<%@page import="com.dalip.Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Fever</title>
</head>
<body>

	<%
		User user = (User) session.getAttribute("keyUser");
	%>

	<center>
		<h3>Welcome to Medicines Management</h3>
		<b><%=user.name%></b>
		<b><%=user._id %></b>


		<%
		
		Medicine medicine = new Medicine();
				medicine.userId = user._id;
				medicine.mdName = request.getParameter("mdname");
				medicine.mdExpiryDate = request.getParameter("mdexpirydate");
				medicine.mdQuantity = request.getParameter("mdquantity");
				medicine.mdTreatments = request.getParameter("mdtreatment");
			
				DB db = new DB();
				db.logMedicine(medicine);
		%>

		<%-- <p>
			Your Medicine has been Recorded Successfully:
			<%=medicine.mdName%></p>
			
		<h3><a href='viewmedicines.jsp'>View all  MEDICINES RECORDS</a></h3>  --%>	
		
	  </center>	
	  
	 
	  
			<%
			RequestDispatcher view = request.getRequestDispatcher("viewmedicines.jsp");
			view.forward(request, response);
			%>
			



</body>
</html>