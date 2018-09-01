<%-- 
    Document   : transferredpage
    Created on : 10 Nov, 2017, 6:50:56 PM
    Author     : USER
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
           try {
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
        <h2 align="center"><font color="red"><strong>REQUESTED INFORMATION</strong></font></h2>
        <table align="center" cellpadding="5" cellspacing="5" border="1" style="background-color: teal;border-radius: 10px" WIDTH="30%">
        <tr bgcolor="#A52A2A">
        <td><b>Id</b></td>
        <td><b>FromA/C</b></td>
        <td><b>ToA/C</b></td>
        <td><b>Amount</b></td>
        <td><b>Date</b></td>
        </tr>
        <%
        try{     
            String no =  session.getAttribute("A/Cnumber").toString();
            System.out.println("transferred page:"+no);
            connection = DriverManager.getConnection(connectionUrl+dbName, "root","root");
            statement=connection.createStatement();
            String sql ="select * from Transactions where Fromacno='"+no+"'or Toacno='"+no+"'";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next())
            {
        %>
            <tr bgcolor="">
            <td><%=resultSet.getString("id") %></td>
            <td><%=resultSet.getString("Fromacno") %></td>
            <td><%=resultSet.getString("Toacno") %></td>
            <td><%=resultSet.getString("Amount") %></td>
            <td><%=resultSet.getString("Date")%></td>
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
       </br></br></br>
       </br>
       <%@include  file="footer.jsp" %>
</body>
</html>