<%-- 
    Document   : firstpage
    Created on : 1 Nov, 2017, 5:36:38 PM
    Author     : USER
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
    <%@include  file="insideheader.jsp" %>
    </br></br></br>
    </br></br></br>
    <div class="logo">
          <h1>Internet<span>&nbsp;Banking</span> <small>Software</small></h1>
      </div>
    </br></br></br>
    </br></br></br>
    </br></br></br>
</head>
<body>
       <%@page import="java.sql.DriverManager"%>
       <%@page import="java.sql.ResultSet"%>
       <%@page import="java.sql.Statement"%>
       <%@page import="java.sql.Connection"%> 
       <%!
           //String usrr = u_id;
           %>
       <% 
             
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//back ni aaega
            response.setHeader("Expires", "0");//for proxy server
            
            if(session.getAttribute("u_id")==null)
            {
                response.sendRedirect("homepage.jsp");
            }
            
        %>
        <%
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "new";

                try 
                {
                  Class.forName(driverName);
                } 
                catch (ClassNotFoundException e) 
                {
                    e.printStackTrace();
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
        %>
    <h2 align="center"><font color="red"><strong>Information</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" style="background-color: teal;border-radius: 10px" WIDTH="30%">
    <tr bgcolor="#A52A2A">
    <td><b>Account_Id</b></td>
    <td><b>User_Name</b></td>
    <td><b>Account_Number</b></td>
    <td><b>Available_balance</b></td>
    <td><b>Fund Transfer</b></td>
    <td><b>Transaction History</b></td>
</tr>
        <%
            try
            {     
                String usrr =  session.getAttribute("u_id").toString();
                connection = DriverManager.getConnection(connectionUrl+dbName, "root","root");
                statement=connection.createStatement();
                String sql ="select * from accounts where uid='"+usrr+"'";
                //statement = connection.prepareStatement(sql);
                //statement.setString(1,"u_id");
                resultSet = statement.executeQuery(sql);
            while(resultSet.next())
            {
       %>
        <tr bgcolor="">
            <td><%=resultSet.getString("aid") %></td>
            <td><%=resultSet.getString("name") %></td>
            <td><%=resultSet.getString("ano") %></td>
            <td><%=resultSet.getString("avbal") %></td>
            <td><a href="transferpage.jsp">Click Here</a></td>
            <td><a href="trans_his_form.jsp">Click Here</a></td>
        </tr>
      <% 
            }
           } 
            catch (Exception e) 
            {
                e.printStackTrace();
            }
        %>
</table>
        </br></br></br>
        </br></br></br></br>
        <%@include  file="footer.jsp" %>
</body>
</html>