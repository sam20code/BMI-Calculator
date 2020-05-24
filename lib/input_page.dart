import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';
import 'round_iconbutton.dart';
import 'bottom_button.dart';

enum Gender{
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight=60;
  int ageNumber=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Expanded(child: Row(
               children: <Widget>[
                 Expanded(child: Reusable(
                   onpress: (){
                     setState(() {
                       selectedGender = Gender.Male;
                     });
                   },
                     colour:selectedGender==Gender.Male ? kActiveColour : kInactiveColour,
                     cardchild: IconContent(label: 'Male', icon: FontAwesomeIcons.mars,),
                 ),
                 ),
                 Expanded(child: Reusable(
                   onpress: (){
                     setState(() {
                       selectedGender=Gender.Female;
                     });
                   },

                   colour: selectedGender == Gender.Female ? kActiveColour : kInactiveColour,
                 cardchild: IconContent(label: 'Female',icon: FontAwesomeIcons.venus),
                 ),
                 ),
               ],
             ),
             ),
             Expanded(child:Reusable(
               colour: kActiveColour,
               cardchild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('Height' , style: kLabelTextStyle),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: <Widget>[
                       Text(height.toString(),
                         style: kTextstyle,
                       ),
                       Text('cm' , style: kTextstyle),
                     ],
                   ),
                   SliderTheme(
                     data : SliderTheme.of(context).copyWith(
                       activeTrackColor: Colors.white,
                       thumbColor: Color(0xFFEB1555),
                       overlayColor: Color(0x29EB1555),
                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),

                       overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                     ),
                     child: Slider(
                       value: height.toDouble(),
                       min: 120.0,
                       max: 220.0,
                       inactiveColor: Color(0xFF8D8E98),
                       onChanged: (double newValue){
                         setState(() {
                           height= newValue.round();
                         });
                       },
                     ),
                   )
                 ],
               ),
             ),
             ),
             Expanded(child: Row(
               children: <Widget>[
                 Expanded(child: Reusable(colour: kActiveColour,
                 cardchild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text('Weight',
                     style: kLabelTextStyle,
                     ),
                     Text(
                       weight.toString(),
                       style: kTextstyle,
                     ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                         onPressed: (){
                            setState(() {
                              weight--;
                            });
                         },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                       RoundIconButton(
                           icon: FontAwesomeIcons.plus,
                       onPressed: (){
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
                 Expanded(child: Reusable(colour: kActiveColour,
                   cardchild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                     Text('Age',style: kLabelTextStyle,),
                   Text(ageNumber.toString(),style: kTextstyle,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RoundIconButton(
                         icon: FontAwesomeIcons.minus,
                         onPressed: (){
                           setState(() {
                             ageNumber--;
                           });
                         },
                       ),
                       RoundIconButton(
                         icon: FontAwesomeIcons.plus,
                         onPressed: (){
                           setState(() {
                             ageNumber++;
                           });
                         },
                       )
                     ],
                   ),
                   ],
                 ),
                 ),
                 ),
               ],
             ),
             ),
             BottomButton(
               buttonTitle: 'CALCULATE',
               onTap: () {
                 CalculatorBrain calc =
                 CalculatorBrain(height: height, weight: weight);

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => ResultsPage(
                       bmiResult: calc.calculateBMI(),
                       resultText: calc.getResult(),
                       interpretation: calc.getInterpretation(),
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


