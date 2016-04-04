<!DOCTYPE html>
<html>
	<head>
        <link rel="stylesheet" href="../css/registerstyles.css"/>
        <meta charset="UTF-8">
	</head>	
	   <body>
	       <h1>Registration</h1>
              <form name="registerform" id="registerform">
			     <fieldset>					 
					<div class="inputwrap">
					   <label>Last Name*:</label>
					   <input class="inputfieldletters" type="text" id="lastname" 
                              name="lastname"  maxlength="30" autofocus>
					</div>
					<div class="inputwrap">
					   <label>First Name*:</label>
						<input class="inputfieldletters" type="text" id="firstname" 
                        name="firstname" maxlength="30">
					</div>
   					<div id="country_drop_down">
                       <label>Country*:</label>
                           <select id="countryselect" class="dropdown"></select>   
					</div> 
					<div id="state_drop_down" class="dropdown">
                                 <label id="statelabel">State*:</label>	
                                 <select id="stateselect" class="dropdown"></select>
                                 <img id="loading_state_image" src="../images/loader.gif">
                    </div>
					<div id="city_drop_down" >				
						<label id="citylabel">City*:</label>	
                                 <select id="cityselect" class="dropdown"></select>
                                 <img id="loading_city_image" src="../images/loader.gif">
					</div>	
					<div class="inputwrap">
						<label>Address*:</label>
							 <input class="inputfield" type="text" id="address" name="address" maxlength="50">
					</div>
                    <div class="inputwrap">
						<label>Postal Code*:</label>
							 <input class="inputfieldnumbers" type="text" id="postalcode" name="postalcode" maxlength="5">
					</div>
					<div class="inputwrap"> 				
					<label>Phone Home*:</label>
							 <input class="inputfieldnumbers" type="text" id="phonehome" name="home" maxlength="15">
					</div>
					<div class="inputwrap">
						<label>Phone Mobile:</label>
							 <input class="inputfieldnumbers" type="text" id="phonemobile" name="mobile" maxlength="15">
					</div>
                    <div id="major_drop_down" class="dropdown">
						<label>Major*:</label>
							 <select id="majorselect" name="major"></select>
					</div>							
					<div class="inputwrap">
						<label>Email*:</label>
							 <input class="inputfield" type="text" id="email" name="email" maxlength="50" >
					</div>							    
					<div class="inputwrap">
						<label>Password*:</label>
							 <input class="inputfield" type="password" id="password" value="" name="password" >
					</div>
					<div class="inputwrap">
						<label>Confirm*:</label>
							 <input class="inputfield" type="password" id="confirm" value="" name="confirm" >
					</div>
				</fieldset>
				<button type="button" id="submit">SUBMIT</button>
                
                 <script src="../plugins/jquery-1.12.0.js"></script>
                 <script src="https://raw.githubusercontent.com/digitalBush/jquery.maskedinput/1.4.1/dist/jquery.maskedinput.js"></script>
                 <script src="../javascript/validateregistration.js"></script>
       </body>
</html>
