// import 'package:rawatt/rumus.dart';
import 'package:flutter/material.dart';

const categoryDetail = ["Penjelas ", " Brosure "];

List<String> imgPots = [
  "assets/images/pot/balok.png",
  "assets/images/pot/kerucutTerpotong.png",
  "assets/images/pot/setengahBola.png",
  "assets/images/pot/tabung.png",
  "assets/images/pot/zonabola.png"
];
const categoryPupuk = [
  {
    "label": "Sumber bahan",
    "arrayMappedname": sumber_bahan,
    "ic": Icons.access_alarms
  },
  {
    "label": "Bentuk fisik",
    "arrayMappedname": bentuk,
    "ic": Icons.account_box_outlined
  },
  {
    "label": "Kandungan",
    "arrayMappedname": kandungan,
    "ic": Icons.account_box_outlined
  },
];
const kandungan = [
  {
    "title": "Tunggal",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/subnonsub_sp36.png",
    "details": "Modifikasi lingkungan a"
  },
  {
    "title": "Majemuk",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/npk-kebomas.png",
    "details": "10 Juli 1972"
  },
];

const bentuk = [
  {
    "title": "Padat",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/subnonsub_urea.png",
    "details":
        "Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama."
  },
  {
    "title": "Cair",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/oca.png",
    "details": "10 Juli 1972"
  },
];
const sumber_bahan = [
  {
    "title": "Organik",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/PETROGANIK.png",
    "details":
        "Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama.Modifikasi lingkungan adalah suatu transformasi fisik permanen (jangka panjang) terhadap tanah, air dan tumbuh­tumbuhan untuk mencegah/menurunkan habitat jentik tanpa mengakibatkan kerugian bagi manusia. Kegiatan-kegiatan yang dapat dilakukan untuk modifikasi lingkungan antara lain : perbaikan persediaan air bersih, tanki air atau reservoar di atas atau di bawah tanah dibuat anti nyamuk dan pengubahan fisik habitat jentik yang tahan lama."
  },
  {
    "title": "Anorganik",
    "penjelas": "Agro Industri",
    "image": "assets/images/product/nitrat.png",
    "details": "10 Juli 1972"
  },
];

const tindakanHama = [
  {
    "label": "Preventive",
    "arrayMappedname": preventif,
    "ic": Icons.access_alarms
  },
  {
    "label": "Curative",
    "arrayMappedname": curative,
    "ic": Icons.account_box_outlined
  },
];

const curative = [
  {
    "title": "Penyemprotan Peptisida",
    "penjelas": "Agro Industri",
    "image": "assets/images/Preventive-1.png",
    "details":
        "Pada pengendalian penyakit tanaman, strategi penggunaan pestisida yang disusun berdasarkan prinsip pencegahan atau preventif, bukan menunggu sampai timbulnya gejala serangan atau kuratif. Strategi ini tampak agak berbeda dengan prinsip pengendalian hama yang menganjurkan agar dilakukan pengamatan terlebih dahulu sebelum dilakukan tindakan pengendalian menggunakan pestisida. Hal ini disebabkan dari hasil beberapa penelitian dan pengalaman menunjukkan bahwa dengan strategi pengendalian penyakit secara preventif, jumlah penggunaan pestisida lebih rendah dibanding dengan jumlah penggunaan pestisida pada pengendalian secara kuratif. Strategi ini juga terbukti memperkecil risiko kegagalan panen. Sebagai contoh untuk mencegah serangan penyakit busuk buah antraknos pada tanaman cabai dilakukan penyemprotan fungisida Asilbenzolar s-metil + Mankozeb sejak tanaman cabai berbunga dengan interval 1 minggu. Jangan menggunakan fungisida tersebut jika pertanaman cabai sudah terserang oleh penyakit busuk buah, karena akan memperparah serangannya"
  },
];

const preventif = [
  {
    "title": "Modifikasi Lingkungan  ",
    "penjelas": "Agro Industri",
    "image": "assets/images/Preventive-1.png",
    "details":
        "Memodifikasi lingkungan dapat dilakukan secara kultur teknis seperti pengaturan pola tanam, pengaturan sistem tanam, pemilihan varietas, pengolahan tanah, pengapuran, solarisasi, memodifikasi iklim mikro, dan pemupukan."
  },
  {
    "title": "Perlakuan Bibit ",
    "penjelas": "Agro Industri",
    "image": "assets/images/Preventive-2.png",
    "details":
        "Perlakuan benih menggunakan pestisida dilakukan untuk menekan serangan OPT tular tanah dan tular benih.\n1. Untuk menekan serangan penyakit tular tanah, sebelum ditanam/ disemai benih direndam dalam larutan fungisida Propamokarb hidroklorida (1 ml/l) selama 0,5 jam atau dalam air hangat suam-suam kuku selama 0,5 jam.\n2. Untuk menekan serangan kutukebul terhadap bibit cabai, mentimun, dan tomat, dilakukan penyiraman larutan insektisida Tiametoksam (0,5 ml/l) dengan dosis 50 ml/ tanaman pada umur 2 dan 4 minggu setelah semai."
  },
  {
    "title": "Perlakuan Tanah",
    "penjelas": "Urea Pupuk Indonesia",
    "image": "assets/images/Preventive-3.png",
    "details":
        "Perlakuan tanah dilakukan untuk menekan serangan OPT dalam tanah. Macam perlakuan tanah yang dapat dilakukan adalah sebagai berikut : \n1. Jika ditemukan uret atau orong-orong, maka lahan diberi perlakuan dengan insektisida Fipronil 0,3 G sebanyak 15 kg/ha "
  },
  {
    "title": "Pengusir Hama",
    "penjelas": "Urea Pupuk Indonesia",
    "image": "assets/images/Preventive-4.png",
    "details":
        "Pemasangan perangkap OPT bertujuan untuk menekan populasi awal OPT agar perkembangannya tidak menimbulkan kerugian. Beberapa macam perangkap OPT adalah sebagai berikut : \n1.ntuk menekan populasi trips, kutudaun, kutukebul, dan tungau dipasang perangkap lekat warna kuning sebanyak 40-50 buah/ ha. Perangkap tersebut dipasang pada saat tanam."
  },
];

const perusahaan = [
  {
    "title": "PT. Petrokimia Gresik ",
    "penjelas": "Agro Industri",
    "logo": "assets/images/Petrokimia_logo.png",
    "image": "assets/images/perusahaan/petrokimia.png",
    "tgl": "10 Juli 1972"
  },
  {
    "title": "PT. PUPUK INDONESIA ",
    "penjelas": "Holding Company",
    "logo": "assets/images/perusahaan/logo_pupuk_indonesia.png",
    "image": "assets/images/perusahaan/Pupuk_Indonesia.png",
    "tgl": "10 Juli 1972"
  },
];

const stakeholder = [
  {
    "title": "PT. Pupuk Indonesia ",
    "penjelas": "Agro Industri",
    "image": "assets/images/Petrokimia_logo.png",
    "tgl": "10 Juli 1972"
  },
  {
    "title": "PT. Petrokimia Gresik ",
    "penjelas": "Agro Industri",
    "image": "assets/images/Petrokimia_logo.png",
    "tgl": "10 Juli 1972"
  },
  {
    "title": "PT. Pupuk Kaltim",
    "penjelas": "Urea Pupuk Indonesia",
    "image": "assets/images/Petrokimia_logo.png",
    "tgl": "10 Juli 1972"
  },
];

const iconss = [
  {"ic": icpupuk},
];
const icpupuk = [{}];

const quotes = [
  {
    "title": "Rawatlah Tanamanmu!!!",
    "kutipan":
        "Tuhan takkan mengkhianati upaya dan kerja kerasnya akan berbuah manis mulai hari ini, besok dan nanti.",
    "image": "assets/images/object_tanaman-01.png",
  },
  {
    "title": "Rawatlah Tanamanmu!!!",
    "kutipan":
        "Tuhan takkan mengkhianati upaya dan kerja kerasnya akan berbuah manis mulai hari ini, besok dan nanti.",
    "image": "assets/images/object_tanaman2.png",
  },
];

const artikelPertanian = [
  {
    "title": "Lahan Pertanian",
    "penjelas":
        "Lahan pertanian adalah lahan yang ditujukan atau cocok untuk dijadikan lahan usaha tani untuk memproduksi tanaman pertanian maupun hewan ternak.",
    "image": "assets/images/sawah1.png",
    "sumber": "id.wikipedia.org",
    "url": "id.wikipedia.org",
  },
  {
    "title": "Lahan Pertanian",
    "penjelas":
        "Lahan pertanian adalah lahan yang ditujukan atau cocok untuk dijadikan lahan usaha tani untuk memproduksi tanaman pertanian maupun hewan ternak.",
    "image": "assets/images/sawah1.png",
    "sumber": "id.wikipedia.org",
    "url": "id.wikipedia.org",
  },
  {
    "title": "Lahan Pertanian",
    "penjelas":
        "Lahan pertanian adalah lahan yang ditujukan atau cocok untuk dijadikan lahan usaha tani untuk memproduksi tanaman pertanian maupun hewan ternak.",
    "image": "assets/images/sawah1.png",
    "sumber": "id.wikipedia.org",
    "url": "id.wikipedia.org",
  },
];
