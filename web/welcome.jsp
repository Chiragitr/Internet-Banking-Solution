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
    </head>
    <body>
        <% 
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//back ni aaega
            response.setHeader("Expires", "0");//for proxy server
            if(session.getAttribute("user_id")==null)
            {
                response.sendRedirect("index.html");
            }
            
            %>
            welcome ${user_id}//jstl
            
            <form action="Logout">
                <input type="submit" value="logout">
            </form>
    </body>
</html>
