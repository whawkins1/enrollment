<?php
     include("config.php");
     
        if (isset($_POST[('firstname')],
         $_POST[('lastName')],
         $_POST[('country')],
         $_POST[('state')],
         $_POST[('city')],
         $_POST[('address')],
         $_POST[('postalCode')],
         $_POST[('phoneHome')],     
         $_POST[('phoneMobile')],
         $_POST[('major')],
         $_POST[('email')],
         $_POST[('password')])) {   
         
         $hashOK = true;
         
         if (defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
             $options = array('cost' => 11);
             var passwordHash = password_hash($_POST[('password')], PASSWORD_BCRYPT, $options);
         } else {
             alert("Blowfish not Defined");
             $hashOK = false;
         }
         
         if ($hashOK) {
             $firstName = $_POST[('firstName')];
             $lastName = $_POST[('lastName')];
             $country = $_POST[('country')];
             $state = $_POST[('state')];
             $city = $_POST[('city')];
             $address = $_POST[('address')];
             $postalCode = intval($_POST[('postalCode')]);
             $phoneHome = $_POST[('phoneHome')];     
             $phoneMobile = $_POST[('phoneMobile')];
             $major = $_POST[('major')];
             $email = $_POST[('email')];
             $password = $_POST[('password')];
             
                       
             $sql = "INSERT INTO users (first, 
                                        last, 
                                        email, 
                                        password,   
                                        country, 
                                        state, 
                                        city, 
                                        major, 
                                        address, 
                                        home_phone, 
                                        mobile_phone, 
                                        postal_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                                        
                                         $stmt = mysqli_prepare($conn, $sql);
                                         
                                         if ($stmt === false) {
                                            trigger_error("Statement Failed" . htmlspecialchars(mysqli_error($conn)), E_USER_ERROR);
                                         }
                                         
                                         $bind = mysqli_stmt_bind_param($stmt, 'sssssssssssi', $firstName, 
                                                                                                    $lastName, 
                                                                                                    $email, 
                                                                                                    $passwordHash, 
                                                                                                    $country, 
                                                                                                    $state, 
                                                                                                    $city, 
                                                                                                    $major, 
                                                                                                    $address, 
                                                                                                    $phoneHome, 
                                                                                                    $phoneMobile, 
                                                                                                    $postalCode);
          
                                          if ($bind === false) {
                                              trigger_error("bind param failed!", E_USER_ERROR);
                                          }
                                          
                                          $exec = mysqli_stmt_execute($stmt);
                                          
                                          if ($exec === false) {
                                             trigger_error("Statement execute failed!" . htmlspecialchars(mysqli_stmt_error($stmt)), E_USER_ERROR);
                                          }
                                          
                                          mysqli_stmt_close($stmt);
                                          mysqli_close($conn);
             }
       }
?>