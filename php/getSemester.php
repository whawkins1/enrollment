<?php

function get_semester() {
         $current_date = new DateTime(null, new DateTimeZone("UTC"));
          $current_date->setTimeZone(new DateTimeZone("America/New_York"));
          $current_year = $current_date->format("Y");      
          $today_timestamp_semester = $current_date->getTimestamp();
      
           $fall_start_date = new DateTime($current_year . "-09-01");
           $fall_end_date = new DateTime($current_year . "-01-14");      
          
           if ($fall_start_date->getTimestamp() < $today_timestamp_semester &&
               $fall_end_date->getTimestamp() > $today_timestamp_semester  ) {
               return "spring";               
           }          
           
           $spring_start_date = new DateTime($current_year . "-01-15");
           $spring_end_date = new DateTime($current_year . "-05-15");
           
           if ($spring_start_date->getTimestamp() < $today_timestamp_semester &&
               $spring_end_date->getTimestamp() > $today_timestamp_semester) {
               return "summer";
           } 
       
            $summer_start_date = new DateTime($current_year . "-06-01");
            $summer_end_date = new DateTime($current_year . "-08-30");
            
            if ($summer_start_date->getTimestamp() < $today_timestamp_semester &&
                $summer_end_date->getTimestamp() < $today_timestamp_ ) { 
                return 'fall'; 
            }     
  }
?>