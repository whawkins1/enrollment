<?php 
   include ("config.php");
   
   $postNames = array('firstName', 'lastName', 'country', 'state', 
                      'city', 'address', 'postalCode', 'homePhone', 
                      'mobilePhone', 'major', 'email', 'originalEmail');
     $allPostSet = true;
     $checkVariables = "";
     
     foreach ($postNames as $value) {
         if (!isset($_POST[$value])) {
             $checkVariables = $value;
             $allPostSet = false;
             break;
         }
     }
     
     if ($allPostSet) {
        $sql = "UPDATE users SET user_first_name = ?, 
                                      user_last_name = ?, 
                                      user_email = ?, 
                                      user_country = ?, 
                                      user_state = ?, 
                                      user_city = ?, 
                                      user_major = ?, 
                                      user_address = ?, 
                                      user_home_phone = ?, 
                                      user_mobile_phone = ?, 
                                      user_postal_code = ?
                                      WHERE user_email = ?";
                                       
                 if ( $stmt = $conn->prepare($sql) ) {
                     $stmt->bind_param('ssssssssssis', $_POST['firstName'], 
                                                      $_POST['lastName'], 
                                                      $_POST['email'], 
                                                      $_POST['country'], 
                                                      $_POST['state'], 
                                                      $_POST['city'], 
                                                      $_POST['major'], 
                                                      $_POST['address'], 
                                                      $_POST['homePhone'], 
                                                      $_POST['mobilePhone'], 
                                                      $_POST['postalCode'],
                                                      $_POST['originalEmail']);
                                  if($stmt->execute() ) {
                                      echo "success";                                     
                                  } else {
                                    trigger_error("Error Executing Update: ", E_USER_ERROR);
                                     echo "ERROR: failed to properly execute statement!";
                                  }
                 } else {
                    echo "ERROR: invalid sql format!";
                 }                     
     } else {
        echo "error all variables must be set!";
     }
?>  