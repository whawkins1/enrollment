<!DOCTYPE html>

<?php
    require_once("config.php");
    
    $username = $_GET['username'];
    if ( isset($username) && (!empty($username))) {
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
           $stmt->close();
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
      
      <?php include("../php/navigation.php");?>         
        
      <ul class="tabs">
         <li><a href="#tab-personal">Personal</a></li>
         <li><a href="#tab-courses">Current Courses</a></li>
         <li><a href="#tab-grades">Grades</a></li>
         <li><a href="#tab-financial">Financial</a></li>
         <li><a href="#tab-payment">Make Payment</a></li>
      </ul>
      
      <div id="tab-personal" class="tabsjump">             
             <div id="contactcontainer" >          
                             
             <form id="contactform" >
                <fieldset id="contactfieldset">
                   <legend>Contact</legend>
                    <div id="errorcontainer" class="error"></div>
                    <label class="contactlabel">First Name* :</label><input type="text" id="firstname" class="contactinput" value="<?php echo $firstName?>" readonly>
                    <label class="contactlabel">Last Name* :</label><input type="text" id="lastname" class="contactinput" value="<?php echo $lastName?>" readonly>
                    <label class="contactlabel">Street Address* :</label><input type="text" id="streetaddress" value="<?php echo $address?>" readonly>
                     <label class="contactlabel">Country* :</label> <select id="countrydropdown" class="contactinput">
                        <?php
                            $result = $conn->query("SELECT * FROM countries");
                               if ($result) {
                                  while ($row = $result->fetch_assoc()) { 
                                        $selected = ($country == $row["country_name"]) ? " selected" : "";
                                        echo "<option value=", $row["country_id"], $selected,  ">", $row["country_name"], "</option>";
                                  }
                               }
                        ?>
                     </select>
                    
                     <label class="contactlabel">State* :</label> <select id="statedropdown" class="contactinput">
                        <?php 
                          $stmt = $conn->prepare("SELECT country_id FROM countries WHERE country_name = ?");
                          $stmt->bind_param('s', $country);
                          
                          if ($stmt->execute()) {
                             $stmt->bind_result($countryID);
                             $stmt->fetch();
                          }
                          $stmt->close();
                        
                          $stmt = $conn->prepare("SELECT state_id, state_name FROM states WHERE country_id = ?");
                          $stmt->bind_param('i', $countryID);
                          
                          if($stmt->execute()) {
                              $stmt->bind_result($stateID, $stateName);

                              while ($stmt->fetch())   { 
                                    $selected = ($state == $stateName) ? " selected" : "";
                                    echo "<option value=", $stateID,  $selected,  ">",  $stateName,  "</option>";
                              }
                          } 
                          $stmt->close(); 
                          ?>
                     </select>
                    
                     <label class="contactlabel">City* :</label> <select id="citydropdown" class="contactinput">
                        <?php 
                            $stmt = $conn->prepare("SELECT city_name, city_id FROM cities WHERE state_id = ?");
                            $stmt->bind_param('i', $stateID);
                            
                            if ($stmt->execute()) {
                               $stmt->bind_result($cityName, $cityID);
                               
                               while ($stmt->fetch()) {
                                  $selected = ($city == $cityName) ? " selected" : "";
                                  echo "<option value=", $cityID, $selected, ">", $cityName, "</option>";
                               }
                            }
                            $stmt->close();
                          ?>
                     </select>
                    
                    <label class="contactlabel">Zip Code* :</label><input type="text" id="zipcode" value="<?php echo $postalCode?>" readonly>
                    <label class="contactlabel">Home Phone* :</label><input type="text" id="homephone" class="contactinput" value="<?php echo $homePhone?>" readonly>
                    <label class="contactlabel">Mobile Phone* :</label><input type="text" id="mobilephone" class="contactinput" value="<?php echo $mobilePhone?>" readonly>
                    <label class="contactlabel">Major* : </label> <select id="majordropdown" class="contactinput">
                        <?php 
                          $result = $conn->query("SELECT DISTINCT user_major FROM users");
                          if($result) {
                              while ($row = $result->fetch_assoc())   { 
                                    $selected = ($major == $row['user_major']) ? " selected" : "";
                                    echo "<option value=", $row["user_major"], $selected, ">", $row["user_major"], "</option>";
                              }
                          } 
                          ?>
                    </select> 
                     
                    <label class="contactlabel">Email* :</label><input type="text" id="email" class="contactinput" value="<?php echo $username?>" readonly>
                    
                    <div id="editbuttoncontainer">
                        <button type="button" id="editbutton">Edit</button>
                        <button type="button" id="resetdefaultbutton" disabled>Reset Default</button>
                    </div>
                </fieldset>
              </form>                       
             </div>                
             
             <div id="passwordcontainer">             
                <form id="passwordform">
                     <fieldset id="passwordfieldset">
                        <legend>Change Password</legend>
                           <div id="passwordmessage" class="error"></div> 
                           <label class="contactlabel">Old* :</label><input type="password" id="oldpassword"  disabled>
                           <label class="contactlabel">New* :</label><input type="password" id="newpassword"  disabled>
                           <label class="contactlabel">Confirm* :</label><input type="password" id="confirmpassword" disabled>
                           
                           <div id="passwordbuttoncontainer">
                                <button type="button" id="changepasswordbutton">Change Password</button>
                           </div>
                     </fieldset>
                </form>
                <div id="allfieldsrequirednotation">* indicates required field</div>                    
           </div>
             
      </div>
      
       <div id="tab-courses" class="tabsjump">
              <label id="filterlabel" class="filters"> Filter By: </label> 
              <div id="filterdepartment" class="filters">
                        <select id="departmentfilter"> 
                            <option>-- Select Department --</option>
                            <?php $result = $conn->query("SELECT DISTINCT department FROM courses");
                                  if($result) {
                                     while($row = $result->fetch_assoc()) { ?>
                                         <option value=<?php echo $row['department']; ?>><?php echo $row['department']; ?></option>
                               <?php }
                                  } ?>
                        </select>                        
              </div>
                  
                  <div id="filtercodes" class="filters">
                        <select id="codefilter"> 
                            <option>-- Select Code --</option>
                            <?php $result = $conn->query("SELECT DISTINCT code FROM courses;");
                                  if($result) {
                                     while ($row = $result->fetch_assoc()) { ?>
                                       <option value=<?php echo $row['code']; ?>><?php echo $row['code']; ?></option>
                            <?php    } 
                                 } ?>
                        </select>
                  </div>

                 <div id="filterprofessor" class="filters">
                        <select id="professorfilter"> 
                            <option>-- Select Professor -- </option>
                            <?php $result = $conn->query("SELECT DISTINCT concat(professor_last_name, ', ', professor_first_name) AS professor FROM courses;");
                                     if ($result) {
                                        while($row = $result->fetch_assoc()) { ?>
                                         <option value=<?php echo $row['professor'] ?>><?php echo $row['professor'] ?></option>
                            <?php       }  
                                     } ?>
                        </select>
                  </div>
                  
                  <div id="filterlocation" class="filters">
                        <select id="locationfilter"> 
                            <option>-- Select Location --</option>
                            <?php $result = $conn->query("SELECT DISTINCT location FROM courses;");
                                  if ($result) {
                                      while($row = $result->fetch_assoc()) { ?>
                                        <option value=<?php echo $row['location'];?>><?php echo $row['location'];?></option>
                             <?php    } 
                                  }  ?>                         
                        </select>                        
                  </div>
              
              <table id="tablecourses" class="tablesorter">      
                  <thead>
                        <tr id="headerRow">
                             <th class="checkbox"><input type="checkbox" id="checkboxhead"></th>
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
                 <?php
                    $sql = "SELECT getYearsAttended(?)";           
                   if ($stmt = $conn->prepare($sql)) {
                       $stmt->bind_param('s', $username);
                       if($stmt->execute()) {
                          $stmt->bind_result($years_attended_commas);
                          $stmt->fetch();
                          $stmt->close();
                       }
                       $years_attended_arr = explode(",", $years_attended_commas);
                       //$most_recent_year_enrolled = max($years_attended_arr);
                       $most_recent_year_enrolled = 2010; // temporary
                       $semester = "Fall";
                   }
                   if(!empty($most_recent_year_enrolled)) {
                        $sql = "SELECT c.code, c.title, c.days, c.department, c.begin_time, c.end_time, 
                                    c.am_pm, c.credits, c.professor_last_name, c.professor_first_name, c.location, c.department 
                                   FROM courses AS c INNER JOIN " . "enrolled_" . $most_recent_year_enrolled . " AS e" .
                                   " ON c.code = e.user_course_code WHERE e.user_email_" . $most_recent_year_enrolled . " = ? " .
                                   " AND user_semester_" . $most_recent_year_enrolled . " = ?;";
                        
                        if($stmt = $conn->prepare($sql)) {
                            $semester = "Fall";
                            $stmt->bind_param('ss', $username, $semester);
                            if($stmt->execute()) {
                                 $stmt->bind_result($code, $title, $days, $department, $begin_time, 
                                                    $end_time, $am_pm, $credits, $professor_last_name, 
                                                    $professor_first_name, $location, $department );

                                 while($stmt->fetch()) {      
                                    echo "<tr>";
                                        echo "<td><input type='checkbox' class='checkbox' id='checkboxrow'></td>";
                                        echo "<td>", $code, "</td>";
                                        echo "<td>", $title, "</td>";
                                        echo "<td>", $department, "</td>";
                                        echo "<td>",  $professor_last_name,  ", ", $professor_first_name, "</td>";
                                        echo "<td>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
                                        echo "<td>", $location, "</td>";
                                        echo "<td>", $credits, "</td>";
                                    echo "</tr>";
                                  }  
                               $stmt->close();   
                            }            
                        } 
                   } ?>
                 </tbody>                  
             </table>
             
             <div class="creditscontainer">
                <label class="labelcreditstitle">Current Credit Total: </label> 
                <label id="labelcurrentcredittotal">21</label>
             </div>
             
             <div class="buttonscontainer">
                  <button type="button" id="buttonremovecourses" class="buttonscourses" disabled>Remove</button>
             </div>
             
             <div id="filterdepartmentcontainer">
                 <label id="labelfilterdepartmenttitle">Filter By: </label>       
                    <select id="departmentfilter"> 
                            <option>-- Select Department --</option>
                            <?php $result = $conn->query("SELECT DISTINCT department FROM courses");
                                  if($result) {
                                     while($row = $result->fetch_assoc()) { ?>
                                     <option value=<?php echo $row['department']; ?>><?php echo $row['department']; ?></option>
                            <?php    }
                                  } ?>
                    </select>        
             </div>
        
             <table id="tablecatalog" class="tablesorter">      
              <thead>
                    <tr id="headerRow">
                         <th></th>
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
                    <?php $result = $conn->query("SELECT * FROM courses");
                          if($result) {
                                while($row = $result->fetch_assoc()) {      
                                    echo "<tr>";
                                        echo "<td><input type='checkbox' class='checkbox' id='checkboxcatalog'></td>";
                                        echo "<td>", $row['code'], "</td>";
                                        echo "<td>", $row['title'], "</td>";
                                        echo "<td>", $row['department'], "</td>";
                                        echo "<td>", $row['professor_last_name'],  ", ", $row['professor_first_name'], "</td>";
                                        echo "<td>", $row['begin_time'], "-", $row['end_time'], $row['am_pm'],  " ",  $row['days'], "</td>";
                                        echo "<td>", $row['location'], "</td>";
                                        echo "<td>", $row['credits'], "</td>";
                                    echo "</tr>";
                                  }  
                            } ?>
                 </tbody>    
             </table>
             <div class="creditscontainer">
                 <label class="labelcreditstitle">Selected Credits: </label> 
                 <label id="labelselectedcredits">21</label>
             </div>
             <div class="buttonscontainer">
                      <button type="button" id="buttonaddcourses" class="buttonscourses" disabled>Add</button>
             </div>
      </div>                
      
      <div id="tab-grades" class="tabsjump">
         <div id="selectiongpacontainer">
              <label id="labelyear">Year:</label>      
              <?php
                   $sql = "SELECT getYearsAttended(?)";           
                   if ($stmt = $conn->prepare($sql)) {
                       $stmt->bind_param('s', $username);
                       if($stmt->execute()) {
                          $stmt->bind_result($years_attended_commas);
                          $stmt->fetch();
                          $stmt->close();
                       }
                       $years_attended_arr = explode(",", $years_attended_commas);
                       $most_recent_year_enrolled = max($years_attended_arr);
                   }
              ?>          
              <select id="yeardropdown">
                   <?php foreach($years_attended_arr AS $year) { ?>     
                               <option value = "<?php echo $year; ?>"><?php echo $year; ?></option>
                   <?php } ?>
              </select>
              <label id="semesterlabel">Semester:</label>
              <select id="semesterdropdown">
                   <?php  
                          function getTimeZoneObject($date) {
                             $date_zone = new DateTime($date, new DateTimeZone("UTC"));
                             $date_zone->setTimeZone(new DateTimeZone("America/New_York"));
                             return $date_zone;
                          }
                          
                          $semester = ""; 
                          $current_date = getTimeZoneObject(null);
                          $current_year = $current_date->format("Y");
                          
                          $today_timestamp = $current_date->getTimeStamp();
                          
                          $fall_start_date_year_prepended = $current_year . "-09-01";                          
                          $fall_start_object = getTimeZoneObject($fall_start_date_year_prepended);
                          
                          $fall_end_date_year_prepended = ($current_year + 1) . "-01-14";
                          $fall_end_object = getTimeZoneObject($fall_end_date_year_prepended);      
                          
                          $selected_fall = ( ($fall_start_object->getTimeStamp() <= $today_timestamp) && ($fall_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : "";
                          echo "<option value='Fall' selected>Fall</option>";
                          if (!empty($selected_fall)) { $semester = "Fall"; }
                                  
                         $spring_start_date_year_prepended = $current_year . "-01-15";
                         $spring_start_object = getTimeZoneObject($spring_start_date_year_prepended);
                         
                         $spring_end_date_year_prepended = $current_year . "-05-15";
                         $spring_end_object = getTimeZoneObject($spring_end_date_year_prepended);
                         
                         $selected_spring = ( ($spring_start_object->getTimeStamp() <= $today_timestamp) && ($spring_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : ""; 
                         echo "<option value='Spring'>Spring</option>";
                         if (!empty($selected_spring)) { $semester = "Spring"; }
                   
                         $summer_start_date_year_prepended = $current_year . "-06-01"; 
                         $summer_start_object = getTimeZoneObject($summer_start_date_year_prepended);
                         
                         $summer_end_date_year_prepended = $current_year . "-08-30";
                         $summer_end_object = getTimeZoneObject($summer_end_date_year_prepended);
                         
                         $selected_summer = ( ($summer_start_object->getTimeStamp() <= $today_timestamp) && ($summer_end_object->getTimeStamp() >= $today_timestamp)) ? " selected" : ""; 
                         echo "<option value='Summer'>Summer</option>"; 
                         if (!empty($selected_summer)) { $semester = "Summer"; } ?>
                   
               </select>
               <!-- Calculate Semster GPA Set Database Session Variable $gpa -->
               <?php 
                $gpa = "ERROR";
                if($stmt = $conn->prepare("CALL getSemesterGPA(?, ?, ?, @semesterGPA)")) {      
                    $stmt->bind_param('ssi', $username, $semester, $most_recent_year_enrolled);
                    if($stmt->execute()) {
                        $select = $conn->query("SELECT @semesterGPA");
                        $result = $select->fetch_assoc();
                        $gpa = $result['@semesterGPA'];
                        $stmt->close();
                    }       
                 }
              ?>
              <div id="gpacontainer">
                  <label id="labelgpatitle">GPA:</label>
                  <label id="labelgpasemestertitle">Semester:</label>
                  
                  <label id="labelgpasemester" value = <?php echo $gpa; ?>><?php echo $gpa;?></label> 
                  <!-- Calculate Cumulative GPA Set Database Session Variable $gpa -->
                  <?php
                     $cumulative_gpa = "ERROR";
                     $sql = "CALL getCumulativeGPA(?, @cumulativeGPA)";
                     if($stmt = $conn->prepare($sql)) {
                       $stmt->bind_param('s', $username);
                         if ($stmt->execute()) {
                            $select = $conn->query("SELECT @cumulativeGPA");
                            $result = $select->fetch_assoc();
                            $cumulative_gpa = $result['@cumulativeGPA'];                    
                            $stmt->close();
                         }
                     }
                  ?>
                  <label id="labelcumulativetitle">Cumulative:</label> 
                  <label id="labelcumulativegpa" value = <?php echo $cumulative_gpa; ?>><?php echo $cumulative_gpa;?></label>
              </div>    
         </div>   
         <div id="tablegradescontainer">
          <table id="tablegrades" class="tablesorter">
              <thead>
                    <tr id="headerRow">
                         <th class="code">Code</th>
                         <th class="title">Title</th>
                         <th class="grade">Grade</th>
                         <th class="credits">Credits</th>
                    </tr>
              </thead>
            <tbody>
              <?php $most_recent_year_enrolled = 2010;  // Temporary
                   $enrolled_grade_append_year =  "user_grade_" . $most_recent_year_enrolled;
                   $sql = "SELECT e." . $enrolled_grade_append_year . ", c.title, c.credits, c.code" .
                           " FROM enrolled_" . $most_recent_year_enrolled . " AS e 
                             INNER JOIN courses AS c ON c.code = e.user_course_code" . 
                           " WHERE e.user_semester_" . $most_recent_year_enrolled . " = ? 
                             AND e.user_email_".$most_recent_year_enrolled . " = ?;";
                             
                if ( $stmt = $conn->prepare($sql)) {
                    $semester = "Fall";  //Temporary
                    $stmt->bind_param('ss', $semester, $username);
                    
                    if ($stmt->execute()) {
                       $stmt->bind_result($grade, $title, $credits, $code);
                       while ($stmt->fetch()) {
                         echo "<tr>";
                             echo "<td>", $code, "</td>";
                             echo "<td>", $title, "</td>";
                             echo "<td>", $grade, "</td>";
                             echo "<td>", $credits, "</td>";
                         echo "</tr>";
                       }           
                       $stmt->close();                       
                    }
                }   
              ?>          
            </tbody>
         </table>
         </div>
         <div id="totalcreditscontainer">
             <label id="labeltotalcreditstitle">Total Credits:</label>
             <label id="labeltotalcredits">10</label>
         </div>
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
                        <input type="checkbox" id="showpasscb">Show Password
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
                    <label class="instructions">Enter Payment</label>
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
        
        <!--<div id="reviewpaymentcontainer">
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
         -->
      </div>
     
      <script src="../plugins/jquery-1.12.0.js"></script>
      <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
      <script src="../plugins/autonumeric/autoNumeric.js"></script>
      <script src="../plugins/jquery.maskedinput.js"></script>
      <script src="../javascript/account.js"></script>
    </body>
</html>