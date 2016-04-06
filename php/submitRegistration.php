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
         
         if (defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
             $options = array('cost' => 11);
             var passwordHash = password_hash($_POST[('password')], PASSWORD_BCRYPT, $options);
             $hashOK = true;
         } else {
             alert("Blowfish not Defined");
             $hashOK = false;
         }
         
         if ($hashOK) {
             $firstName = $conn->real_escape_string($_POST[('firstName')]);
             $lastName = $conn->real_escape_string($_POST[('lastName')]);
             $country = $conn->real_escape_string($_POST[('country')]);
             $state = $conn->real_escape_string($_POST[('state')]);
             $city = $conn->real_escape_string($_POST[('city')]);
             $address = $conn->real_escape_string($_POST[('address')]);
             $postalCode = intval($conn->real_escape_string($_POST[('postalCode')]));
             $phoneHome = $conn->real_escape_string($_POST[('phoneHome')]);     
             $phoneMobile = $conn->real_escape_string($_POST[('phoneMobile')]);
             $major = $conn->real_escape_string($_POST[('major')]);
             $email = $conn->real_escape_string($_POST[('email')]);
                        
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
                                        
                                         $stmt = $conn->prepare($sql); 
                                         $stmt->bind_param('ssssssssssssi', $firstName, 
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
                                          $stmt->execute();
                                          $statement->close();
                                          $conn->close();
             }
       }
?>