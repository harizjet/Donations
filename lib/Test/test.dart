import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Image.asset('assets/Test.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }
}
