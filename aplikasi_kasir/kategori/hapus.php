<?php 
require_once('../koneksi/koneksi.php');

if ((isset($_GET['id'])) && ($_GET['id'] != "")) {
 
    $deleteSQL = sprintf("DELETE FROM kategori WHERE idkategori=%s",
                         inj($conn, $_GET['id'], "int"));
     
    $Result1 = mysqli_query($conn, $deleteSQL) or die(errorQuery(mysqli_error($conn))); 
  }
?>

<h3>Data Berhasil Dihapus</h3>
<a href="read.php">Kembali</a>