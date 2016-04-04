<?php
     require_once("config.php");
     
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
             //Hash Password
             $salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
             //Prefix Information To Verify Later; $2a$ Blowfish Algorithm
             $cost = 10;
             $salt = sprintf("$2a$%02d$", $cost) . $salt;
             $hash = crypt($password, $salt);
         } else {
             alert("Blowfish not Defined");
             $hashOK = false;
         }
         
         if ($performSubmit) {
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
                                        
                                         $statement = $conn->prepare($sql); 
                                         $statement->bind_param('sssssssssssi', $firstName, 
                                                                                   $lastName, 
                                                                                   $email, 
                                                                                   $hash, 
                                                                                   $country, 
                                                                                   $state, 
                                                                                   $city, 
                                                                                   $major, 
                                                                                   $address, 
                                                                                   $phoneHome, 
                                                                                   $phoneMobile, 
                                                                                   $postalCode);
                                          if(!$statement->execute()) {
                                             die('Error:('.$conn->errno .')'.$conn->error);
                                          }
                                          $statement->close();
             }
       }
?>