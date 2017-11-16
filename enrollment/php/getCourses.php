<?php
   include ("config.php");
    $result = mysqli_query($conn, "SELECT * FROM courses");
    
    if($result) {
             while($row = mysqli_fetch_array($result)) { 
        ?>     
        <tr>
            <?php
               $includeCheckbox = filter_var ($_POST['includeCheckbox'], FILTER_VALIDATE_BOOLEAN);
               if($includeCheckbox) {
            ?>
                 <td><input type="checkbox" class="checkbox id="checkboxrow"/></th>
            <?php 
               }
            ?>
            <td><?php echo $row['code']; ?></td>
            <td><?php echo $row['title']; ?></td>
            <td><?php echo $row['department']; ?></td>
            <td><?php echo $row['professor_last_name'] . ", " .$row['professor_first_name']; ?></td>
            <td><?php echo $row['begin_time'] . "-" . $row['end_time'] . $row['am_pm'] . " " . $row['days']; ?></td>
            <td><?php echo $row['location']; ?></td>
            <td><?php echo $row['credits']; ?></td>
        </tr>
        
        <?php
        }  // end while
        ?>
     
    <?php
    } // end result check
    ?>
    <?php
        mysqli_free_result($result);
        mysqli_close($conn);
    ?>    