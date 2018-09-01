<head>
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
<div class="footer">
    <div class="footer_resize">
    <p class="rf">
        Made by &nbsp;<a href="aboutus.jsp">Chirag,Prashant and Sahil</a></p>
    <div style="clear:both;"></div>

    </div>
</div>
<div align=center>Internet Banking</div>
