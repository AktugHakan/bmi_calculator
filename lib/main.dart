import 'package:bmi_calculator/styling.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

// appbar = #0a0d22
// bg = #0a0d22
// gender_sel = #1d1f33
// other sel = #111428
// knob/calc buton = #eb1555
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme(context),
      home: InputPage(),
    );
  }
}
