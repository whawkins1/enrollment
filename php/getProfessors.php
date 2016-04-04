<?php 
 include("config.php");
 $result = mysqli_query($conn, "SELECT * FROM professors");
    
    if($result) {
           echo "<option>-- Select Professors --</option>";
         while($row = mysqli_fetch_array($result)) { 
           $name = $row['last_name'].", ".$row['first_name'];
           echo '<option value="'.$name.'".>' .$name. "</option>";
         }            
    }
    mysqli_free_result($result);
    mysqli_close($conn);
?>    