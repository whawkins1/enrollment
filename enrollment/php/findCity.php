<?php 
    include("config.php");
    $state_id = intval($_POST['state_id']);
    $result = mysqli_query($conn, "SELECT * FROM cities WHERE state_id = '$state_id'");
    
    if($result) {
       if($result->num_rows > 0) {    
         while($row = mysqli_fetch_assoc($result)) { ?>
            <option value = "<?php echo $row['state_id']?>"><?php echo $row['city_name']?></option>
        <?php }
        } else { ?>
          <option>None Available</option> 
        <?php }
    } else { ?>
       <option>Error Retrieving</option>
    <?php } 
    mysqli_free_result($result);
    mysqli_close($conn);    
    ?>