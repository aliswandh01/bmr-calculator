import 'constants.dart';

class Calculator {
  // Constructor: data input dikirim dari halaman input
  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height; // tinggi badan (cm)
  final int weight; // berat badan (kg)
  final int age; // umur (tahun)
  final Gender gender; // jenis kelamin

  // Menyimpan hasil BMR agar bisa dipakai method lain
  double _bmr = 0.0;

  // Menghitung BMR sesuai gender, lalu mengembalikannya dalam bentuk String
  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    // round() membulatkan ke bilangan bulat terdekat
    return _bmr.round().toString();
  }

  // Menghitung kebutuhan kalori harian berdasarkan faktor aktivitas
  String getCalorieNeed(double activityFactor) {
    return (_bmr * activityFactor).round().toString();
  }

  // Teks penjelasan yang ditampilkan di halaman hasil
  String getInterpretation() {
    return 'Tubuhmu membakar sekitar ${_bmr.round()} kalori per hari '
        'saat istirahat total. Kebutuhan kalori harianmu bergantung '
        'pada tingkat aktivitas.';
  }
}