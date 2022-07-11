import 'package:flutter/material.dart';
import 'package:stepper/screen/step_s.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Step_S(),
      },
    ),
  );
}
