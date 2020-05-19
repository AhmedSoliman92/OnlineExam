<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create new exam</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 15% 25% 15% 25%;
    background-color: #AC2832; /* Orange */
    color: #ffffff;
}
body {
    background-color: #222930;
}
</style>
</head>
<body>
<%String cid=(String)session.getAttribute("cid");
String pid=(String)session.getAttribute("pid");
System.out.println(pid);%>
<%Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
String sql="SELECT * FROM COURSES WHERE ID="+cid;
PreparedStatement stmt=con.prepareStatement(sql);
ResultSet rs=stmt.executeQuery();
String pid1 = "";
while(rs.next())
{
	pid=rs.getString(2);
	}
	session.setAttribute("pid", pid1); %>
<div class="container">
  <div class="jumbotron vertical-center">
  <h2>Create New Exam</h2>
  <br>
  <form class="form-horizontal" action="CreateNewExam" method="post">
  <div class="form-group">
      <label class="control-label col-sm-4" for="Uid">Teacher ID:</label>
      <div class="col-sm-7">          
        <input type="number" class="form-control" id="Uid" placeholder="Enter Teacher ID." name="Uid" value="<%=pid %>"  required>
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-4" for="cid">Course ID:</label>
      <div class="col-sm-7">          
        <input type="number" class="form-control" id="cid" placeholder="Enter course ID." name="cid" value="<%=cid%>"  required>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">Exam ID:</label>
      <div class="col-sm-7">
        <input type="number" class="form-control" id="id" placeholder="Enter Exam ID." name="id" required>
      </div>
    </div>
    
 <div class="form-group">
      <label class="control-label col-sm-4" for="cid">Type:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="type" placeholder="Enter type " name="type" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-4" for="date">Exam's Date:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="date" placeholder="YY/MM/DD" name="date" required>
      </div>
    </div>
        <div class="form-group">     
        <br>   
      <div class="col-sm-offset-5 col-sm-8">
        <button type="submit" class="btn btn-default">Create</button>
      </div>
    </div>
  </form>
</div>
</div>
</body>
</html>
