import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';

// library flutter_custom_dialog;

// import 'package:flutter_custom_dialog_example/dialog/alert_dialog.dart';
// import 'package:flutter_custom_dialog_example/dialog/bottom_sheet_dialog.dart';
// import 'package:flutter_custom_dialog_example/dialog/listview_dialog.dart';
// import 'package:flutter_custom_dialog_example/dialog/progress_dialog.dart';
// import 'package:flutter_custom_dialog_example/dialog/notice_dialog.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

// import 'dialog/develop_dialog.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleInactivecolor = kInacyiveCardColor;
  Color femaleInactivecolor = kInacyiveCardColor;
  Gender? selectedGender;
  int hight = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: kLableTextStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusebleCard(
                  onPerss: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kAcyiveCardColor
                      : kInacyiveCardColor,
                  child: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                )),
                Expanded(
                    child: ReusebleCard(
                  onPerss: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kAcyiveCardColor
                      : kInacyiveCardColor,
                  child: IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusebleCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HIGHT",
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLableTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 1,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1fEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 34)),
                    child: Slider(
                        value: hight.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            hight = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusebleCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLableTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBottom(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            RoundIconBottom(
                              onPressed: () {
                                setState(() {
                                  weight != 0 ? weight-- : weight = 0;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ]),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusebleCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLableTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBottom(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            RoundIconBottom(
                              onPressed: () {
                                setState(() {
                                  age != 0 ? age++ : age = 0;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ]),
                    ],
                  ),
                )),
              ],
            )),
            Container(
              // color: kBottomContianerColor,
              child: GestureDetector(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Color(0xFF1D1E33),
                    // title: const Text(
                    //   'RESULT',
                    //   style: kLableTextStyle
                    // ),
                    content: Row(children: [
                      Text(
                        'Your BMI :',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            color: Colors.white),
                      ),
                      Text('12.3', style: kNumberTextStyle),
                    ]),
                    actions: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Color(0xFFEB1555),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Calculate BMI",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w100,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContianerHight,
              decoration: BoxDecoration(
                  color: kBottomContianerColor,
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ));
  }
}

class RoundIconBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;

  RoundIconBottom({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightForFinite(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 7,
      fillColor: Color(0xFF4C4E5F),
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}
