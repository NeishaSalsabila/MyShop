<?php
include_once 'dbconnect.php';

$response = array();
if($_SERVER ['REQUEST_METHOD']=='POST'){
$nama = $_POST["nama"];
$keterangan = $_POST["keterangan"];
$harga = $_POST["harga"];
$gambar = $_POST["gambar"];
$promo = $_POST["promo"];

$query = "INSERT INTO barang (nama, keterangan, harga, gambar, promo) VALUES ('$nama', '$keterangan', '$harga', '$gambar', '$promo')";
$excecute = mysqli_query ($conn, $query);
$check = mysqli_affected_rows($conn);
if($check > 0){
$response["code"]=1;
$response["message"]="data berhasil ditambah";
}else{
$response["code"]=0;
$response["message"]="data barang gagal ditambahkan";
}
}else{
$response["code"]=0;
$response["message"]="tidak ada entry data barang";
}
echo json_encode($response);
mysqli_close($conn);
?>