<!DOCTYPE html>     

<?php require_once("config.php"); ?>

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
                            <?php $result = $conn->query("SELECT DISTINCT department FROM courses");
                                  if($result) {
                                     while($row = $result->fetch_assoc()) { ?>
                                     <option value=<?php echo $row['department']; ?>><?php echo $row['department']; ?></option>
                            <?php }
                                     } ?>
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
                    <?php $result = $conn->query("SELECT * FROM courses");
                          if($result) {
                                while($row = $result->fetch_assoc()) { ?>     
                                    <tr>
                                        <td><?php echo $row['code']; ?></td>
                                        <td><?php echo $row['title']; ?></td>
                                        <td><?php echo $row['department']; ?></td>
                                        <td><?php echo $row['professor_last_name'],  ", ", $row['professor_first_name']; ?></td>
                                        <td><?php echo $row['begin_time'], "-", $row['end_time'], $row['am_pm'],  " ",  $row['days']; ?></td>
                                        <td><?php echo $row['location']; ?></td>
                                        <td><?php echo $row['credits']; ?></td>
                                    </tr>
                            <?php
                                  }  
                            } ?>
                 </tbody>    
             </table>
              <script src="../plugins/jquery-1.12.0.js"></script>
              <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
              <script src="../javascript/catalogjs.js"></script>
       </body>
</html>