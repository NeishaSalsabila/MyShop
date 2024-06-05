<?php
include_once 'dbconnect.php';

// Define your $conn variable in db_connect.php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  
    $username = mysqli_real_escape_string($conn, $_POST["username"]);
    $password = mysqli_real_escape_string($conn, $_POST["password"]);
    $email = mysqli_real_escape_string($conn, $_POST["email"]);
    $address = mysqli_real_escape_string($conn, $_POST["address"]);

    $query = "INSERT INTO user (username, password, email, address) VALUES ('$username', '$password', '$email', '$address')";

    $execute = mysqli_query($conn, $query);

    if ($execute) {
        echo "Data User Baru Berhasil Disimpan";
    } else {
        echo "Error: " . mysqli_error($conn);
    }

    // Close the database connection if necessary
    $conn->close();
}
?>