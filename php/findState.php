<?php 
    include('config.php');
    $country_id = intval($_POST['country_id']);
    $result = mysqli_query($conn, "SELECT * FROM states WHERE country_id = '$country_id'");
   
   if($result) {
       if($result->num_rows > 0) {
     while ($row = mysqli_fetch_assoc($result)) { ?>
         <option value="<?php echo $row['state_id']?>"><?php echo $row['state_name']?></option>
    <?php } 
       } else { ?>
           <option>none</option>
    <?php }
   } else { ?>
        <option>error</option>
   <?php } 
   mysqli_free_result($result);
   mysqli_close($conn);   
   ?>       
          