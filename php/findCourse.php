<?php
   require_once('config.php');
   require_once('utilityFunctions.php');
   session_start();
     if(isset($_GET['code'])) {
	     $code = $_GET['code'];
		 $find_course_sql = "SELECT * FROM courses WHERE code = ?";
		 
		 if ($stmt = $conn->prepare($find_course_sql)) {
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
					  echo "<div id='messageContainer'><label id='enrollmessage'></label></div>"
					  $stmt->close();
					  
					  $current_date = getCurrentDateObject(null);
					  $current_year = $current_date->format("Y");
					  $username = $_SESSION['username'];
					  
					  $check_enrolled_course_sql = "SELECT EXISTS (SELECT * FROM enrolled_" . $current_year . 
					                               " WHERE user_email_" . $current_year . " = ? AND user_course_code = ? )";
					  $button_text = "Enroll";
					  
					  if ($stmt = $conn->prepare($check_enrolled_course_sql)) {
					      $stmt->bind_param('ss', $username, $code);
						  if ($stmt->execute()) {
						     $stmt->bind_result($exists);
							 $stmt->fetch();
							 
							 if ($exists) {
							    $button_text = "Unenroll";
							 }
							 $stmt->close();
						  } else {
						    echo "ERROR : Preparing Statement to Check if Enrolled.";
						  }						  
					  } else {
					     echo "ERROR : Executing Statement to check if Enrolled.";
					  }
					  echo "<button class='toggleenroll'>", $button_text, "</button>";
			   } else {
			      echo "NO_RESULT";
			   }
		   } else {
		      echo "ERROR : Executing Statment to Find Course.";
		   }
		 } else {
		      echo "ERROR : Preparing Statement to Find Course.";
		 }
	  } else {
	    echo "ERROR : Code Parameter Not Found.";
	  }
?>