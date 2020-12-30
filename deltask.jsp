<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String username=request.getParameter("username");

try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = null;
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {
java.sql.Statement stmt=con.createStatement();

 				
        		int a=stmt.executeUpdate("delete  from userm where ID="+id+";");
				
				if(a>0){
					out.println(username);
					out.println("<a href='login.jsp?username="+username+"'>Click</a>");
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