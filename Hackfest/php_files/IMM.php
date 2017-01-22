<?php
  $servername = "localhost";
  $username = "root";
  $password = "brilliant";
  try {
      $conn = new PDO("mysql:host=$servername;dbname=InorbitMallMumbai", $username, $password);
      // set the PDO error mode to exception
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //  echo "Connected successfully";
      }
  catch(PDOException $e)
      {
      echo "Connection failed: " . $e->getMessage();
    }
    //$code=$_POST['id'];
    $sql= $conn->prepare("SELECT Name,Price From Items WHERE Code= :code ");
    $sql->bindParam(":code",$code);
    $code= $_POST['id'];
    $sql->execute();
    $r=$sql->fetchObject();
  if($r){
    $name = $r->Name;
    $price = $r->Price;
    //$arr = array('name' => $name,'price' => $price);
    //echo json_encode($arr);
    //$price_strng = sprintf("%.2f", $price); // $string = "0.123";
    //$details= $price_strng.'@'.$name;
    echo $price.'@'.$name;
  }
  else{
    echo "Item not found";
  }
?>
