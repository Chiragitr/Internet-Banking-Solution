<%-- 
    Document   : welcome
    Created on : 4 Oct, 2017, 7:02:32 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
a:hover {
    background-color: #EB7E37;
    padding:0.5cm;
}

.heade
{
	margin:0;
	padding: 1.5em;
    	color: white;
    	background-color: #363535;
    	clear: left;
 	font:normal 15px/1.5em "Liberation sans", Arial, Helvetica, sans-serif;
}


.second
{
	margin:0;
	padding: 0.5em;
    	color: white;
    	background-color: #EB7E37;
    	clear: left;
	height:143px;
}

.third
{
	margin:0;
    	color: white;
    	background-color: #363535;
    	clear: left;
	height:385px;
}

.mid
{
background-color:#445673;
}

div a{
color: white;
text-decoration: none;
font-size: 20px;
margin-left: 30px;
margin-right:30px;
}
div a.ex {
       margin-left: 1025px;
      }
div h1,h2
{
padding:0;
color: white;
font:normal 35px/1.5em "Liberation sans", Arial, Helvetica, sans-serif;
}

footer
{ 
	margin:0;
	padding:0;
	padding: 0.5em;
    	color: white;
    	background-color: #EB7E37;
    	clear: left;
    	text-align: center;
}

</style>
    </head>
    <body>
       <%@page import="java.sql.DriverManager"%>
       <%@page import="java.sql.ResultSet"%>
       <%@page import="java.sql.Statement"%>
       <%@page import="java.sql.Connection"%> 
         <% 
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//back ni aaega
            response.setHeader("Expires", "0");//for proxy server
            if(session.getAttribute("user_id")==null)
            {
                response.sendRedirect("index.html");
            }
            
          %>
            <div class="heade">
                welcome ${user_id}
                    <a href="Logout" class="ex">Log Out</a>
            </div>
                    <div class="second">
                    <h1>Internet<span>Banking</span><br> <small>Software</small></h1>
                    </div>
                    <div class="third">
                    <%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "bank";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font color="red"><strong>Information</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" style="background-color: teal;border-radius: 10px" WIDTH="30%">
    </tr>
<tr bgcolor="#A52A2A">
<td><b>Account_Id</b></td>
<td><b>User_Name</b></td>
<td><b>Account_Number</b></td>
<td><b>Available_balance</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, "root","root");
statement=connection.createStatement();
String sql ="select * from accounts where user_name=chirag";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="">

<td><%=resultSet.getString("a_id") %></td>
<td><%=resultSet.getString("user_name") %></td>
<td><%=resultSet.getString("acc_no") %></td>
<td><%=resultSet.getString("avail_balance") %></td>
</tr>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</table> 
</div>
<footer>Chirag_gupta</footer>
    </body>
</html>
