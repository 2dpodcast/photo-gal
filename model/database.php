<?php
    try {
        $db = new PDO($db_dsn, $db_username, $db_password);
        unset($db_username);
        unset($db_password);
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        include('errors/database_error.php');
        exit();
    }
?>
