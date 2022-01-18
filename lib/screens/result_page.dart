import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import '../components/reusablecontent.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResultl,@required this.interpretation,@required this.resultText});

  final String bmiResultl;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment:  Alignment.center,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseContaner(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResultl,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
              BottomButton(buttonTitle: 'RE-CALCULATE',
                onTap: (){
                Navigator.pop(context);
                },
              )
        ],
      ),
    );
  }
}
