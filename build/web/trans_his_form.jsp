<%-- 
    Document   : trans_his_form
    Created on : 17 Nov, 2017, 2:33:02 PM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form Transaction</title>
        <%@include  file="insideheader.jsp" %>
        </br></br></br></br>
    <div class="logo">
          <h1>Internet<span>&nbsp;Banking</span> <small>Software</small></h1>
    </div>
    </br></br></br>
    </br></br></br>
    </br></br></br>
    <script>
    function ClearFields() 
    {
     document.getElementById("1").value = "";
    }
    </script>
    </head>
    <body>
        <% 
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//back ni aaega
            response.setHeader("Expires", "0");//for proxy server
            if(session.getAttribute("u_id")==null)
            {
                response.sendRedirect("homepage.jsp");
            }
        %>
<h2 align="center"><font color="red"><strong>TO SEE TRANSACTION HISTORY</strong></font></h2>
        <form action="checkdb">
        <center>
            <table style="background-color: teal;border-radius: 10px;padding: 20px" WIDTH="30%" >
                <br><br>
                <%
                    String usrr =  session.getAttribute("u_id").toString();
                    out.print("<tr>");//out object already present in jsp
                    out.print("<input type='hidden' name='abc' value='"+usrr+"'>");//hidden form fields connected jsp to servlet for session data
                    out.print("</tr>");
                    %>
               <!--<tr>
                    <td>Enter User id:</td>
                    <td><input type="text" id="1" name="uiid"</td>
                </tr>-->
                <tr>
                    <td>Enter A/C Number:</td>
                    <td><input type="text" id="1" name="A/Cnumber"</td>
                </tr>
                <tr>
                <td width="50%"><center><input type="submit" value="Submit"></center></td>
                <td width="50%"><center><input type="reset" value="Clear"></center></td>
                </tr>
            </table>
        </center>
        </form>
    </br></br></br>
    </br></br></br>
    </br></br></br>
    <%@include  file="footer.jsp" %>
    </body>
</html>
