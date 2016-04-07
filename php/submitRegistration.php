<?php
     include("config.php");
     
      if (isset($_POST['firstName']) &&
          isset($_POST['lastName']) &&
          isset($_POST['country']) &&
          isset($_POST['state']) &&
          isset($_POST['city']) &&
          isset($_POST['address']) &&
          isset($_POST['postalCode']) &&
          isset($_POST['phoneHome']) &&     
          isset($_POST['phoneMobile']) &&
          isset($_POST['major']) &&
          isset($_POST['email']) &&
          isset($_POST['password'])) {   
                        
         $sql = "INSERT INTO users(user_first_name, 
                                       user_last_name, 
                                       user_email, 
                                       user_country, 
                                       user_password,   
                                       user_state, 
                                       user_city, 
                                       user_major, 
                                       user_address, 
                                       user_home_phone, 
                                       user_mobile_phone, 
                                       user_postal_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                                        
                                         $stmt = $conn->prepare($sql); 
                                         $stmt->bind_param('sssssssssssi', $conn->real_escape_string($_POST['firstName']), 
                                                                           $conn->real_escape_string($_POST['lastName']), 
                                                                           $conn->real_escape_string($_POST['email']), 
                                                                           $conn->real_escape_string($_POST['country']), 
                                                                           password_hash($_POST['password'], PASSWORD_BCRYPT, array('cost' => 11)), 
                                                                           $conn->real_escape_string($_POST['state']), 
                                                                           $conn->real_escape_string($_POST['city']), 
                                                                           $conn->real_escape_string($_POST['major']), 
                                                                           $conn->real_escape_string($_POST['address']), 
                                                                           $conn->real_escape_string($_POST['phoneHome']), 
                                                                           $conn->real_escape_string($_POST['phoneMobile']), 
                                                                           intval($conn->real_escape_string($_POST['postalCode'])));
                                          if(!$stmt->execute()) {
                                             trigger_error("Error Executing Insert: ", E_USER_ERROR);
                                          }
                                          
                                          $statement->close();
                                          $conn->close();
    }
?>