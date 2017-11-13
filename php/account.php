<!DOCTYPE html>

<?php
    require_once("config.php");
    require_once("utilityFunctions.php");
    session_start();
    
    if (isset($_GET['username'])) {
        $username = $_GET['username'];
        $_SESSION['username'] = $username;
    } else {
       $username = $_SESSION['username'];
    }        
      
    if (!isset($_GET['firstname'])) {
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
           $_SESSION['firstname'] = $firstName;
           $_SESSION['lastname'] = $lastName;
           $_SESSION['country'] = $country;
           $_SESSION['state'] = $state;
           $_SESSION['city'] = $city;
           $_SESSION['major'] = $major;
           $_SESSION['address'] = $address;
           $_SESSION['homephone'] = $homePhone;
           $_SESSION['mobilephone'] = $mobilePhone;
           $_SESSION['postalcode'] = $postalCode;
           $_SESSION['balance'] = $balance;
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
      <?php include("../php/navigation.php");         
        
      // Check if user is enrolled to show current courses tab to add and remove  
      $sql = "SELECT currently_enrolled FROM users WHERE user_email = ?";           
                   if ($stmt = $conn->prepare($sql)) {
                       $stmt->bind_param('s', $username);
                       if($stmt->execute()) {
                          $stmt->bind_result($currently_enrolled);
                          $stmt->fetch();
                          $stmt->close();
                       }
                   } 
      ?>             
        
      <ul class="tabs">
         <li><a href="#tab-personal">Personal</a></li>
         <?php
                if ($currently_enrolled === 1) {         
                     echo '<li><a href="#tab-courses">Current Courses</a></li>';
                }
         ?>       
         <li><a href="#tab-grades">Grades</a></li>
         <li id="financialtab"><a href="#tab-financial">Financial</a></li>
         <li id="makepaymenttab"><a href="#tab-payment">Make Payment</a>
             <input type="button" title="Close Tab" id="closepaymenttabbutton" value="X">
         </li>
      </ul>
      
      <div id="tab-personal" class="tabsjump">             
                <fieldset id="contactfieldset">
                   <legend>Contact</legend>
                    <div id="errorcontainer" class="error"></div>
                    <label class="contactlabel">FirstName* :</label><input type="text" id="firstname" class="contactinput" value="<?php echo $_SESSION['firstname'];?>" readonly>
                    <label class="contactlabel">Last Name* :</label><input type="text" id="lastname" class="contactinput" value="<?php echo $_SESSION['lastname']?>" readonly>
                    <label class="contactlabel">Street&nbsp;Address*&nbsp;:</label><input type="text" id="streetaddress" class="contactinput" value="<?php echo $_SESSION['address'];?>" readonly>
                     <label class="contactlabel">Country* :</label> <select id="countrydropdown" class="contactinput">
                        <?php
                            $result = $conn->query("SELECT * FROM countries");
                               if ($result) {
                                  while ($row = $result->fetch_assoc()) { 
                                        $selected = ($_SESSION['country'] == $row["country_name"]) ? " selected" : "";
                                        echo "<option value=", $row["country_id"], $selected,  ">", $row["country_name"], "</option>";
                                  }
                               }
                        ?>
                     </select>
                    
                     <label class="contactlabel">State* :</label> <select id="statedropdown" class="contactinput">
                        <?php 
                          $stmt = $conn->prepare("SELECT country_id FROM countries WHERE country_name = ?");
                          $stmt->bind_param('s', $_SESSION['country']);
                          
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
                                    $selected = ($_SESSION['state'] == $stateName) ? " selected" : "";
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
                                  $selected = ($_SESSION['city'] == $cityName) ? " selected" : "";
                                  echo "<option value=", $cityID, $selected, ">", $cityName, "</option>";
                               }
                            }
                            $stmt->close();
                          ?>
                     </select>
                    
                    <label class="contactlabel">Zip Code* :</label><input type="text" id="zipcode" class="contactinput" value="<?php echo $postalCode;?>" readonly>
                    <label class="contactlabel">Home&nbsp;Phone*&nbsp;:</label><input type="text" id="homephone" class="contactinput" value="<?php echo $homePhone;?>" readonly>
                    <label class="contactlabel">Mobile&nbsp;Phone*&nbsp;:</label><input type="text" id="mobilephone" class="contactinput" value="<?php echo $mobilePhone?>" readonly>
                    <label class="contactlabel">Major* : </label> <select id="majordropdown" class="contactinput">
                        <?php 
                          $result = $conn->query("SELECT DISTINCT user_major FROM users");
                          if($result) {
                              while ($row = $result->fetch_assoc())   { 
                                    $selected = ($_SESSION['major'] == $row['user_major']) ? " selected" : "";
                                    echo "<option value=", $row["user_major"], $selected, ">", $row["user_major"], "</option>";
                              }
                          } 
                          ?>
                    </select> 
                     
                    <label class="contactlabel">Email* :</label><input type="text" id="email" class="contactinput" value="<?php echo $_SESSION['username'];?>" readonly>
                    <label id="allfieldsrequirednotation">* required</label>                    
                </fieldset>
                     <fieldset id="passwordfieldset">
                        <legend>Change Password</legend>
                           <div id="passwordmessage" class="error"></div> 
                           <label class="contactlabel">Old :</label><input class="changepasswordinput" type="password" id="oldpassword"  disabled>
                           <label class="contactlabel">New :</label><input class="changepasswordinput" type="password" id="newpassword"  disabled>
                           <label class="contactlabel">Confirm :</label><input class="changepasswordinput" type="password" id="confirmpassword" disabled>
                     </fieldset>
                     <button type="button" id="changepasswordbutton">Change Password</button>
           <div id="editbuttoncontainer">
                        <button type="button" id="editbutton">Edit</button>
                        <button type="button" id="resetdefaultbutton" disabled>Reset</button>
           </div>
      </div>
      
      <?php
       if($currently_enrolled === 1) {                
          echo '<div id="tab-courses" class="tabsjump">';
          echo '<div class="containercoursestitle">';
          //
                 echo '<label class="labeltitletables">  Fall ', getCurrentDateObject()->format("Y"), '</label>';
           echo '</div>';
           echo '<div id="containerfilterscurrentcourses">';
           echo '<label id="filterlabel" class="filters"> Filter By: </label>';
              echo '<div id="filterdepartment" class="filters">';
                        echo '<select id="departmentfilter">';
                            echo '<option>-- Select Department --</option>';
                             $result = $conn->query("SELECT DISTINCT department FROM courses");
                                  if($result) {
                                     while($row = $result->fetch_assoc()) { 
                                         echo '<option value=', $row['department'], '>', $row['department'], '<', '</option>';
                                     }
                                  } 
                        echo '</select>';                        
              echo '</div>';
                  
                  echo '<div id="filtercodes" class="filters">';
                        echo '<select id="codefilter">'; 
                            echo '<option>-- Select Code --</option>';
                             $result = $conn->query("SELECT DISTINCT code FROM courses;");
                                  if($result) {
                                     while ($row = $result->fetch_assoc()) { 
                                       echo '<option value=', $row['code'], '>', $row['code'], '>', '</option>';
                                     } 
                                  } 
                        echo '</select>';
                  echo '</div>';

                 echo '<div id="filterprofessor" class="filters">';
                        echo '<select id="professorfilter">';
                            echo '<option>-- Select Professor -- </option>';
                            $result = $conn->query("SELECT DISTINCT concat(professor_last_name, ', ', professor_first_name) AS professor FROM courses;");
                                     if ($result) {
                                        while($row = $result->fetch_assoc()) { 
                                         echo '<option value=',  $row['professor'],  '>', $row['professor'], '</option>';
                                        }  
                                     } 
                                     echo '</select>';
                  echo '</div>';
                  
                  echo '<div id="filterlocation" class="filters">';
                        echo '<select id="locationfilter">'; 
                            echo '<option>-- Select Location --</option>';
                              $result = $conn->query("SELECT DISTINCT location FROM courses;");
                                  if ($result) {
                                      while($row = $result->fetch_assoc()) { 
                                        echo '<option value=', $row['location'], '>', $row['location'], '</option>';
                                      } 
                                  }                         
                        echo '</select>';                        
                  echo '</div>';
               echo '</div>';
              
              echo '<table id="tablecourses" class="tablesorter">';      
                  echo '<thead>';
                        echo '<tr id="headerRow">';
                             echo '<th class="checkbox"><input type="checkbox" id="checkboxhead"></th>';
                             echo '<th class="code">Code</th>';
                             echo '<th class="name">Name</th>';
                             echo '<th class="department">Department</th>';
                             echo '<th class="professor">Professor</th>';
                             echo '<th class="time">Time</th>';
                             echo '<th class="location">Location</th>';
                             echo '<th class="credits">Credits</th>';
                        echo '</tr>';
                   echo '</thead>';     
                 echo '<tbody>';
                 
                   $currentCreditTotal = 0;
                   $count_current_courses = 0;
                   $current_courses_codes = [];
                    
                       $today_date = new DateTime(null, new DateTimeZone("UTC"));
                       $today_date->setTimeZone(new DateTimeZone("America/New_York"));
                       $current_year = $today_date->format("Y");
                       // temporary
                       $semester = "Spring";
                   
                        $sql = "SELECT c.code, c.title, c.days, c.department, c.begin_time, c.end_time, 
                                    c.am_pm, c.credits, c.professor_last_name, c.professor_first_name, c.location, c.department 
                                   FROM courses AS c INNER JOIN " . "enrolled_" . $current_year .  " AS e" .
                                   " ON c.code = e.user_course_code WHERE e.user_email_" . $current_year . " = ? " .
                                   " AND user_semester_" . $current_year . " = ?;";

                        if($stmt = $conn->prepare($sql)) {
                            $stmt->bind_param('ss', $username, $semester);
                            if($stmt->execute()) {
                                 $stmt->store_result();
                                 $stmt->bind_result($code, $title, $days, $department, $begin_time, 
                                                    $end_time, $am_pm, $credits, $professor_last_name, 
                                                    $professor_first_name, $location, $department );
                                 while($stmt->fetch()) {    
                                    $count_current_courses++;     
                                    array_push($current_courses_codes, $code);
                                    echo "<tr>";
                                        echo "<td><input type='checkbox' class='checkbox' id='checkboxrow'></td>";
                                        echo "<td>", $code, "</td>";
                                        echo "<td>", $title, "</td>";
                                        echo "<td>", $department, "</td>";
                                        echo "<td>",  $professor_last_name,  ", ", $professor_first_name, "</td>";
                                        echo "<td>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
                                        echo "<td>", $location, "</td>";
                                        echo "<td id='credits'>", $credits, "</td>";
                                        $currentCreditTotal = ($currentCreditTotal + $credits);
                                    echo "</tr>";
                                  }  
                               $stmt->close();   
                            }            
                        } 
                 echo '</tbody>';                  
             echo '</table>';
             
             echo '<div class="creditscontainer">';
                echo '<label class="labelcreditstitle">Current Credit Total: </label>'; 
                echo '<label id="labelcurrentcredittotal"><?php echo $currentCreditTotal; ?></label>';
             echo '</div>';
             
             echo '<div class="buttonscontainer">';
                  echo '<button type="button" id="buttonremovecourses" class="buttonscourses" disabled>Remove</button>';
                  echo '<button type="button" id="buttonupdatecourses" class="buttonscourses"'; if($count_current_courses == 0) { echo "disabled"; }; echo '>Update</button>';
             echo '</div>';
             
             echo '<div class="containercoursestitle">';
                  echo '<label class="labeltitletables">Catalog</label>';
             echo '</div>';
             
             echo '<div id="filterdepartmentcontainer">';
                 echo '<label id="labelfilterdepartmenttitle">Filter By: </label>';       
                    echo '<select id="departmentfilter">'; 
                            echo '<option>-- Select Department --</option>';
                             $result = $conn->query("SELECT DISTINCT department FROM courses");
                                  if($result) {
                                     while($row = $result->fetch_assoc()) { 
                                        echo '<option value=', $row['department'], '>', $row['department'],  '</option>';
                                     }
                                  } 
                    echo '</select>';        
             echo '</div>';
        
             echo '<table id="tablecatalog" class="tablesorter">';      
              echo '<thead>';
                    echo '<tr id="headerRow">';
                         echo '<th></th>';
                         echo '<th class="code">Code</th>';
                         echo '<th class="name">Name</th>';
                         echo '<th class="department">Department</th>';
                         echo '<th class="professor">Professor</th>';
                         echo '<th class="time">Time</th>';
                         echo '<th class="location">Location</th>';
                         echo '<th class="credits">Credits</th>';
                    echo '</tr>';
               echo '</thead>';     
                 echo '<tbody>';
                     $result = $conn->query("SELECT * FROM courses 
                                                  INNER JOIN current_courses_capacity
                                                  ON courses.code = current_courses_capacity.code
                                                  WHERE current_courses_capacity.current_capacity < current_courses_capacity.max_capacity");
                          if($result) {
                                while($row = $result->fetch_assoc()) {      
                                     $code = $row['code'];
                                     if (!(in_array($code, $current_courses_codes))) {
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
                                }  
                         } 
                 echo '</tbody>';    
             echo '</table>';
             echo '<div class="creditscontainer">';
                 echo '<label class="labelcreditstitle">Selected Credits: </label>'; 
                 echo '<label id="labelselectedcredits">0</label>';
             echo '</div>';
             echo '<div class="buttonscontainer">';
                      echo '<button type="button" id="buttonaddcourses" class="buttonscourses" disabled>Add</button>';
             echo '</div>';
          echo '</div>';    
       }
        ?>      
      
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
                          $semester = getSemesterOpenEnrollment();
                          
                          if ($semester === 'Fall') {
                             echo "<option value='Fall' selected>Fall</option>";
                          } else if ($semester === 'Spring') {
                             echo "<option value='Spring'>Spring</option>";
                          } else if ($semester === 'Summer') {
                             echo "<option value='Summer'>Summer</option>"; 
                          }
                   ?>
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
                    $semester = "Spring";  //Temporary
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
              <div id="containerpaymentbutton">
                   <button type="button" id="makepaymentbutton">Make Payment</button>
              </div>              
              <div id="containersummarytitle">
                    <label id="labelsummarytitle" class="labelfinancial">Summary</label>
              </div>
              <?php 
                      $sql = "SELECT user_balance, user_fine FROM users WHERE user_email = ?";
                                     if($stmt = $conn->prepare($sql)) {
                                         $stmt->bind_param('s', $username);
                                         $stmt->bind_result($tuition, $fine);
                                         if($stmt->execute()) {
                                             $stmt->fetch();
                                         } 
                                     }
              ?>
              <table id="tablesummary">                
                     <tbody>
                        <tr>
                            <td class="cellsummarylabel">Tuition</td>
                            <td class="cellssummary"><?php echo $tuition; ?></td>
                        </tr>
                        <tr>           
                             <td class="cellsummarylabel">Fines</td>
                            <td class="cellssummary"><?php echo $fine; ?></td>
                        </tr> 
                        <tr class="separatorlinetotal">            
                             <td class="cellsummarylabel">Total</td>
                            <td class="cellssummary"><?php echo ($tuition + $fine); ?></td>
                        </tr>
                        <?php $stmt->close(); ?>
                     </tbody>
                 </table>
                 <div id="containertransactionstitle">
                       <label id="labeltransactionstitle" class="labelfinancial">Transactions</label>
                 </div>

                <div id="containerfilterby">
                    <label id="filterbylabel">Filter By:</label>                 
                           <select id="selecttype">
                              <option value="All">All</option>
                              <option value="Payment">Payment</option>
                              <option value="Charge">Charge</option>
                           </select> 
                </div>
                                    
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
                                 <?php 
                                       $sql = "SELECT id, charge_amount, charge_date FROM charges WHERE charge_username = ?";
                                         if($stmt = $conn->prepare($sql)) {
                                             $stmt->bind_param('s', $username);
                                             $stmt->bind_result($code, $amount, $date);
                                             if($stmt->execute()) {
                                                 while ($stmt->fetch()) {
                                                     echo "<tr>";
                                                     //Remove time from date
                                                     echo "<td>", $code, "</td>";
                                                     $date_with_time_removed = explode(" ", $date);
                                                     echo "<td id='date'>", $date_with_time_removed[0], "</td>";
                                                     echo "<td>Charge</td>";
                                                     echo "<td>$", $amount, "</td>";
                                                     echo "<td>";
                                                     echo "<a href='#'>";
                                                     echo "    details";
                                                     echo "</a>";
                                                     echo "</td>";  
                                                 }
                                             }
                                             $stmt->close();
                                         }
                                       $sql = "SELECT id, payment_amount, payment_date FROM payments WHERE payment_username = ?";
                                         if($stmt = $conn->prepare($sql)) {
                                             $stmt->bind_param('s', $username);
                                             $stmt->bind_result($code, $amount, $date);
                                             if($stmt->execute()) {
                                                 while($stmt->fetch()) {
                                                     echo "<tr>";
                                                     echo "<td>", $code, "</td>";
                                                     //Remove time from date
                                                     $date_with_time_removed = explode(" ", $date);
                                                     echo "<td>", $date_with_time_removed[0], "</td>";
                                                     echo "<td>Payment</td>";
                                                     echo "<td>$", $amount, "</td>";
                                                     echo "<td>";
                                                     echo "<a href='#'>";
                                                     echo "     details";
                                                     echo "</a>";
                                                     echo "</td>";
                                                 }
                                             }
                                             $stmt->close();
                                         }
                                       ?>
                             </tbody>
                           </table>
              </div>
            </div>
           
      <div id="tab-payment" class="tabsjump">
            <div id="currentstepcontainer">
                  <label class="currentsteplabel">Payment</label>
                  <hr/>
                  <label class="currentsteplabel">Review</label>
                  <hr/>
                  <label class="currentsteplabel">Submit</label>
            </div>
                 <div id="steponecontainer" class="paymentcontainer">
                          <label id="paymenttypelabel" class="input">Type:
                               <select id="selectpaymenttype" class="dropdown" tabindex="1">
                                     <option value="" style="display:none;"></option>
                                     <option value="cc">Credit Card</option>
                                     <option value="op">Online Payment</option>
                               </select>
                          </label>
                
                       <label class="input">Company:        
                           <select id="companydropdown" class="dropdown" tabindex="2"> </select>
                       </label>
              </div>  
        
           <div id="steptwocontainer" class="paymentcontainer">  
                <div id="messagecompletesteponecontainer">
                      <label id="completestephonelabel">Complete Type and Company in First Box to Activate</label>
                </div>

                <div id="creditinputcontainer">
                     <label id="creditcardlabel" class="input">Credit Card:
                         <input type="text" id="creditcard" maxlength="19" tabindex="3" class="inputtext"/>
                    </label>
                
                    <label id="vinlabel" class="input">VIN:
                         <input type="text" id="vin" maxlength="4" tabindex="4" class="inputtext"/>
                    </label> 
                </div>
                
                <div id="onlineinputcontainer"> 
                    <label class="input">Username:
                         <input type="text" id="username" class="inputtext" tabindex="3">
                    </label>
                
                    <label id="passwordlabel" class="input">Password:
                         <input type="password" id="password" class="inputtext" tabindex="4">
                    </label>
                
                    <input type="checkbox" id="showpasscb"/>
                    <label for="showpasscb" id="showpasslabel" tabindex="5">Show Password</label>  
                </div>
            </div>            
        
             <div id="stepthreecontainer" class="paymentcontainer">
                        <label class="input">Amount:
                          <input type="text" id="amount" class="inputtext" tabindex="5" disabled>
                        </label>
             </div>

             <div id="finishbuttoncontainer">
                  <input type="button" id="finishbutton" value="Submit Payment" disabled/> 
             </div>
        
        <!-- <div id="reviewpaymentcontainer">
             <div class="paymentcontainers">
                <label id="datelabeltitle">Date:</label><label id="datelabel"></label>
             </div>
             
             </div class="paymentcontainers">
                 <label id="transactionidtitle">Transaction ID:</label><label id ="transactionidlabel"</label>
             </div>
             
             <div class="paymentcontainers">
                 <label id="paymenttypetitle">Payment Type:</label><label id="paymenttypelabel">
             </div>
             
             <div class="paymentcontainers">
                 <label id="currentbalancetitle">Current Balance:</label><label id="currentbalancelabel"></label>
                 <label id="paymenttitle">Payment:</label><label id="paymentlabel"</label>
                 <label>_________<label>
                 <label id="balancetitle">Balance:</label><label id="balancelabel"</label>                 
             </div>
             
             <div id="submitbuttoncontainer">
                 <input type="button" id="submitbutton">
             </div>
         </div> -->
      </div>
     
      <script src="../plugins/jquery-1.12.0.js"></script>
      <script src="../plugins/tablesorter/jquery.tablesorter.js"></script>
      <script src="../plugins/autonumeric/autoNumeric.js"></script>
      <script src="../plugins/jquery.maskedinput.js"></script>
      <script src="../javascript/account.js"></script>
    </body>
</html>