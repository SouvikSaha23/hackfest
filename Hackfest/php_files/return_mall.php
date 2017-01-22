<?php
if($_Server['REQUEST_METHOD']='POST'){
  require_once('shopping_mall.php');
  $sql= $conn->prepare("SELECT php_file From Malls WHERE QR_Code= :code ");
  $sql->bindParam(":code",$code);
  $code= $_POST['id'];
  $sql->execute();
  $r=$sql->fetchObject();
if($r){
  $file_name= $r->php_file;
  echo $file_name;
}
else{
  echo null;
}
}
else{
  echo "error";
}
  ?>
