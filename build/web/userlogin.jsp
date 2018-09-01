<%-- 
    Document   : userlogin
    Created on : 31 Oct, 2017, 9:40:56 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
    <%@include  file="headerh.jsp" %>
    </br></br></br>
    <div class="logo">
          <h1>Internet<span>&nbsp;Banking</span> <small>Software</small></h1>
    </div>
    </br></br></br>
    </br></br></br>
    </br></br></br>
</head>
   <body bgcolor="#ffffcc">
        <form action="Login" name="Script_connected" method="post" onsubmit="return validate()" >
            <CENTER>
            <table style="background-color: teal;border-radius: 10px;padding: 10px "WIDTH="30%" >
                <br><br></br></br></br>
            <tr>
                <td>Enter User Id  :</td>
                <td><input type="text" name="u_id"></td>
            </tr>
            <tr>
                <td>Enter Password :</td>
                <td><input type="password" name="u_password"></td>
            </tr>
            <tr>
                <td colspan="2"><CENTER><input type="submit" value = "Login"></center></td>
            </tr>
            </table>
            </center>
        </form>
        </br></br></br>
        </br></br></br>
        </br></br></br>
        <%@include  file="footer.jsp" %>
<script>
function validate()
{
    var usrname = document.Script_connected.u_id.value;
    var psword = document.Script_connected.u_password.value;
    if (usrname==null || usrname=="")
    { 
    alert("Username cannot be blank"); 
    return false; 
    }
    else if(psword==null || psword=="")
    { 
    alert("Password cannot be blank"); 
    return false; 
    }
}
</script>

</body>
</html>


