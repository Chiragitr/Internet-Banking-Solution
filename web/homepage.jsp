<%-- 
    Document   : homepage
    Created on : 31 Oct, 2017, 8:56:25 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<title>Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script src = "https://maps.googleapis.com/maps/api/js"></script>
      <script>
         function loadMap() {
			
            var mapOptions = {
               center:new google.maps.LatLng(17.609993, 83.221436),
               zoom:10,
               mapTypeId:google.maps.MapTypeId.ROADMAP
            };
				
            var map = new google.maps.Map(document.getElementById("sample"),mapOptions);
         }
      </script>

</head>
    <div class="header">
        <div class="header_resize">
            <div class="menu_nav">
               <ul>
                 <!-- <li class=""><a href="Homepage.jsp"><span>Home Page</span></a></li> -->
                 <li><a href="userlogin.jsp"><span>Login</span></a></li>
                 <li><a href="aboutus.jsp"><span>Contact Us</span></a></li>
               </ul>
            </div>
        
     
      <div class="logo">
          <h1>Internet<span>&nbsp;Banking</span> <small>Software</small></h1>
      </div>
      
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/bank3.jpg" width="960" height="1000" alt="" /></a><!-- <a href="#"><img src="images/bank2.jpg" width="960" height="1000" alt="" /></a> <a href="#"><img src="images/bank4.jpeg" width="960" height="1000" alt="" /></a> --></div>
      </div>
    </div>
   </div>
        </br></br></br>
        </br></br>
<%@include  file="footer.jsp"%>
