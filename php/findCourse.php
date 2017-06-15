<?php
   require_once('config.php');
	  if(isset($_POST['code']) {
	     $code = $_POST['code'];
		 
		 $sql = "SELECT * FROM courses WHERE code = ?";
		 
		 if ($stmt =  $conn->prepare($sql)) {
		   $stmt->bind_param("s", $code);
		   if ($stmt->execute()) {
			   $stmt->store_result();
			   $stmt->bind_result($code, $title, $days, $department, $begin_time, 
                                  $end_time, $am_pm, $credits, $professor_last_name, 
                                  $professor_first_name, $location, $department );
				  echo "<table id='quickfindtable'"
				  echo '<thead>';
                        echo '<tr>';
                             echo '<th class="code">Code</th>';
                             echo '<th class="name">Name</th>';
                             echo '<th class="department">Department</th>';
                             echo '<th class="professor">Professor</th>';
                             echo '<th class="time">Time</th>';
                             echo '<th class="location">Location</th>';
                             echo '<th class="credits">Credits</th>';
                        echo '</tr>';
                   echo '</thead>';     
				  echo "<tr>";
                        echo "<td>", $code, "</td>";
						echo "<td>", $title, "</td>";
						echo "<td>", $department, "</td>";
						echo "<td>",  $professor_last_name,  ", ", $professor_first_name, "</td>";
						echo "<td>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
						echo "<td>", $location, "</td>";
						echo "<td id='credits'>", $credits, "</td>";
                  echo "</tr>";
				  echo "</table>"
		   }
		   $stmt->close();
		 }
	  }
?>