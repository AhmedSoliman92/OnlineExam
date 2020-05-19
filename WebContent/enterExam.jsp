<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%String Uid=(String)session.getAttribute("Uid");
String eid=(String)session.getAttribute("eid");
session.setAttribute("Uid", Uid);
session.setAttribute("eid", eid);
String id="";
String question="";
String mark="";
String time="";
String a="";
String b="";
String c="";
String d="";
String answer="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
	String sql="SELECT * FROM QUESTION WHERE EID="+eid;
	PreparedStatement stmt=con.prepareStatement(sql);
	
	ResultSet rs=stmt.executeQuery();
	%>
	
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>C TEST</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 10% 0% 2% 0%;
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

          </ul>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
<% while(rs.next())
	{
	id=rs.getString(1);
	eid=rs.getString(2);
	question=rs.getString(3);
	mark=rs.getString(4);
	
	a=rs.getString(5);
	b=rs.getString(6);
	c=rs.getString(7);
	d=rs.getString(8);
	answer=rs.getString(9);
	
			 
		 
		 session.setAttribute("answer",answer);
		 session.setAttribute("mark",mark);
%>
		<form class="form-horizontal" action="EnterExam" method="post">
    <div class="jumbotron vertical-center">			

<div class="container">
  <CENTER><h1>QUESTION</h1></CENTER>

		<br>

    <div class="form-group"> 
   <label><% out.print(question); %></label> 
   <br>
 
      <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="a" value="<%=a %><"><%=a %></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="a" value="<%=b %>"><%=b %></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="a" value="<%=c %>"><%=c %></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
<label class="radio-inline"><input type="radio" name="a" value="<%=d %>"><%=d %></label>
</div>
</div>
<div class="row">
<div class="form-group">     
        <br>   
      <div class="col-sm-offset-4 col-sm-3">
        <button type="submit" class="btn btn-default" name="qid" value="<%=id%>">Save And Send</button>
      </div>
    </div>
    </div>
    </div>

  <%		 }
}catch(Exception e){
	 System.out.println(e);
} %>

</div>

</form>
<form  action="Result" method="post">
<div class="row">
<div class="form-group">     
        <br>   
      <div class="col-sm-offset-4 col-sm-3">
        <button type="submit" class="btn btn-default" name="qid" value="<%=id%>">Finish</button>
      </div>
    </div>
    </div>
    </form>
</body>
</html>
