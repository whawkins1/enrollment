<!DOCTYPE html>
<?php
   require_once("config.php");
?>   
  <html lang="en">
   <head>
         <title>Enrollment Center</title>
         <link rel="stylesheet" href="../css/searchstyles.css"/>
         <meta charset="UTF-8">
      </head>
      <body>
          <?php include("../php/navigation.php"); ?>
      
          <div id="containerquickfind"> 
                <div id="containerinputcode">
                    <label id="labelinputcodetitle">Enter Courses Code:</label>
                    <input type="text" id="inputcoursecode" autofocus>
                </div>
                <div id="containerbutton">
                    <button type="button" id="quickfindbutton">Find Course</button>
                </div>
          </div>      
     </body>
</html>