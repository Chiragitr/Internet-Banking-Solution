<%-- 
    Document   : transferpage
    Created on : 5 Nov, 2017, 5:02:58 PM
    Author     : Chirag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
   <%@include  file="insideheader.jsp" %>
   <div class="logo">
   <h1>Internet<span>&nbsp;Banking</span> <small>Software</small></h1>
   </div>
   </br></br></br>
   </br></br></br></br></br>
   </br></br></br></br></br>

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
        <form action="Update" name="Script_connected" method="post" onsubmit="return validate()">
        <CENTER>
           <table style="background-color: teal;border-radius: 10px;padding: 10px "WIDTH="30%" >
                <br><br>
                    <%
                    String usrr =  session.getAttribute("u_id").toString();
                    out.print("<tr>");//out object already present in jsp
                    out.print("<input type='hidden' name='abc' value='"+usrr+"'>");//hidden form fields connected jsp to servlet for session data
                    out.print("</tr>");
                    %>
              <!--  <tr>
                    <td>Your Name:</td>
                    <td><input type="text" id="1" name="acc_name"</td>
                </tr>-->
             <tr>
                <td>From A/C Number:</td>
                <td><input type="text" id="1" name="F_A/C_number"></td>
             </tr>
             <tr>
                <td>To A/C Number:</td>
                <td><input type="text" id="1" name="T_A/C_number"></td>
             </tr>
            <tr>
                <td>Transaction Password:</td>
                <td><input type="password" id="1" name="Tid"</td>
            </tr> 
            <tr>
                <td>Amount:</td>
                <td><input type="text" id="1" name="Amount"></td>
            </tr>
            <tr>
                <td width="50%"><center><input type="submit" value="Transfer"></center></td>
                <td width="50%"><center><input type="reset" value="Clear"></center></td>
            </tr>
            </table>
       </center> 
       </form>
        </br></br></br>
        </br></br></br>
        </br>
        <%@include  file="footer.jsp" %>
       <!--<script>
           function validate()
           {
                var acname = document.Script_connected.acc_name.value;
                var fac = document.Script_connected.F_A/C_number.value;
                var tac = document.Script_connected.T_A/C_number.value;
                var tidd = document.Script_connected.Tid.value;
                var amount = document.Script_connected.Amount.value;
                if (acname==null || acname==""||fac==null || fac==""||tac==null || tac==""||tidd==null || tidd=="")
                { 
                    alert("any filed cannot be blank"); 
                    return false; 
                }
                else
                { 
                    //alert("Any field can't be blank"); 
                    return true; 
                }
           }
        </script> -->  
    </body>

