<?php
  if($_Server['REQUEST_METHOD']='POST'){
    $name= $_POST['name'];
    $email= $_POST['email'];
    $phone= $_POST['mobile'];
    $address= $_POST['address'];
    $pass= $_POST['password'];
//require_once allows to access the contents of other php file
//in the current php file. This saves us from writing the same code here...
    require_once('signup_access.php');
//It is basically calling the whole code of signup access here
    $sql= $conn->query("INSERT INTO usr_details(Name,Email,Address,Phone,Password) VALUES ('$name','$email','$address','$phone','$pass')");
    if($sql){
      echo "Successfully Registered";
    }
    else {
      echo 'Could not register';
    }
  }
  else{
    echo 'error';
  }
?>
