<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>HOME</title>
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
<%String Uid=(String)session.getAttribute("Uid");
session.setAttribute("Uid",Uid);%>
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
      <ul class="nav navbar-nav">
   
        <li class="dropdown">

          <ul class="dropdown-menu">
            <li><a href="#>">C</a></li>
            <ul class="dropdown-submenu">
     
          </ul>

          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
  <div class="container">
  <div class="jumbotron vertical-center">
<div class="form-group">
      <label class="control-label col-sm-4" for="add">Register new course</label>
      <div class="col-sm-7">
      <form action="registerCourse.jsp">
        <button type="submit" class="btn btn-default" style="width: 100px;" onclick="">Register</button>
        </form>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-4" for="delete" >My Courses :</label>
      <div class="col-sm-7">
      <form action="ShowCourse.jsp">
        <button type="submit" class="btn btn-default" style="width: 100px;">Show</button>
        </form>
      </div>
    </div>
    <div class="form-group" >
      <label class="control-label col-sm-4" for="update">Exams: </label>
      <div class="col-sm-7">
      <form action="ShowExam.jsp">
        <button type="submit" class="btn btn-default" style="width: 100px;">Show</button>
        </form>
      </div>
    </div>
    </div>
    </div>
<div>
<a href="AdminHome">Student Home</a>
</div>
</from>
</body>
</html>