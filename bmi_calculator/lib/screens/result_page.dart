import 'package:flutter/material.dart';

import '../calculator.dart';
import '../components/bottom_button.dart';
import '../components/card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final Calculator calc;
  final Color resultColor;
  ResultPage({required this.calc, required this.resultColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardInfo(
                colour: kActiveContainerColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      calc.getResult(),
                      style: TextStyle(
                        color: resultColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      calc.calculateBMI(),
                      style: kBMITextStyle,
                    ),
                    Text(
                      calc.getInterpretation(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                    BottomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        buttonTitle: "Re-Calculate")
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
