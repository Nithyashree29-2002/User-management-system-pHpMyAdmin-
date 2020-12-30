<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String designation=request.getParameter("designation");
String username=request.getParameter("username");

try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = null;
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {
java.sql.Statement stmt=con.createStatement();

 				
        		int a=stmt.executeUpdate("insert into userm values (" + id + ",'" +
fname + "','" +lname+ "','"+email+"','"+designation+"','"+username+"')"); 
				
				if(a>0){
				
					out.println("<a href='login.jsp?username="+username+"'>Click</a>");
				}else{
					out.println("User exists");
				}
					
        			
			} catch (Exception e) {
				out.println(e.getMessage());
			}
    		finally {
				con.close();
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}


%> 	
</form>
</body>
</html>