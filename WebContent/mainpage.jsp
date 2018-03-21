<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: "Lato", sans-serif;
}
input[type=text] {
    width: 300px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.6s ease-in-out;
    transition: width 0.6s ease-in-out;
    text-align:center;
}

input[type=text]:focus {
    width: 100%;
    background-color: white;
    color: black;
    
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: black;
    opacity: 0.75;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
    color: white;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: red;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="mainpage.jsp" class="closebtn" >&times;</a>
  <a href="#">Make Orders</a>
  <a href="#">Restaurants</a>
  <a href="#">Foods</a>
  <a href="#">Contact us</a>
  <a href="#">Report</a>
</div>

<h2><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; manu</span></h2>
<p><input type="text" name="search" placeholder="Search the food you like.."></p>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "200px";
}

</script>
     
</body>
</html> 