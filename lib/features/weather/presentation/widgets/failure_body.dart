import 'package:flutter/material.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({super.key, required this.errMsg});
  final String errMsg;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMsg,
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }
}
