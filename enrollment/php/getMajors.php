<?php 
      require_once("config.php");
      $result = mysqli_query($conn, "SELECT * FROM majors ORDER BY major");
      while ($row=mysqli_fetch_assoc($result))
      { ?>
            <option><?php echo $row['major'];?></option>
            <?php
      }
?>