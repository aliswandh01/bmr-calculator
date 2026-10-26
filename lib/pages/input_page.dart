import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmr/components/custom_card.dart';
import 'package:bmr/components/icon_card.dart';
import 'package:bmr/components/bottom_button.dart';
import 'package:bmr/components/round_icon_button.dart';
import 'package:bmr/constants.dart';
import 'package:bmr/calculator.dart';
import 'result_page.dart';

// StatefulWidget karena tampilan berubah mengikuti input pengguna
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Data input beserta nilai awalnya
  Gender selectedGender = Gender.male;
  int height = 160; // cm
  int weight = 60; // kg
  int age = 20; // tahun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== BARIS 1: Pilihan gender =====
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    // Kartu aktif jika gender yang dipilih adalah male
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars.data,
                      caption: 'MALE',
                    ),
                    onPress: () {
                      // setState() memberitahu Flutter untuk menggambar ulang layar
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus.data,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // ===== BARIS 2: Tinggi badan (slider) =====
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  // SliderTheme mengatur tampilan slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        // Simpan nilai slider (dibulatkan) ke variabel height
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===== BARIS 3: Berat badan dan umur =====
          Expanded(
            child: Row(
              children: [
                // --- Kartu WEIGHT ---
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                setState(() {
                                  // Batas minimum berat 30 kg
                                  if (weight > 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // --- Kartu AGE ---
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                setState(() {
                                  // Batas minimum umur 10 tahun
                                  if (age > 10) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== Tombol CALCULATE =====
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // 1. Buat objek Calculator dari data input
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
              );

              // 2. Hitung BMR
              String bmr = cal.calculateBMR();

              // 3. Hitung kebutuhan kalori untuk setiap tingkat aktivitas
              Map<String, String> needs = {};
              activityLevels.forEach((name, factor) {
                needs[name] = cal.getCalorieNeed(factor);
              });

              // 4. Ambil teks penjelasan
              String information = cal.getInterpretation();

              // 5. Pindah ke halaman hasil sambil membawa datanya
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmr: bmr,
                    information: information,
                    calorieNeeds: needs,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}