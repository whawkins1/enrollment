<?php 
   include ("config.php");
   
   $postNames = array('firstName', 'lastName', 'country', 'state', 
                      'city', 'address', 'postalCode', 'homePhone', 
                      'mobilePhone', 'major', 'email', 'originalEmail');
     $allPostSet = true;
     
     foreach ($postNames as $value) {
         if (!isset($_POST[$value])) {
             $allPostSet = false;
             break;
         }
     }
     
     if ($allPostSet) {
        $sql = "UPDATE users SET user_first_name = ? 
                              user_last_name = ?, 
                              user_email = ?, 
                              user_country = ?, 
                              user_state = ?, 
                              user_city = ?, 
                              user_major = ?, 
                              user_address = ?, 
                              user_home_phone = ?, 
                              user_mobile_phone = ?, 
                              user_postal_code WHERE originalEmail = ?;
                                       
                 if ( $stmt = $conn->prepare($sql) ) {
                     $stmt->bind_param('ssssssssssi', $conn->real_escape_string($_POST['firstName']), 
                                                      $conn->real_escape_string($_POST['lastName']), 
                                                      $conn->real_escape_string($_POST['email']), 
                                                      $conn->real_escape_string($_POST['country']), 
                                                      $conn->real_escape_string($_POST['state']), 
                                                      $conn->real_escape_string($_POST['city']), 
                                                      $conn->real_escape_string($_POST['major']), 
                                                      $conn->real_escape_string($_POST['address']), 
                                                      $conn->real_escape_string($_POST['phoneHome']), 
                                                      $conn->real_escape_string($_POST['phoneMobile']), 
                                                      intval($conn->real_escape_string($_POST['postalCode'])));
                                  if( !$stmt->execute() ) {
                                     trigger_error("Error Executing Insert: ", E_USER_ERROR);
                                     echo "error 1";
                                  } else {
                                    echo "success";
                                  }
                 } else {
                    echo "error 2";
                 }                     
     } else {
        echo "error all variables must be set!";
     }
?>
     