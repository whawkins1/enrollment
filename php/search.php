
   <html lang="en">
      <head>
         <title>Enrollment Center</title>
         <meta charset="UTF-8">
      </head>
      <body>
          <?php include("../php/navigation.php") ?>
          <div id="searchtextcontainer">
               <div id="searchinputcontainer">
                   <label class="searchlabel">Search</label>
                   <input type="text" id="searchinput">
               </div>
               <div id="searchincontainer">
                   <label class="searchlabels">Search In:</label>
                   <select id="indropdown">
                     <option value="courses">courses</option>
                   </select>    
               </div>    
               <div id="searchbycontainer">
                   <label class="searchlabels">Search By:</label>
                   <select id="bydropdown"></select>
               <div>
               <div id="searchbuttoncontainer">               
                   <button type="button" id="searchbutton">Start Search</button>               
               </div>
               <table id="searchtable" class="tablesorter">
               </table>
          </div>
      </body>
   </html>   



