<!DOCTYPE html>

<html>
  <head>
      <link rel="stylesheet" href="../css/makepayment.css"/>
      <meta charset="UTF-8">
  </head>
<body>
   <?php if $_GET['payment_type'] == "Credit Card") {
          ?> <label id="makepaymentlabel">Number: 
      <input type="text"/>
  </label> 
  
  <label id="makepaymentlabel">VIN:
      <input type="text"/>
   </label> 
   <?php } else {
   ?>
  

<script src="../plugins/jquery-1.12.0.js"></script>
<script src="../javascript/makepayment.js"></script>

</body>
     

</html>