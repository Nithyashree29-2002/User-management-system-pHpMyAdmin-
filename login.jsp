<html>

<body>
<link rel="stylesheet" type="text/css" href="style.css"/> 
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<table>
<tr>
<th>ID</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Designation</th>
</tr>

<%
String username=request.getParameter("username");



    	try {
    		Connection con = null;
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {

        		java.sql.Statement stmt=con.createStatement();  
        		
        		ResultSet rs=stmt.executeQuery("select * from users where Username='"+username+"';"); 
                				
        		if(rs.next())
        		{
                out.println("<p>WELCOME "+username.toUpperCase()+"</p>");
				ResultSet rs2=stmt.executeQuery("select * from userm where Username='"+username+"';");
				out.println("<br>");
				while(rs2.next()){
					out.println("<tr>");
					out.println("<td>"+rs2.getInt(1)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td><td>"+rs2.getString(4)+"</td></tr>");
				}
				out.println("<a href='addtask.html?username="+username+"'><button type='submit'>ADD USER</button></a><a href='del.html?username="+username+"'><button type='submit'>DELETE USER</button></a><a href='update.html?username="+username+"''><button type='submit'>UPDATE USER DETAILS</button></a>");
				
	
                }
				
        		else{
					out.println("Inavlid username or password");
				}
				

        			
			} catch (Exception e) {
				// TODO: handle exception
			}
    		finally {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
	
		}
%>
</body>
</html>