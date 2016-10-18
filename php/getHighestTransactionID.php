<?php
   require_once("config.php");
   session_start();
      $sql = "SELECT MAX(id) FROM charges";      
      if($stmt = $conn->prepare($sql)) {
          $stmt->bind_result($id_high_charges);
          if($stmt->execute()) {
              $stmt->close();
              $sql = "SELECT MAX(id) FROM charges";
              if($stmt = $conn->prepare($sql)) {
                  $stmt->bind_result($id_high_payments);
                  if ($stmt->execute()) {
                       if ($id_high_charges > $id_high_payments) ? echo $id_high_charges 
                                                                 : echo $id_high_payments;                           
                  } else {
                      echo "ERROR : executing max payment id";
                  }                  
              } else {
                  echo "ERROR : preparing max payment id";
              }
          } else {
              echo "ERROR : executing max charge id";
          }
      } else {
          echo "ERROR : preparing max charge id";
      }
?>