<!DOCTYPE html>

<?php
    include("config.php");
    
    $username = $_GET['username'];
    if ( isset($username) && $username != '' ) {
      session_start();
      $_SESSION['username'] = $username;
      
      $sql = "SELECT user_first_name, 
                     user_last_name, 
                     user_country, 
                     user_state, 
                     user_city, 
                     user_major, 
                     user_address, 
                     user_home_phone, 
                     user_mobile_phone, 
                     user_postal_code, 
                     user_balance
              FROM   users
              WHERE  user_email = ?";
              
       $stmt = $conn->prepare($sql);
       $stmt->bind_param('s', $username);
       
       if ($stmt->execute()) {
           $stmt->bind_result($firstName, 
                              $lastName, 
                              $country, 
                              $state, 
                              $city, 
                              $major, 
                              $address, 
                              $homePhone, 
                              $mobilePhone, 
                              $postalCode, 
                              $balance);
           $stmt->fetch();
       }           
    }
?>

<html lang="en">
  <head>
    <title>Enrollment Center</title>
    <link rel="stylesheet" href="../css/accountstyles.css"/>
    <meta charset="UTF-8">
  </head>
    <body>
      <div id="loggedincontainer">
           <label id="loggedinlabel"> Logged in as <span id="fontusername"><?php echo $username ?></span></label>
      </div>
      
      <?php include("../php/navigation.php")?>;         
        
      <ul class="tabs">
         <li><a href="#tab-personal">Personal</a></li>
         <li><a href="#tab-courses">Courses</a></li>
         <li><a href="#tab-grades">Grades</a></li>
         <li><a href="#tab-financial">Financial</a></li>
         <li><a href="#tab-payment">Make Payment</a></li>
      </ul>
      
      <div id="tab-personal" class="tabsjump">
             <div id="contactcontainer">            
             <form>
                <fieldset id="contactfieldset">
                   <legend>Contact</legend>
                    <label class="contactlabel">First Name* :</label><input type="text" id="firstname" class="contactinput" value="<?php echo $firstName?>" readonly >
                    <label class="contactlabel">Last Name* :</label><input type="text" id="lastname" class="contactinput" value="<?php echo $lastName?>" readonly >
                    <label class="contactlabel">Street Address* :</label><input type="text" id="streetaddress" class="contactinput" value="<?php echo $address?>" readonly>
                    <label class="contactlabel">City* :</label><input type="text" id="city" class="contactinput" value="<?php echo $city?>" readonly>
                    <label class="contactlabel">State* :</label><input type="text" id="state" class="contactinput" value="<?php echo $state?>" readonly>
                    <label class="contactlabel">Zip Code* :</label><input type="text" id="zipcode" class="contactinput" value="<?php echo $postalCode?>" readonly>
                    <label class="contactlabel">Home Phone* :</label><input type="text" id="homephone" class="contactinput" value="<?php echo $homePhone?>" readonly>
                    <label class="contactlabel">Mobile Phone* :</label><input type="text" id="mobilephone" class="contactinput" value="<?php echo $mobilePhone?>" readonly>
                    <label class="contactlabel">Email* :</label><input type="text" id="email", class="contactinput" value="<?php echo $username?>"readonly>
                </fieldset>
              </form>  
                
                <div id="editbuttoncontainer">
                    <button type="button" id="editbutton">Edit</button>
                </div>
             </div>
      </div>
      
       <div id="tab-courses" class="tabsjump">
              <label id="filterlabel" class="filters"> Filter By: </label> 
              <div id="filterdepartment" class="filters">
                        <select id="departmentfilter"> 
                            <option>-- Select Department --</option>
                            <option>Business</option>
                            <option>Computer Science</option>
                            <option>English</option>
                            <option>Math</option>
                        </select>                        
              </div>
                  
                  <div id="filtercodes" class="filters">
                        <select id="codefilter"> 
                            <option>-- Select Code --</option>
                            <option>ENG101</option>
                            <option>MATH101</option>
                        </select>
                  </div>

                 <div id="filterprofessor" class="filters">
                        <select id="professorfilter"> 
                            <option>-- Select Professor </option>
                            <option>Bettis, Jerome</option>
                            <option>Hawkins, Jenny</option>
                            <option>Laporte, Leo</option>
                            <option>Smith, Mike</option>
                            <option>Zeise, Paul</option>
                        </select>
                  </div>
                  
                  <div id="filterlocation" class="filters">
                        <select id="locationfilter"> 
                            <option>-- Select Location --</option>
                            <option>Colebank Hall</option>
                            <option>Falcon Center</option>
                            <option>Feaster Center</option>
                            <option>Hardway Hall</option>
                            <option>Technology Park</option>
                        </select>                        
                  </div>
              
              <table id="tablecourses" class="tablesorter">      
              <thead>
                    <tr id="headerRow">
                         <th class="checkbox"><input type="checkbox" id="checkboxhead"/></th>
                         <th class="code">Code</th>
                         <th class="name">Name</th>
                         <th class="department">Department</th>
                         <th class="professor">Professor</th>
                         <th class="time">Time</th>
                         <th class="location">Location</th>
                         <th class="credits">Credits</th>
                    </tr>
               </thead>     
                 <tbody>
                 </tbody>                  
             </table>
      </div>                
      
      <div id="tab-grades" class="tabsjump">
      </div>          

      <div id="tab-financial" class="tabsjump">
          <div id="containerfinancial">      
             <fieldset id="financialfieldSet">
               <label id="paymentslabel">History</label>

               <legend>Financial</legend>
            
                <label for="selecttype" id="filterbylabel">Filter By:                    
                       <select id="selecttype">
                          <option>All</option>
                          <option>Payment</option>
                          <option>Charge</option>
                       </select> 
                       </label>
               <table id="tablesummary">
                 <thead>
                    <tr>
                       <th colspan="2">Summary</th>
                    </tr>
                 </thead>
                 <tbody>
                    <tr>
                        <td>Tuition</td>
                        <td>0.00</td>
                    </tr>
                    <tr>           
                         <td>Fines</td>
                        <td>0.00</td>
                    </tr> 
                    <tr class="separatorlinetotal">            
                         <td>Total</td>
                        <td>0.00</td>
                    </tr>
                 </tbody>
             </table>
             
             <table id="tablepayments" class="tablesorter">
                         <thead>
                            <tr id="headerRow">
                               <th>Code</th>
                               <th>Date</th>
                               <th>Type</th>
                               <th>Amount</th>
                            </tr>
                         </thead>
                         <tbody>
                            <tr>
                                <td>TRANS1</td>
                                <td>9/10/12</td>
                                <td>Payment</td>
                                <td>100.45</td>
                                <td>
                                   <a href="#">
                                     <div style="height:100%;width:100%">
                                         details
                                     </div>
                                   </a>
                                </td>  
                            </tr>
                            <tr>
                                <td>TRANS2</td>
                                <td>4/1/11</td>
                                <td>Charge</td>
                                <td>8.65</td>
                            </tr>
                            <tr>
                                <td>TRANS3</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS4</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS5</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS6</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS7</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS8</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS9</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS10</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                            <tr>
                                <td>TRANS11</td>
                                <td>8/24/08</td>
                                <td>Payment</td>
                                <td>100.45</td>
                            </tr>
                         </tbody>
                       </table>
          </fieldset>
            <div id="makepaymentbuttoncontainer">
                    <button type="button" id="makepaymentbutton">Make Payment</button>
                </div>
          </div>
          
          </div>
      </div>      
      
      <div id="tab-payment" class="tabsjump">
           <div class="paymentsteps">
                 <div id="steponecontainer" class="container">
                      <div class="headingcontainer">
                          <label class="heading">Step One:</label>
                      </div>
                      
                      <div class="instructioncontainer">
                          <label class="instructions">Choose Payment Type and Company</label>
                      </div>                      
                      
                       <div id="paymenttypecontainer">  
                          <label class="input">Type:
                               <select id="selectpaymenttype" class="dropdown">
                                     <option value="" style="display:none;"></option>
                                     <option value="cc">Credit Card</option>
                                     <option value="op">Online Payment</option>
                               </select>
                          </label>
                       </div>                   
                
                <div id="companycontainer">
                       <label class="input">Company:        
                           <select id="companydropdown" class="dropdown"> </select>
                       </label>
                </div>
              </div>  
        </div>
        
        <div class="paymentsteps">
           <div id="steptwocontainer" class="container">
                <div class="headingcontainer">
                    <label class="heading">Step Two:</label>
                </div>
                
                <div class="instructionscontainer">
                    <label id="steptwoinstructions" class="instructions">Complete Step One First</label>
                </div>
                
                <div id="creditvincontainer" class="hidden">
                    <div id="creditinputcontainer">
                        <label class="input">Credit Card #:
                             <input type="text" id="creditcard" maxlength="19" class="inputtext"/>
                        </label>
                    </div>
                    
                    <div id="vincontainer">
                        <label class="input">VIN #:
                             <input type="text" id="vin" maxlength="4" class="inputtext"/>
                        </label>
                    </div>
                </div>
                
                <div id="onlineinputcontainer" class="hidden">
                    <div id="usernamecontainer">
                        <label class="input">Username:
                             <input type="text" id="username" class="inputtext">
                        </label>
                    </div>
                    
                    <div id="passcontainer">
                        <label class="input">Password:
                             <input type="password" id="password" class="inputtext">
                        </label>
                    </div>
                    <div id="showpasswordcontainer">
                        <input type="checkbox" id="showpasscb">Show Password</br>
                    </div>
                </div>
            </div>            
        </div>
        
        <div class="paymentsteps">
             <div id="stepthreecontainer" class="container">
                <div class="headingcontainer"/>
                    <label class="heading">Step Three:</label>
                </div>
                
                <div id="instructionscontainer">
                    <label class="instructions">Enter Payment<label>
                </div>
                
                <div id="makepaymentcontainer">
                    <div id="inputpaymentcontainer">
                        <label class="input">Amount:
                          <input type="text" id="amount" class="inputtext" disabled>
                        </label>
                    </div>                
                    <div id="finishbuttoncontainer">
                       <input type="button" id="finishbutton" value="Finish" disabled/> 
                    </div>
                </div>
             </div>
        </div>
        
        <div id="reviewpaymentcontainer">
             <div class="paymentcontainers">
                <label id="datelabel"></label>
             </div>
             
             </div class="paymentcontainers">
                 <label id="transactionid">Transaction ID: </label>
             </div>
             
             <div class="paymentcontainers">
                 <label id="paymenttype">Payment Type: </label>
             </div>
             
             <div class="paymentcontainers">
                 <label id="currentbalance">Current Balance</label>
                 <label id="payment">Payment</label>
                 <label>_________<label>
                 <label id="balance">Balance</label>                 
             </div>
             
             <div id="submitbuttoncontainer">
                 <input type="button" id="submitbutton">
             </div>
         </div>
      </div>
     
      <script src="../plugins/jquery-1.12.0.js"></script>
      <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
      <script src="../plugins/autonumeric/autoNumeric.js"></script>
      <script src="../javascript/account.js"></script>
    </body>
</html>