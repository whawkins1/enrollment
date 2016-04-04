<!DOCTYPE html>     

<html>
    <head>
       <link rel="stylesheet" href="../css/catalogstyles.css"/>
       <meta charset="UTF-8">
    </head>
     <body>     
        <?php include("../php/navigation.php"); ?>
        <div id="filterdepartment">
                 <label>Filter Department:        
                    <select id="departmentfilter"> 
                            <option>-- Select Department --</option>
                            <option>Business</option>
                            <option>Computer Science</option>
                            <option>English</option>
                            <option>Math</option>
                    </select>        
                 </label>
        </div>
     
        <table id="tablecourses" class="tablesorter">      
              <thead>
                    <tr id="headerRow">
                         <th class="code">Code</th>
                         <th class="name">Name</th>
                         <th class="department">Department</th>
                         <th class="professor">Professor</th>
                         <th class="time">Time</th>
                         <th class="location">Location</th>
                         <th class="credits">Credits</th>
                    </tr>
               </thead>     
                 <tbody>
                 </tbody>    
             </table>
              <script src="../plugins/jquery-1.12.0.js"></script>
              <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
              <script src="../javascript/catalogjs.js"></script>
       </body>
</html>