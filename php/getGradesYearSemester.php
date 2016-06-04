<!DOCTYPE html>

<?php
   include("config.php");
   
   $year = $_GET['year'];
   $semester = $_GET['semester'];
   
   if( (isset($year) && $year != '') && (isset($semester) && $semester != '') ) {
     session_start();
     
   }       






















?>