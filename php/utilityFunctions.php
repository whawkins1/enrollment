
<?php
     function getCurrentDateObject() {
          $current_date = new DateTime(null, new DateTimeZone("UTC"));
          $current_date->setTimeZone(new DateTimeZone("America/New_York"));
          return $current_date;
     }
     
     function getSemesterOpenEnrollment() {
                          $semester = ""; 
                          $current_date = getCurrentDateObject(null);
                          $current_year = $current_date->format("Y");
                          
                          $today_timestamp = $current_date->getTimeStamp();
                          
                          $fall_start_date_year_prepended = $current_year . "-09-01";                          
                          $fall_start_object = getCurrentDateObject($fall_start_date_year_prepended);
                          
                          $fall_end_date_year_prepended = ($current_year + 1) . "-01-14";
                          $fall_end_object = getCurrentDateObject($fall_end_date_year_prepended);      
                          
                          $selected_fall = ( ($fall_start_object->getTimeStamp() <= $today_timestamp) && ($fall_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : "";
                          
                          if (!empty($selected_fall)) { $semester = "Fall"; }
                                  
                          $spring_start_date_year_prepended = $current_year . "-01-15";
                          $spring_start_object = getCurrentDateObject($spring_start_date_year_prepended);
                             
                          $spring_end_date_year_prepended = $current_year . "-05-15";
                          $spring_end_object = getCurrentDateObject($spring_end_date_year_prepended);
                             
                          $selected_spring = ( ($spring_start_object->getTimeStamp() <= $today_timestamp) && ($spring_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : ""; 
                          
                          if (!empty($selected_spring)) { $semester = "Spring"; }
                       
                          $summer_start_date_year_prepended = $current_year . "-06-01"; 
                          $summer_start_object = getCurrentDateObject($summer_start_date_year_prepended);
                             
                          $summer_end_date_year_prepended = $current_year . "-08-30";
                          $summer_end_object = getCurrentDateObject($summer_end_date_year_prepended);
                             
                          $selected_summer = ( ($summer_start_object->getTimeStamp() <= $today_timestamp) && ($summer_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : ""; 
                          
                          if (!empty($selected_summer)) { $semester = "Summer"; } 
                             
                          return $semester;
     }
?>