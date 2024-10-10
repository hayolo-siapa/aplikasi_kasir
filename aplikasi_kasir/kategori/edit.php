<?php
require_once('../koneksi/koneksi.php');

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_update"])) && ($_POST["MM_update"] == "form1")) {
    $updateSQL = sprintf("UPDATE kategori SET namakategori = '%s', ketkategori = '%s' WHERE idkategori = %d",
                inj($conn, $_POST['namakategori'], "text"),
                inj($conn, $_POST['ketkategori'], "text"),
                inj($conn, $_POST['idkategori'], "int"));
    $Result1 = mysqli_query($conn, $updateSQL) or die(errorQuery(mysqli_error($conn)));
}

$id = "-1";
if (isset($_GET['id'])){
    $id = $_GET['id'];
}
$query = sprintf("SELECT * FROM kategori WHERE idkategori = %d ORDER BY idkategori ASC", inj($conn, $id, "int"));
$eksekusi = mysqli_query($conn, $query) or die(errorQuery(mysqli_error($conn)));
$row = mysqli_fetch_assoc($eksekusi);
$totalRows = mysqli_num_rows($eksekusi);

?>

<h3>UPDATE DATA KATEGORI</h3>
<form action="<?php echo $editFormAction; ?>" name="form1" method="POST">
    <input type="text" name="namakategori" value="<?php echo $row['namakategori']; ?>"></br>
    <input type="text" name="ketkategori" VALUES="<?php echo $row['ketkategori']; ?>"></br>
    <button type="submit">Simpan</button>
    <input type="hidden" name="MM_update" VALUES="form1">
    <input type="hidden" name="idkategori" VALUES="<?php echo $row['idkategori']; ?>"></br>
</form>
