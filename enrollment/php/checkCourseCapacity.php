<?php
   require_once('config.php');
   
   $code = $_GET['code'];
   if (isset($code) && !empty($code)) {
      $check_course_capacity = "SELECT current_capacity, max_capacity FROM current_courses_capacity WHERE code = ?";
	  
	  if ($stmt->prepare($check_course_capacity)) {
	     $stmt->bind_param('s', $code);
		 if ($stmt->execute()) {
			 if ($stmt->num_rows > 0) {
			   $stmt->bind_result($current_capacity, $max_capacity);
			   $stmt->fetch();
			   $can_enroll = ;
			   
               echo ($current_capacity < $max_capacity) ? "SEATS_AVAILABLE" : "MAX_CAPACITY";			   
			 } else {
			    echo "N0_CODE_FOUND : The Course Code ", $code, " Was Not Found in Current Courses";
			 }
		 } else {
		    echo "ERROR : An Error Occured Executing Course Capacity Query";
		 }
	  } else {
	     echo "ERROR : An Error Occured Preparing Course Capacity Query";
	  }
   }
?>