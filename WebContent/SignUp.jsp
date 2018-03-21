<%@ page import ="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@	page import="java.util.Properties"%>                                                                                                     
<%@	page import="javax.mail.Session"%>                                                                                                       
<%@	page import="javax.mail.Authenticator"%>                                                                                                 
<%@	page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@	page import="javax.mail.Message"%>                                                                                                       
<%@	page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@	page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@	page import="javax.mail.Transport"%>

<%@	page import="java.math.*"%>
<%@	page import="java.io.UnsupportedEncodingException"%>                                                                                          
<%@	page import="javax.crypto.*"%>                                                                                      
<%@	page import="java.security.*"%>

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
	String pwd = request.getParameter("psw");
	String fname = request.getParameter("first_name");
	String lname = request.getParameter("last_name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String companyname = " ";
	String user = "user";
	
	
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
	    	String encrypted = encrypt(pwd);

		    int i = st.executeUpdate("insert into user(user_id, fname, lname, email, phone, password,company_name,type,regdate) values (126,'" + fname + "','" + lname + "','" + email + "', '"+phone+"' ,'" + encrypted + "','" + companyname + "','" + user + "', CURDATE() )");

		    if (i > 0) {
		        //session.setAttribute("userid", user);
		        response.sendRedirect("LoginPage.html");
		       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
				
		        String toEmail = email;
		        Properties props = new Properties();
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.socketFactory.port", "465");
		        props.put("mail.smtp.socketFactory.class",
		        		"javax.net.ssl.SSLSocketFactory");
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.port", "465");

		        Session session1 = Session.getInstance(props,
		        	new javax.mail.Authenticator() {
		        		protected PasswordAuthentication getPasswordAuthentication() {
		        			return new PasswordAuthentication("sep18group05","sep00000");
		        		}
		        	});

		        try {
			        	BodyPart messageBodyPart = new MimeBodyPart();
			        	Multipart multipart = new MimeMultipart();
			        	Message message = new MimeMessage(session1);
			        	message.setFrom(new InternetAddress("sep18group05@gmail.com"));
			        	message.setRecipients(Message.RecipientType.TO,
			        			InternetAddress.parse(toEmail));
			        	message.setSubject("Congrats!! Account Successfully Created");
			        	 messageBodyPart = new MimeBodyPart();
			        	 message.setText("Welcome To Iowa Go!\n" + 
			        	 				 "\nDear " + fname + ":" +
			        			 		 "\n	Your account has been successfully created. Your login email is " + email);
	
			        	Transport.send(message);
	
			        	System.out.println("Done");

		        } catch (MessagingException e) {
		        	throw new RuntimeException(e);
		        }

		        System.out.println("Left try block");
		        		
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

