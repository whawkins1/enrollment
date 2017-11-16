<?php
   include("config.php");
    $result = mysqli_query($conn, "SELECT * FROM departments");
    
    if($result) {
        echo "<option>-- Select Department --</option>";
         while($row = mysqli_fetch_array($result)) { 
           echo '<option value="'.$row['department'].'">' .$row['department']. "</option>";
         }   
    }   
    mysqli_free_result($result);
    mysqli_close($conn);
?>   