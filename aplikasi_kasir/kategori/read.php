<?php
require_once('../koneksi/koneksi.php');
// Tampil data
$query = "SELECT  * FROM kategori ORDER BY idkategori ASC";
$eksekusi = mysqli_query($conn, $query) or die(errorQuery(mysqli_error($conn)));
$row = mysqli_fetch_assoc($eksekusi);
$totalRows = mysqli_num_rows($eksekusi);
?>

<h3>DAFTAR KATEGORI</h3>
<a href="insert.php">Kategori</a>
<table border ="1">
    <tr>
        <td>No.</td>
        <td>NAMA KATEGORI</td>
        <td>KET</td>
        <td>AKSI</td>
    </tr>

    <?php $no=1; do { ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $row["namakategori"];?></td>
        <td><?php echo $row["ketkategori"];?></td>
        <td> <a href="edit.php?=<?php echo $row['idkategori'];?>"> Edit </a>|<a href="hapus.php?=<?php echo $row['idkategori'];?>"> Hapus </a></td>
    </tr>
    <?php } while ($row = mysqli_fetch_assoc($eksekusi)); ?>
</table>
