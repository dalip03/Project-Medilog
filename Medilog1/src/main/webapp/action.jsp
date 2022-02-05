<%@page import="com.dalip.dao.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateOrDelete Medicine</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
   body {   background-image:url("https://st3.depositphotos.com/30906112/35336/i/450/depositphotos_353360894-stock-photo-abstract-background-blue-gradient-white.jpg")
  !important; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-blend-mode:darken;
  position: relative;
  
  } 
  
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
.table{
   background-color:white;
}
</style>


</head>
<body>

<center>
	<%
	
		DB db = new DB();	
	
		String action = request.getParameter("action");
		String medicineId = request.getParameter("medicineid");
		String medicineName = request.getParameter("medicinename");
		String medicineExpiryDate = request.getParameter("medicineexpirydate");
		String medicineTreatments = request.getParameter("medicinetreatments");
		String medicineQuantity = request.getParameter("medicinequantity");
		
		if(action.equals("delete")){
			// delete the fever record
			db.deleteMedicine(medicineId);
	%>		
		<div class="container">
		 <div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Deleted!</strong> Medicine Record Deleted.
  </div>
  </div>
	
	<%
	
	request.getRequestDispatcher("viewmedicines.jsp").include(request, response);
		}else{		
	%>
	   <div class="container">
	 <div class="alert alert-primary alert-dismissible fade show">
    	<button type="button" class="close" data-dismiss="alert">&times;</button>
    	<strong>Updating!</strong> Your updating your medicines record.
  	</div>
  </div>
	
		
	<div class="container">
		<h3 style="margin-top:35px;"><b>UPDATE MEDICINE</b></h3><br>
		
		
		<table class="table table-striped table-bordered">
    <thead class="thead-dark">
      <tr>
        <th>Name</th>
        <th>Expiry Date</th>
        <th>Treatments</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>
    
   <%--  <%
    	ArrayList<Medicine> medicines = db.fetchMedicines(user._id);
    
    	for(Medicine medicine : medicines){
    
    %> --%>
    <form action="update.jsp" method = "get"> 
     
       <tr>
        <td><input type='text' name='medicinename' value='<%=medicineName%>'></td>
        <td><input type='date' name='medicineexpirydate' value='<%=medicineExpiryDate%>'  placeholder="<%=medicineExpiryDate%>"></td>
        <td><input type='text' name='medicinetreatments' value='<%=medicineTreatments%>'></td>
        <td><input type='number' name='medicinequantity' value='<%=medicineQuantity%>'></td>
      </tr>
     
         </tbody>
  </table>
  
		    <input type='hidden' name='medicineid' value='<%=medicineId%>'>
			<br>
		  <button type="submit" class="btn btn-success">UPDATE MEDICINE</button>
		 </form>	  
		 
</div> 
      
      <%
    	    }
      %>

</center>

</body>
</html>html>