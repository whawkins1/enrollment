<?php
   require_once('config.php');
   require_once('utilityFunctions.php');
   session_start();
   //PASS USER EMAIL OR SESSION VARIABLE
	  if(isset($_GET['code'])) {
	     $code = $_GET['code'];
		 $sql = "SELECT * FROM courses WHERE code = ?";
		 
		 if ($stmt =  $conn->prepare($sql)) {
		   $stmt->bind_param("s", $code);
		   if ($stmt->execute()) {
			   $stmt->store_result();
			   if ($stmt->num_rows > 0) {
				   $stmt->bind_result($code, $title, $days, $begin_time, 
									  $end_time, $credits, $professor_last_name, 
									  $professor_first_name, $location, $department, $am_pm);
					  $stmt->fetch();				  
					  echo "<table id='quickfindtable'";
					  echo '<thead>';
							echo '<tr>';
								 echo '<th class="code">Code</th>';
								 echo '<th class="name">Name</th>';
								 echo '<th class="department">Department</th>';
								 echo '<th class="professor">Professor</th>';
								 echo '<th class="time">Time</th>';
								 echo '<th class="location">Location</th>';
								 echo '<th class="credits">Credit</th>';
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
					  echo "</table>";
					  $stmt->close();
					  
					  $current_date = getCurrentDateObject(null);
					  $current_year = $current_date->format("Y");
					  $email_escaped_string = $conn->real_escape_string($_SESSION['username']);
					  $check_enrolled_course_sql = "SELECT EXISTS (SELECT * FROM enrolled_" . $current_year . 
					                               " WHERE user_email_" . $current_year . " = " . $email_escaped_string . " AND user_course_code = " . $code . ")";
					  $button_text = "Enroll";
					  $row_count = 50;
					  if($result = $conn->query($check_enrolled_course_sql)) {
					     $row_count = $result->num_rows;
						 
						 if($row_count > 0) {
						    $button_text = "Unenroll";
						 }
						 $result->close();
					  }
					  
					  echo "<button id='buttonenroll'>", $button_text, "</button>";
					  echo $row_count;
			   } else {
			      echo "NO RESULT";
			   }
		   }
		 }
	  }
?>