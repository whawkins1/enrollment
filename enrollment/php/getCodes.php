<?php
   include("config.php");
    $result = mysqli_query($conn, "SELECT DISTINCT code FROM courses");
    
    if($result) {
        echo "<option>-- Select Code --</option>";
         while($row = mysqli_fetch_array($result)) { 
           echo '<option value="'.$row['code'].'">' .$row['code']. "</option>";
         }   
    }   
    mysqli_free_result($result);
    mysqli_close($conn);
?>   