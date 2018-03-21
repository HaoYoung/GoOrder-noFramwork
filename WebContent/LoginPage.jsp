<%@ page import ="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*" %>
<%@	page import="java.math.*"%>
<%@ page import="java.io.UnsupportedEncodingException"%>                                                                                          
<%@ page import="javax.crypto.*"%>                                                                                      
<%@ page import="java.security.*"%>

<%!
	public static String encrypt(String input) {
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashPwd = number.toString(16);
			while (hashPwd.length() < 32) {
				hashPwd = "0" + hashPwd;
			}
			return hashPwd;
		} catch (Exception e){
			throw new RuntimeException(e);
		}
	}
%>

<%
    String type = "";
	String email = request.getParameter("uname");    
	String pwd = request.getParameter("psw");
	String encrypted = encrypt(pwd);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/goorder",
	        "root", "root");
	Statement st = con.createStatement();
	ResultSet rs;

	rs = st.executeQuery("select * from user where email='" + email + "' and password='" + encrypted + "'");

	if (rs.next()) {
		session.setAttribute("email", email);
		type = rs.getNString("type");
		if(type.equals("user")){
		    response.sendRedirect("mainpage.jsp");
		}
		else if(type.equals("restaurant")){
			response.sendRedirect("BusinessMainPage.html");
		}
		else{
			out.println("error");
			response.sendRedirect("LoginPage.html");
		}
	} else {
	    out.println("Invalid password <a href='LoginPage.html'>try again</a>");
	}
%>