<?php
  include("config");
  
  if(isSet($_GET['searchTerm'] && !isEmpty($_GET['searchTerm'] && 
     isSet($_GET['searchIn'] && !isEmpty($_GET['searchIn'] && 
     isSet($_GET['searchBy'] && !isEmpty($_GET['searchBy'])  {
         
        $search_term = $_GET['searchTerm'];
        $search_in = $_GET['searchIn'];
        $search_by = $_GET['searchBy'];
        
        $sql = "SELECT * FROM " . $search_in . " WHERE MATCH(" . $search_by . ") AGAINST ( ? IN NATURAL LANGUAGE MODE);";
        
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("s", $search_term);
            
            if($stmt->execute()) {
                echo "<div id='containerresults>";
                echo "<label id='labelresultstitle'>Results For ", $search_term, " In ", $search_in, " By ", $search_by, "</label>";
                echo "<div id='containerresultstable'>";
                echo "<table id='tableresults' class='tablesorter'>";
                echo "<thead>";
                echo    "<tr id='headerRow'>";
                echo       "<th class='code'>Code</th>";
                echo       "<th class='name'>Name</th>";
                echo       "<th class='department'>Department</th>";
                echo       "<th class='professor'>Professor</th>";
                echo       "<th class='time'>Time</th>";
                echo       "<th class='location'>Location</th>";
                echo       "<th class='credits'>Credits</th>";
                echo       "</tr>";
                echo   "</thead>"; 
                echo "<tbody>";
                
                $stmt->bind_result($code, $title, $days, $begin_time, 
                                   $end_time, $am_pm, $credits, 
                                   $professor_last_name, $professor_first_name, 
                                   $location, $department);
                                   
                while ($row = $stmt->fetch()) {
                    while ($stmt->fetch()) {
                    echo "<tr>";
                      echo "<td>", $code, "</td>";
                      echo "<td>", $title, "</td>";
                      echo "<td>", $department, "</td>";
                      echo "<td>",  $professor_last_name,  ", ", $professor_first_name, "</td>";
                      echo "<td>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
                      echo "<td>", $location, "</td>";
                      echo "<td id='credits'>", $credits, "</td>";
                    echo "</tr>";
                }
                echo "</tbody>";
              }
          }
     }
 }
?>