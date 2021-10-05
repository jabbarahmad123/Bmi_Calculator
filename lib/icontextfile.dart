import 'package:bmi_calculator/constantfile.dart';
import 'package:flutter/material.dart';
import 'constantfile.dart';

class repeaticontext extends StatelessWidget {
  repeaticontext({@required this.iconData, this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 70.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: klabelstyle,
        )
      ],
    );
  }
}
