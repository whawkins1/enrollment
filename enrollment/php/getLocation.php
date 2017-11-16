<?php 
    include("config.php");

    $result = mysqli_query($conn, "SELECT * FROM locations");
    
    if($result) {
         echo "<option>-- Select Location --</option>";
         while($row = mysqli_fetch_array($result)) { 
           echo '<option value="'.$row['location'].'">' .$row['location']. "</option>";
         }   
    }
    mysqli_free_result($result);
    mysqli_close($conn);
 ?>