import 'package:bmi_calculator/constantfile.dart';
import 'package:bmi_calculator/containerfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constantfile.dart';
import 'input_page.dart';

class result extends StatelessWidget {
  @override
  result(
      {@required this.bmiresult,
      @required this.interpretation,
      @required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'YOUR RESULT',
                  style: ktitlestyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: repeatcontainer(
              colors: activecolor,
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext,
                    style: kresultstyle,
                  ),
                  Text(
                    bmiresult,
                    style: kbmitextstyle,
                  ),
                  Text(
                    interpretation,
                    style: kbodytextstyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RECALCULATE',
                    style: klargestyle,
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 12.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
