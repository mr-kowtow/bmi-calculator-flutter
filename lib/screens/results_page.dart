import 'package:bmi_calculator/constants.dart';
import 'file:///C:/Users/jhagroshan/AndroidStudioProjects/bmi-calculator-flutter/lib/component/reusable_card.dart';
import 'package:flutter/material.dart';
import '../component/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Text("Your Result", style: kTitleTextStyle,)
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Normal', style: kResultTextStyle,),
                  Text('18.3', style: kBMITextStyle,),
                  Text('Your BMI result is quite low, you should eat more!', style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
                ),
            ),

          )
        ],
      ),
    );
  }
}
