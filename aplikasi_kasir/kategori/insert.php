<!-- Koneksi ke database -->
<?php
require_once('../koneksi/koneksi.php');


$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
    $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
    $stmt = $conn->prepare("INSERT INTO kategori (namakategori, ketkategori) VALUES (?, ?)");
    $stmt->bind_param("ss", $_POST['namakategori'], $_POST['ketkategori']);
    $stmt->execute();
    if ($stmt->error) {
        die("Query failed: " . $stmt->error);
    }
    $stmt->close();
}
?>

<h3>INSERT DATA KATEGORI</h3>
<form action="<?php echo $editFormAction; ?>" name="form1" method="POST">
    <input type="text" name="namakategori" placeholder="Masukkan Nama Kategori" required></br>
    <input type="text" name="ketkategori" placeholder="Masukkan Keterangan"></br>
    <button type="submit">Simpan</button>
    <input type="hidden" name="MM_insert" value="form1">
</form>