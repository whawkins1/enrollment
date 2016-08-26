<!DOCTYPE html>
   <html lang="en">
      <head>
         <title>Enrollment Center</title>
         <link rel="stylesheet" href="../css/search.css"/>
         <meta charset="UTF-8">
      </head>
      <body>
          <div id="loggedincontainer">
               <label id="loggedinlabel"> Logged in as <span id="fontusername"><?php session_start(); echo $_SESSION['username']; ?></span></label>
          </div>
          <?php include("../php/navigation.php"); ?>
          <div id="searchtextcontainer">
               <div id="searchinputcontainer" class="format_div">
                   <label class="searchlabels">Search Term:</label>
                   <input type="text" id="searchinput" autofocus>
               </div>
               <div id="searchincontainer" class="format_div">
                   <label class="searchlabels">Search In:</label>
                   <select id="indropdown">
                     <option label=" "></option>
                     <option value="courses">Courses</option>
                   </select>    
               </div>    
               <div id="searchbycontainer" class="format_div">
                   <label class="searchlabels">Search By:</label>
                   <select id="bydropdown">
                      <option label=" "></option>
                      <option value="department">Department</option>
                      <option value="location">Location</option>
                      <option value="professor_first_name">Professor First Name</option>
                      <option value="professor_last_name">Professor Last Name</option>
                      <option value="title">Title</option>
                   </select>
               </div>
               <div id="searchbuttoncontainer" class="format_div">               
                   <button type="button" id="searchbutton">Start Search</button>               
               </div>
               <div id="searchresultscontainer">
               </div>
          </div>
          <script src="../plugins/jquery-1.12.0.js"></script>
          <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
          <script src="../javascript/search.js"></script>
      </body>
   </html>