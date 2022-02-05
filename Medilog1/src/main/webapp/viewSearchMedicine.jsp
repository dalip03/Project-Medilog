
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
<meta charset="ISO-8859-1">
<title>Searched medicines</title>
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
	<%
		User user = (User)session.getAttribute("keyUser");
		DB db = new DB();
	%>

<%-- 	<center>
		<h3>All Fevers</h3>
		
		<%
			ArrayList<Fever> fevers = db.fetchFevers(user._id);
		
			for(Fever fever : fevers){
		%>
		 	Fever: <%= fever.fever %><br><br>
		
		<% 
			}
		%>
		
	</center> --%>
	
	<div class="container">
  <h2 style="margin-top:20px;">Medicine Record </h2>
  <br><br>
  
  <button type="button" class="btn btn-success" onclick="document.location='home.jsp'"  style="padding:8px;"  title="LogIN">
		Home</button> 
  <button type="button" class="btn btn-success" onclick="document.location='logmedicine.jsp'" style="padding:8px;"  title="LogIN">
		ADD MEDICINE</button>
  <button type="button" class="btn btn-success"onclick="document.location='viewmedicines.jsp'" title="SearchMedicine">
		VIEW ALL MEDICINES</button>
  <button type="button" class="btn btn-success"onclick="document.location='searchmedicine.jsp?userid=<%=user._id %>'" title="SearchMedicine">
		SEARCH</button>

	<br><br><br>
 

		
		<%	
		   String searchTreatment = request.getParameter("searchmedicine");
		   String userId = request.getParameter("userid");
		%>
		
  
  <p><b>Dear <%=user.name %>, Your Searched medicines records for <b><%=searchTreatment %></b> till date:</b></p> 
            
  <table class="table  table-hover text-black text-bold">
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
    <tbody>
    
    <%
    	
         ArrayList<Medicine> medicines =  db.searchMedicines(searchTreatment, userId);
    
    	for(Medicine medicine : medicines){
    
    %>
      <tr>
        <td><%=medicine.dateTimeStamp %></td>
        <td><%=medicine.mdName %></td>
        <td><%=medicine.mdExpiryDate %></td>
        <td><%=medicine.mdTreatments %></td>
        <td><%=medicine.mdQuantity %></td>
      <td><button type="button" class="btn btn-success"onclick="document.location='action.jsp?action=update&medicineid=<%=medicine._id%>&medicinename=<%=medicine.mdName%>&medicineexpirydate=<%=medicine.mdExpiryDate %>&medicinetreatments=<%=medicine.mdTreatments %>&medicinequantity=<%=medicine.mdQuantity %>'" title="Update Medicine">
		UPDATE</button>
		<button type="button" class="btn btn-success"onclick="document.location='action.jsp?action=delete&medicineid=<%=medicine._id%>'" title="Update Medicine">
		DELETE</button>
      
      </td>
      </tr>
      
      <%
    	}
      %>
    </tbody>
  </table>
</div>
	


</body>
</html>