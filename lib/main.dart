import 'package:clean_architecture_sample_code/presentation/screens/sample_screen.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {


  late final AppFlavor _appFlavor;
  MyApp(this._appFlavor);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appFlavor.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleScreen(_appFlavor.appName),
    );
  }
}
