<?php
$hostname = "localhost";
$database = "kasir";
$username = "root";
$password = "";
$conn = mysqli_connect($hostname, $username, $password) or trigger_error(mysqli_error($conn), E_USER_ERROR); 
mysqli_select_db($conn, $database);

// Fungsi sanitasi
if (!function_exists("inj")) {
    function inj($conn, $theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
    {
      $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($conn, $theValue) : mysqli_escape_string($conn, $theValue);
    
      switch ($theType) {
        case "text":
          $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
          break;    
        case "long":
        case "int":
          $theValue = ($theValue != "") ? intval($theValue) : "NULL";
          break;
        case "double":
          $theValue = ($theValue != "") ? "'" . doubleval($theValue) . "'" : "NULL";
          break;
        case "date":
          $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
          break;
        case "defined":
          $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
          break;
      }
      return $theValue;
    }
}

// Fungsi Kembali
function back() {
  echo '<button onclick="window.history.go(-1); return false;"> Go Back</button>';
}

// Fungsi Menampilkan Eror
function errorQuery($isi) {
  back(); 
  echo "<br>    
  <h4>Oops! Ada yang salah</h4>
  <strong>Pesan Kesalahan : </strong>".$isi."</div>";
}
