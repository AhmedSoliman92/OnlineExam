<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Exams</title>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
* {
  font-family: sans-serif;
}

.content-table {
  border-collapse: collapse;
  margin: 25px 0;
  font-size: 0.9em;
  min-width: 400px;
  border-radius: 5px 5px 0 0;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
  background-color: #009879;
  color: #e7e7e7;
  text-align: left;
  font-weight: bold;
}

.content-table th,
.content-table td {
  padding: 12px 15px;
}

.content-table tbody tr {
  border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even) {
  background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
  border-bottom: 2px solid #red;
}

.content-table tbody tr.active-row {
  font-weight: bold;
  color: #009879;
}

.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 15% 25% 15% 25%;
    background-color: #AC2832; /* Orange */
    color: #ffffff;
}
body {
    background-color: #222930;
    color: #ffffff;
}
.navbar-default {
    background-color: #AC2832;
    border-color: #AC2832;
}
 .navbar-default .navbar-nav > .active{
     color: #ffffff;
      background: #E3AE57;
 }
 .navbar-default .navbar-nav > .active > a, 
 .navbar-default .navbar-nav > .active > a:hover, 
 .navbar-default .navbar-nav > .active > a:focus {
      color: #ffffff;
      background: #E3AE57;
 }
.nav.navbar-nav li a {
   color: #fff;
 }

.navbar-default .navbar-brand {
    color: #d6d6d6;
}
.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu {
    background-color: #AC2832;
    color:#ffffff;
  }
</style>
<body>

<from  class="form-horizontal" >
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Online Exam</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    </div>
  </div>
</nav>
  <%
  String cid=request.getParameter("id");
  String pid=request.getParameter("pid");
  String eid="";
  String name="";
  String type="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
	String sql="select * from EXAM where CID=?";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1,cid);
	ResultSet rs=stmt.executeQuery();
	session.setAttribute("cid",cid );
	
	session.setAttribute("Uid",pid );
	session.setAttribute("cid",cid );
	System.out.println("3434343"+cid);
	%>
	 
	 <form class="form-horizontal" action="createExam.jsp" metod="post">
	 <div class="container">
  <div class="jumbotron vertical-center">
  <div class="form-group">
  <h2>Create Exam</h2>

      <div class="col-sm-7">
        <button type="submit" class="btn btn-default" style="width: 100px;" onclick="createExam.jsp" name="id" value="<%=eid %>"> Create exam <%=name %> </button>
</div>
</div>
</form>
<form class="form-horizontal" action="CreateQuiz.jsp" method="post">
  <div class="form-group">
  <h2>Exams page</h2>

<%while(rs.next()){
	eid=rs.getString(1);
	type=rs.getString(3);
	%>
      <div class="col-sm-7">
        <button type="submit" class="btn btn-default" style="width: 100px;" onclick="CreateQuiz.jsp" name="id" value="<%=eid %>"> <%=type %> </button>
        
        <br>
        <br>
       
      </div>
      <%}	


}catch(Exception e){
	System.out.println(e);
}
session.setAttribute("eid",eid ); %>
    </div>
   
</from>



</body>
</html>
