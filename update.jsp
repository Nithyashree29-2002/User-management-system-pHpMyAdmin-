<html>
<body>
<form>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
int nid=Integer.parseInt(request.getParameter("nid"));
String fname=request.getParameter("nfname");
String lname=request.getParameter("nlname");
String email=request.getParameter("nemail");
String designation=request.getParameter("ndesignation");
String username=request.getParameter("username");
try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = null;
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Table1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
    		try {
java.sql.Statement stmt=con.createStatement();

 				
int a=stmt.executeUpdate("update userm set Firstname='"+fname+"' where ID="+nid+";");
int b=stmt.executeUpdate("update userm set Lastname='"+lname+"' where ID="+nid+";");
int c=stmt.executeUpdate("update userm set email='"+email+"' where ID="+nid+";");
int d=stmt.executeUpdate("update userm set designation='"+designation+"' where ID="+nid+";");

                
				
				if(a>0|b>0|c>0|d>0){
					out.println(username);
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