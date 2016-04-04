<!DOCTYPE html>

<html>
   <head>
     <link rel="stylesheet" href="../css/makepaymentstyles.css"/>
     <meta charset="UTF-8">
   </head>
   <body>
     <div id="paymentscontainer">
        <div id="inputcontainer">
             <label class="makepaymentlabel">Payment Type:
                  <select id="selectpaymenttype">
                      <option disabled="disabled" selected="selected">-- Select --</option>
                      <option>Credit Card</option>
                      <option>Online Payment</option>
                  </select>
             </label>
        </div>
        <div id="paymentcompany">
                 <label>Company:        
                    <select id="companydropdown"> </select>
                 </label>
        </div>
        
        <div id="paymentcompanyonline">
                 <label>Company:        
                    <select id="companydropdownonline"> </select>
                 </label>
        </div>        
        
        <div id="nextbuttoncontainer">
            <button type="button" id="nextbutton">Next</button>
        </div>
     </div>     
     <script src="../plugins/jquery-1.12.0.js"></script>
     <script src="../javascript/makepayment.js"></script>
   </body>
</html>