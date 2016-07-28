<?php
   require_once("config.php");
   
   $email = $_POST['email'];
   $code = $_POST['code'];
   $semester = $_POST['semester'];
   $year = $_POST['year'];
   
   if (isset($email) && !empty($email) &&
           isset($code) && !empty($code) && 
           isset($semester) && !empty($semester) && 
           isset($year) && !empty($year)) {








?>