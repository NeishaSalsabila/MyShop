<?php
include_once 'dbconnect.php';

$query = $conn->prepare("SELECT id, nama, keterangan, harga, gambar, promo FROM barang;");
$query -> execute();
$query -> bind_result($id, $nama, $keterangan, $harga, $gambar, $promo);
$arraybarang = array();

while($query -> fetch()){
$data = array();
$data ['id']=$id;
$data ['nama']=$nama;
$data ['keterangan']=$keterangan;
$data ['harga']=$harga;
$data ['gambar']=$gambar;
$data ['promo']=$promo;
array_push($arraybarang,$data);

}
echo json_encode($arraybarang);
?>
