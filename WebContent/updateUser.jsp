<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Update user</title>
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
<%String uid=request.getParameter("Uid");
 %>
<%

String name="";
String type="";
String email="";
String password="";
String id="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
	String sql="SELECT * FROM USERS WHERE ID=?";
	PreparedStatement stmt=con.prepareStatement(sql);
	
	stmt.setString(1,uid);
	ResultSet rs=stmt.executeQuery();
	if(rs.next()){
	 name=rs.getString(1);
	 type=rs.getString(2);
	 email=rs.getString(3);
	 password=rs.getString(4);
	 id=rs.getString(5);
	}
}catch(Exception e){
	System.out.println(e);
}
	
%>
<div class="container">
  <div class="jumbotron vertical-center">
  
  <h2>Update user</h2>
   <form class="form-horizontal" action="UpdateUser" method="post">
  <br>
   <div class="form-group">
      <label class="control-label col-sm-4" for="mbno">User No:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="id" placeholder="Enter Student No." name="uno" value="<%=id%>"  readonly required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">UserName:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="name" placeholder="Enter UserName" name="uname" value="<%=name%>"  required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pass">Password:</label>
      <div class="col-sm-7">          
        <input type="password" class="form-control" id="pass" placeholder="Enter password" name="upass"  value="<%=password%> %>" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="email">Email:</label>
      <div class="col-sm-7">
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="uemail" value="<%=email%>" required>
      </div>
    </div>
   
    <div class="form-group">
      <label class="control-label col-sm-4" for="type">User position:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="type" placeholder="Enter user's position" name="utype" value="<%=type%>" readonly required>
      </div>
    </div>
        <div class="form-group">     
        <br>   
      <div class="col-sm-offset-5 col-sm-8">
        <button type="submit" class="btn btn-default">Update</button>
      </div>
    </div>
  </form>
</div>
</div>

</body>
</html>
