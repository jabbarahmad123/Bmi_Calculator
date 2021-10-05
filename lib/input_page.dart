import 'dart:ffi';

import 'package:bmi_calculator/constantfile.dart';
import 'package:bmi_calculator/resultfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'containerfile.dart';
import 'icontextfile.dart';
import 'constantfile.dart';
import 'calculatorbrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectgender;
  int sliderheight = 180;
  int sliderweight = 50;
  int sliderage = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: repeatcontainer(
                    onPressed: () {
                      setState(() {
                        selectgender = Gender.male;
                      });
                    },
                    colors: selectgender == Gender.male
                        ? activecolor
                        : deactivecolor,
                    cardwidget: repeaticontext(
                      iconData: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: repeatcontainer(
                    onPressed: () {
                      setState(() {
                        selectgender = Gender.female;
                      });
                    },
                    colors: selectgender == Gender.female
                        ? activecolor
                        : deactivecolor,
                    cardwidget: repeaticontext(
                      iconData: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: repeatcontainer(
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: klabelstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sliderheight.toString(),
                              style: knumberstyle,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'cm',
                              style: klabelstyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: sliderheight.toDouble(),
                          min: 80,
                          max: 300,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue) {
                            setState(() {
                              sliderheight = newvalue.round();
                            });
                          },
                        ),
                      ],
                    ),
                    colors: Color(0XFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: repeatcontainer(
                    colors: Color(0XFF1D1E33),
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelstyle,
                        ),
                        Text(
                          sliderweight.toString(),
                          style: knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Round(
                              iconData: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  sliderweight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Round(
                              iconData: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  sliderweight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: repeatcontainer(
                    colors: Color(0XFF1D1E33),
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelstyle,
                        ),
                        Text(
                          sliderage.toString(),
                          style: knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Round(
                              iconData: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  sliderage--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Round(
                              iconData: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  sliderage++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculatorbrain clc =
                  calculatorbrain(height: sliderheight, weight: sliderweight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => result(
                            bmiresult: clc.calculatebmi(),
                            interpretation: clc.getresult(),
                            resulttext: clc.getinterpretation(),
                          )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: klargestyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Round extends StatelessWidget {
  Round({@required this.iconData, @required this.onpress});
  final IconData iconData;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
