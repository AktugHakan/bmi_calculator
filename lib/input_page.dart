import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({
    super.key,
  });

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMaleSelected = false;
  double height = 170;
  int weight = 80;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCard(
                    backgroundColor:
                        isMaleSelected ? Color(0xff111328) : Color(0xff1d1f33),
                    touchAction: () {
                      setState(() {
                        isMaleSelected = true;
                      });
                    },
                    child: CardContentIcon(
                      iconData: Icons.male,
                      title: 'MALE',
                    ),
                  ),
                  CustomCard(
                    backgroundColor:
                        isMaleSelected ? Color(0xff1d1f33) : Color(0xff111328),
                    touchAction: () {
                      setState(() {
                        isMaleSelected = false;
                      });
                    },
                    child: CardContentIcon(
                      iconData: Icons.female,
                      title: 'FEMALE',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  CustomCard(
                    backgroundColor: Color(0xff1d1f33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('HEIGHT'),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toInt().toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('CM')
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xffeb1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                              disabledThumbRadius: 10.0,
                            ),
                            activeTrackColor: Color(0xffeb1555),
                            inactiveTrackColor: Color(0xff8d8e98),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                              min: 10,
                              max: 230,
                              divisions: 220,
                              value: height,
                              onChanged: (newVal) {
                                setState(() {
                                  height = newVal;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCard(
                    backgroundColor: Color(0xff1d1f33),
                    child: CardContentNumber(
                      value: weight.toString(),
                      plusAction: () {
                        setState(() {
                          weight++;
                          print(weight);
                        });
                      },
                      minusAction: () {
                        setState(() {
                          weight--;
                        });
                      },
                      title: 'WEIGHT',
                    ),
                  ),
                  CustomCard(
                    backgroundColor: Color(0xff1d1f33),
                    child: CardContentNumber(
                      value: age.toString(),
                      title: 'AGE',
                      plusAction: () {
                        setState(() {
                          age++;
                        });
                      },
                      minusAction: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        result: (weight / (height / 100) * (height / 100))
                            .toStringAsFixed(1),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Theme.of(context).colorScheme.secondary,
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
