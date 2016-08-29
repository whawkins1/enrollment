<?php
  include("config.php");
  
  if((isSet($_GET['searchTerm'])) && (!empty($_GET['searchTerm'])) && 
     (isSet($_GET['searchIn'])) && (!empty($_GET['searchIn'])) && 
     (isSet($_GET['searchBy'])) && (!empty($_GET['searchBy'])))  {
         
        $search_term = $_GET['searchTerm'];
        $search_in = $_GET['searchIn'];
        $search_by = $_GET['searchBy'];
        
        $sql = "SELECT * FROM " . $search_in . " WHERE MATCH(" . $search_by . ") AGAINST ( ? IN NATURAL LANGUAGE MODE);";
        
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("s", $search_term);
            
            if ($stmt->execute()) {
                $stmt->store_result();
                if ($stmt->num_rows > 0) {
                    echo "<div id='containerresultstitle'>";
                    echo "<label class='labelresultstitle'>Results</label>";
                    echo "</div>";
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
                    echo    "</tr>";
                    echo  "</thead>"; 
                    echo "<tbody>";
                    
                    $stmt->bind_result($code, $title, $days, $begin_time, 
                                       $end_time, $credits , $professor_last_name, 
                                       $professor_first_name, $location ,
                                       $department, $am_pm);
                    
                     while ($stmt->fetch()) {
                        echo "<tr>";
                          echo "<td>", $code, "</td>";
                          echo "<td>", $title, "</td>";
                          echo "<td>", $department, "</td>";
                          echo "<td>",  $professor_last_name, ", ", $professor_first_name, "</td>";
                          echo "<td>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
                          echo "<td>", $location, "</td>";
                          echo "<td id='credits'>", $credits, "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";
                } else {
                    echo "<div id='containerresultstitle'>";
                    echo "<label class='labelresultstitle'>No Results Found</label>";
                    echo "</div>";
                }                    
            } else {
               echo "ERROR_PROCESS_SEARCH";
            }
       } else {
         echo "ERROR_PROCESS_SEARCH";
       }
   }
?>