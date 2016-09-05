<?php
    if (isset($_POST['input']) && (!empty['input'])) {
       $_SESSION['quickFindInput'] = $_POST['input'];
    }
?>