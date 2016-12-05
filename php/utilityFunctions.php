
<?php
     function getCurrentDateObject() {
          $current_date = new DateTime(null, new DateTimeZone("UTC"));
          $current_date->setTimeZone(new DateTimeZone("America/New_York"));
          return $current_date;
     }
?>