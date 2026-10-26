import 'package:flutter/material.dart';

// Warna kartu: aktif (terpilih) dan tidak aktif
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

// Ukuran dan warna tombol di bagian bawah layar
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

// Tipe data enum: variabel bertipe Gender hanya bisa bernilai male atau female
enum Gender {
  male,
  female,
}

// Gaya teks label (HEIGHT, WEIGHT, AGE, dll)
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

// Gaya teks angka pada kartu input
const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

// Gaya teks tombol bawah
const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

// Gaya teks judul hasil (tulisan "BMR")
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Gaya teks angka hasil BMR
const bmrTextStyle = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.bold,
);

// Daftar tingkat aktivitas beserta faktor pengali kalorinya.
// Kebutuhan kalori harian = BMR x faktor aktivitas.
const activityLevels = {
  'Sedentary (sedikit/tanpa olahraga)': 1.2,
  'Light (olahraga 1-3 hari/minggu)': 1.375,
  'Moderate (olahraga 3-5 hari/minggu)': 1.55,
  'Active (olahraga 6-7 hari/minggu)': 1.725,
  'Very active (olahraga berat/2x sehari)': 1.9,
};