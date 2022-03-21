import 'package:flutter/material.dart';

class TestWidgetHere extends StatelessWidget {
  final String? name;
  const TestWidgetHere(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(name ?? ""));
  }
}
