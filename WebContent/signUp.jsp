<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Add user</title>
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

<div class="container">
  <div class="jumbotron vertical-center">
  <h2>Add user</h2>
  <br>
  <form class="form-horizontal" action="SignUp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">UserName:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="name" placeholder="Enter UserName" name="uname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pass">Password:</label>
      <div class="col-sm-7">          
        <input type="password" class="form-control" id="pass" placeholder="Enter password" name="upass" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="email">Email:</label>
      <div class="col-sm-7">
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="uemail" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="mbno">User No:</label>
      <div class="col-sm-7">          
        <input type="number" class="form-control" id="id" placeholder="Enter Student No." name="uno" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="type">User position:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="type" placeholder="Enter user's position" name="utype" required>
      </div>
    </div>
        <div class="form-group">     
        <br>   
      <div class="col-sm-offset-5 col-sm-8">
        <button type="submit" class="btn btn-default">Add</button>
      </div>
    </div>
  </form>
</div>
</div>
</body>
</html>
