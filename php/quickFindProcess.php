<?php
    require_once('config.php');
    
    if (isSet($_GET['term']) && (!empty($_GET['term'])) {
        $termFind = $_GET['term'];
        
        $sql = "SELECT FROM courses * WHERE code = '" . $termFind . "';";
        
        if ($stmt = $conn->prepare($sql)) {
            if ($stmt->execute()) {
                
            }
        }
    }
?>