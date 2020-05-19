<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>delete user</title>
  <meta charset="SO-8859-1"">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 15% 25% 2% 25%;
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
  <h2>Update user</h2>
  <br>
  <form class="form-horizontal" action="DetermineUpdate" method="post">
  <h3>Please enter Username ID That will be updated</h3>
    <div class="form-group">
      <div class="col-sm-7">
        <input type="number" class="form-control" id="id" placeholder="Enter Username No." name="Uid">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-5 col-sm-7">
        <button type="submit" class="btn btn-default">Update</button>
      </div>
    </div>
  </form>
</div>
</div>
</body>
</html>