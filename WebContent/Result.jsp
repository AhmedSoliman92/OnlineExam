<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>C-TEST INSTRUCTIONS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 5% 0% 2% 0%;
    background-color: grey; /* Orange */
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

          </ul>
        </li>

      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
  <center>
      


<div class="container">
<div class="jumbotron vertical-center">
<center><h2><div class="container" style="width:40%;">
      <div class="alert alert-warning alert-dismissable fade in">

    <strong><% String marks=(String)session.getAttribute("marks");%>
 You mark is : <%=marks %></strong>
      </div></center></div></h2></center>

<br><br>
</div>
</div>
</body>
</html>

