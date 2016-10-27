<?php
  require_once("config.php");
  session_start();
  
  if (isset($_POST['username'])) {
      $current_date = new simpleDate();
      $current_year = $current_date->now()->getYear();
     $sql = "INSERT INTO enrolled_" . $current_year " user_email_" . $current_year . ", user_grade_" . $current_year . ", user_semester_" . $current_year_", user_course_code VALUES"   
  }
?>