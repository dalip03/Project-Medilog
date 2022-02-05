
<%@page import="com.dalip.Model.Medicine"%>
<%@page import="com.dalip.Model.User"%>
<%@page import="com.dalip.dao.DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="error.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 	<link rel="stylesheet" href="medilogindex.css">

<meta charset="ISO-8859-1">
<title>Medicines </title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
   body {   background-image:url("ImageBackground.jpg")
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
	<%
		User user = (User)session.getAttribute("keyUser");
		DB db = new DB();
	%>
	
	<div class="container">
  <h2 style="margin-top:20px;">Medicine Record </h2>
  <br>
  <button type="button" class="btn btn-success" onclick="document.location='home.jsp'"  style="padding:8px;"  title="LogIN">
		Home</button> 
  <button type="button" class="btn btn-success" onclick="document.location='logmedicine.jsp'" style="padding:8px;"  title="LogIN">
		ADD MEDICINE</button>
   <button type="button" class="btn btn-success"onclick="document.location='searchmedicine.jsp?userid=<%=user._id %>'" title="SearchMedicine">
		SEARCH</button>		
 
		
	
	<div class="container mt-3">
  <p style="font-size:20px;"><Strong>Type something in the input field to search the table for Medicines, Treatments or Date Time:</Strong></p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br><br>

		
  
  
  <p><b>Dear <%=user.name %>, Your medicines records till date:</b></p> 
  <div class="table-responsive">          
  <table class="table table-striped table-bordered table-hover">
    <thead  class="thead-dark">
      <tr>
        <th>Date Time</th>
        <th>Name</th>
        <th>Expiry Date</th>
        <th>Treatments</th>
        <th>Quantity</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="myTable">
    
    <%
    	ArrayList<Medicine> medicines = db.fetchMedicines(user._id);
    
    	for(Medicine medicine : medicines){
    
    %>
      <tr>
        <td><%=medicine.dateTimeStamp %></td>
        <td><%=medicine.mdName %></td>
        <td><%=medicine.mdExpiryDate %></td>
        <td><%=medicine.mdTreatments %></td>
        <td><%=medicine.mdQuantity %></td>
       <%--  <td><a href='action.jsp?action=update&medicineid=<%=medicine._id%>&medicinename=<%=medicine.mdName%>&medicineexpirydate=<%=medicine.mdExpiryDate %>&medicinetreatments=<%=medicine.mdTreatments %>&medicinequantity=<%=medicine.mdQuantity %>'>UPDATE</a> |
         <a href='action.jsp?action=delete&medicineid=<%=medicine._id%>'>DELETE</a></td>
      --%>
      	<td><button type="button" class="btn btn-success" onclick="document.location='action.jsp?action=update&medicineid=<%=medicine._id%>&medicinename=<%=medicine.mdName%>&medicineexpirydate=<%=medicine.mdExpiryDate %>&medicinetreatments=<%=medicine.mdTreatments %>&medicinequantity=<%=medicine.mdQuantity %>'" title="Update Medicine">
		UPDATE</button>
		<button type="button" class="btn btn-success"onclick="document.location='action.jsp?action=delete&medicineid=<%=medicine._id%>'" title="Delete Medicine">
		DELETE</button>
       </td> 
      </tr>
      
      <%
    	}
      %>
    </tbody>
  </table>
</div>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

	
	
	

</body>
</html>