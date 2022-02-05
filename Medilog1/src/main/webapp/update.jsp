
<%@page import="com.dalip.dao.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update fever</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</head>
<body>

			   <div class="container">
	 <div class="alert alert-primary alert-dismissible fade show">
    	<button type="button" class="close" data-dismiss="alert">&times;</button>
    	<strong>Medicine Updated!</strong> Medicine updated successfully.
  	</div>
  </div>
	

	<%
		String medicineId = request.getParameter("medicineid");
		String medicineName = request.getParameter("medicinename");
		String medicineExpiryDate = request.getParameter("medicineexpirydate");
		String medicineTreatments = request.getParameter("medicinetreatments");
		String medicineQuantity = request.getParameter("medicinequantity");
	
	 	DB db = new DB();
		db.updateMedicine(medicineName, medicineExpiryDate, medicineTreatments, medicineQuantity, medicineId);
			
		
	%>
	<!-- 
	<h3>Medicine Updated</h3><br>
	<h3><a href='viewmedicines.jsp'>View all MEDICINES RECORDS</a></h3>  -->

	<%
	request.getRequestDispatcher("viewmedicines.jsp").include(request, response);
	%>


</body>
</html>