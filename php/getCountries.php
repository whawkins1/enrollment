<?php 
      include ("config.php");
      $result = mysqli_query($conn, "SELECT * FROM countries");
      if($result) {
          while ($row=mysqli_fetch_assoc($result))
          { ?>
                <option value="<?php echo $row['country_id'];?>"><?php echo $row['country_name'];?></option>
                <?php
          }
      }
      mysqli_free_result($result);
      mysqli_close($conn);
?>