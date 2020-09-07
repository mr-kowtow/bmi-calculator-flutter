import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 160;
  int weight = 65;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress:(){setState(() {selectedGender = Gender.male;});},
                        colour: selectedGender == Gender.male ? kActiveCardColour:kInactiveCardColour,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                        )
                    ),
                    Expanded(
                        child: ReusableCard(
                          onPress:(){setState(() {selectedGender = Gender.female;});},
                          colour: selectedGender == Gender.female ? kActiveCardColour:kInactiveCardColour,
                          cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                        )
                    ),
                  ],
                )
            ),
            Expanded(child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height', style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style: kNumberTextStyle),
                        Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }
                      ),
                    )
                  ],
                ),
              )
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text('Weight', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){setState(() {weight--;});}
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){setState(() {weight++;});}
                              ),
                            ],
                          )
                      ]),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Age', style: kLabelTextStyle,),
                            Text(age.toString(), style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){setState(() {age--;});}
                                ),
                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){setState(() {age++;});}
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: KBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBbottomContainerHeight,
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}



