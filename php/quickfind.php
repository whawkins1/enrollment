<!DOCTYPE html>
<?php
   session_start();
?>   
  <html lang="en">
   <head>
         <title>Enrollment Center</title>
         <link rel="stylesheet" href="../css/quickfindstyles.css"/>
         <meta charset="UTF-8">
      </head>
      <body>
          <?php include("../php/navigation.php"); ?>
      
          <div id="containerquickfind"> 
                <div id="containerinputcode">
                    <label id="labelinputcodetitle">Enter Course Code:</label>
                    <input type="text" id="inputcoursecode" autofocus>
					<button type="button" id="quickfindbutton" title="Start Search" disabled></button>
                </div>
				<div id="containerresult">
				</div>
         </div>      
              <script src="../plugins/jquery-1.12.0.js"></script>
              <script src="../javascript/quickfind.js"></script>
     </body>
</html>