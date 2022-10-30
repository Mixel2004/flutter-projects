import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator.dart';
import '../components/bottom_button.dart';
import '../components/card.dart';
import '../components/gender.dart';
import '../components/round_button.dart';
import '../constants.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveContainerColor;
  Color femaleCardColor = kInactiveContainerColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardInfo(
                    colour: maleCardColor,
                    cardChild: const GenderIcon(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                    onPress: () {
                      setState(() {
                        maleCardColor = kActiveContainerColor;
                        femaleCardColor = kInactiveContainerColor;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CardInfo(
                    colour: femaleCardColor,
                    cardChild: const GenderIcon(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                    onPress: () {
                      setState(() {
                        femaleCardColor = kActiveContainerColor;
                        maleCardColor = kInactiveContainerColor;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardInfo(
              colour: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "HEIGHT",
                      style: kTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardInfo(
                    colour: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Center(
                          child: Text('WEIGHT', style: kTextStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kNumberStyle),
                            const Text('kg', style: kTextStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardInfo(
                    colour: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Center(
                          child: Text('AGE', style: kTextStyle),
                        ),
                        Center(
                          child: Text(age.toString(), style: kNumberStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Calculator data = Calculator(height: height, weight: weight);
              data.calculateBMI();
              final String result = data.getResult();
              final Color resultColor;
              if (result == "Underweight") {
                resultColor = Colors.yellow;
              } else if (result == "Normal") {
                resultColor = Colors.green;
              } else if (result == "Overweight") {
                resultColor = Colors.orange;
              } else {
                resultColor = Colors.red;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  calc: data,
                  resultColor: resultColor,
                );
              }));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
