import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconcontent.dart';
import '../components/reusablecontent.dart';
import '../constant.dart';
import '../components/bottom_button.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculatebrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;

  // Color maleCardColor = InactiveColor;
  // Color femaleCardColor = InactiveColor;
  //
  //
  // void updateColor(Gender selectGender){
  //   if(selectGender == Gender.male ){
  //     if(maleCardColor == InactiveColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = InactiveColor;
  //     }
  //     else{
  //       maleCardColor = InactiveColor;
  //     }
  //   }
  //
  //   if(selectGender == Gender.female){
  //     if(femaleCardColor == InactiveColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = InactiveColor;
  //
  //     }
  //     else{
  //       femaleCardColor = InactiveColor;
  //     }
  //   }
  // }
int height = 180;
int weight = 60;
int age = 18;



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuseContaner(
                  onPress: () {
                    setState(() {
                      selectGender = Gender.male;
                    });
                  },
                  colour: selectGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveColor,
                  cardChild: Reusecardchild(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                )),
                Expanded(
                    child: ReuseContaner(
                  onPress: () {
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                  colour: selectGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveColor,
                  cardChild: Reusecardchild(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReuseContaner(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(),
                            style: kNumberStyle,),
                            Text('cm',
                              style:kLabelTextStyle,
                            )
                          ],

                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xffeb1555),
                          inactiveColor: Colors.white,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },


                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuseContaner(
                        colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // FloatingActionButton(
                            //   backgroundColor: Color(0xff4c4f5e),
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Colors.white,
                            //   ),
                            //
                            // ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },

                            ),
                            SizedBox(
                              width: 10.0,
                            ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xff4c4f5e),
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Colors.white,
                            //   ),
                            //
                            // ),
                          ],
                        )

                      ],

                      ),
                    ),


                ),
                Expanded(
                    child: ReuseContaner(

                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              // FloatingActionButton(
                              //   backgroundColor: Color(0xff4c4f5e),
                              //   child: Icon(
                              //     Icons.add,
                              //     color: Colors.white,
                              //   ),
                              //
                              // ),

                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },

                              ),
                              SizedBox(
                                width: 10.0,
                              ),

                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              // FloatingActionButton(
                              //   backgroundColor: Color(0xff4c4f5e),
                              //   child: Icon(
                              //     Icons.add,
                              //     color: Colors.white,
                              //   ),
                              //
                              // ),
                            ],
                          )

                        ],

                      ),

                    ))
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResultl: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),

                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

    final IconData icon;
    final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xffCDDC39),
    );
  }
}
