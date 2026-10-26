import 'package:flutter/material.dart';
import 'package:bmr/components/custom_card.dart';
import 'package:bmr/components/bottom_button.dart';
import 'package:bmr/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.bmr,
    required this.information,
    required this.calorieNeeds,
  });

  final String bmr; // hasil BMR (kcal/hari)
  final String information; // teks penjelasan
  final Map<String, String> calorieNeeds; // nama aktivitas -> kalori harian

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Judul "Your Result"
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Kartu hasil
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              // ListView supaya isi bisa di-scroll jika layar kecil
              cardChild: ListView(
                padding: const EdgeInsets.all(15.0),
                children: [
                  const Center(
                    child: Text(
                      'BMR',
                      style: resultTextStyle,
                    ),
                  ),
                  // Angka BMR dan satuannya
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        bmr,
                        style: bmrTextStyle,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'kcal/hari',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  // Teks penjelasan
                  Text(
                    information,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const Divider(
                    height: 30.0,
                    color: Color(0xFF8D8E98),
                  ),
                  const Text(
                    'Kebutuhan kalori harian',
                    textAlign: TextAlign.center,
                    style: labelTextStyle,
                  ),
                  const SizedBox(height: 10.0),
                  // Menampilkan satu baris untuk setiap tingkat aktivitas
                  ...calorieNeeds.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              entry.key,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ),
                          Text(
                            '${entry.value} kcal',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF24D876),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tombol untuk kembali ke halaman input
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              // pop() menutup halaman hasil dan kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}