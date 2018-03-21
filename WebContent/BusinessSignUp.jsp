<%@ page import ="java.sql.*" %>
<%

    String restaurantname = request.getParameter("restaurantname");

	String pwd = request.getParameter("psw");
	String fname = request.getParameter("first_name");
	String lname = request.getParameter("last_name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String user = "restaurant";
	int id = 0;
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/goorder",

	        "root", "root");
	Statement st = con.createStatement();
	// password restriction
	boolean check = true;
    boolean hasSpecial   = !pwd.matches("[A-Za-z0-9 ]*");
    boolean hasUpperCase = !pwd.equals(pwd.toLowerCase());
    boolean hasLowerCase = !pwd.equals(pwd.toUpperCase());
    
    if(pwd.length()<8){
    	check=false;
    }
    
    if(!hasSpecial || !hasUpperCase || !hasLowerCase){
    	check = false;
    	out.println("Special = "+hasSpecial+", Upper = "+hasUpperCase+", Lower = "+hasLowerCase);
    }
    
    // Result 
    if(check){
	    try{
		    int i = st.executeUpdate("insert into user(user_id, fname, lname, email, phone, password,company_name,type,regdate) values (127,'" + fname + "','" + lname + "','" + email + "', '"+phone+"' ,'" + pwd + "','" + restaurantname + "','" + user + "', CURDATE() )");
		    if (i > 0) {
		        //session.setAttribute("userid", user);
		        response.sendRedirect("LoginPage.html");
		       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
				
		        
		    } else {
		        response.sendRedirect("index.jsp");
		    }
	    } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
	    	out.println("This username, email, or password is already taken <a href='SignUp.html'>try again</a>");
	    }
    } else {
    	out.println("The password must be at least 8 characters long, have an upper case letter, lower case letter, and a special charater. <a href='SignUp.html'>try again</a>");
    }
%>