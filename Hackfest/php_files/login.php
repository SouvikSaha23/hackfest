<?php
  if($_Server['REQUEST_METHOD']='POST'){
    require_once('signup_access.php');
    $sql= $conn->prepare("SELECT Name FROM usr_details WHERE Email= :email AND Password= :pass ");
    $sql->bindParam(":email",$email);
    $sql->bindParam(":pass",$pass);
    $email= $_POST['email'];
    $pass= $_POST['password'];
    $sql->execute();
    if($sql->fetchObject()){      //If email and password will be correct then $sql will contain at least some object
      echo "Successfully logged in";
    }
    else{
      echo "Login failed!";
    }
  }
?>
