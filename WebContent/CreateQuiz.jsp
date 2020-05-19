<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
    String user=(String)session.getAttribute("pid");
    session.setAttribute("Uid",user);
    String eid=(String)session.getAttribute("eid");
    System.out.println("session "+eid);
   session.setAttribute("eid", eid); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>C-CREATE QUESTIONS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 5% 0% 1% 0%;
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
      <a class="navbar-brand" href="teacherHome.jsp">Online Exam</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">

        <li class="dropdown">
          <a style="background-color:#E3AE57;" class="dropdown-toggle" data-toggle="dropdown" href="#">QESTIONS<span class="caret"></span></a>
          <ul class="dropdown-menu">

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
<center><h3>CREATE QUESTION</h3></center><br>
  <form class="form-horizontal" action="CreateQuiz" method="post">
  <div class="form-group">
      <label class="control-label col-sm-2" for="ans">Question number:</label>
      <div class="col-sm-10">
        <input type="number" class="form-control" id="ans" placeholder="Enter qurstoins number" name="id" maxlength="55">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ques">Question:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="ques" placeholder="Enter Question" name="question" maxlength="65435">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="opta">Optiona:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="opta" placeholder="Enter Option a" name="opta" maxlength="16358">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="optb">Option b:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="optb" placeholder="Enter Option b" name="optb" maxlength="16358">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="optc">Option c:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="optc" placeholder="Enter Option c" name="optc" maxlength="16358">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="optd">Option d:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="optd" placeholder="Enter Option d" name="optd" maxlength="16358">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ans">Correct Option:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="ans" placeholder="Enter correct option" name="answer" maxlength="16358">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="optb">Mark</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="mark" placeholder="Enter the questions' mark" name="mark" maxlength="4">
      </div>
    </div>
    
    <div class="form-group">     
        <br>   
      <div class="col-sm-offset-5 col-sm-8">
        <button type="submit" class="btn btn-default">CREATE</button>
      </div>
    </div>
  </form>





</div>
</body>
</html>