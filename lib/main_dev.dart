import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget app = await initializeApp(CurrentAppFlavor.useDevFlavor());
  await init();
  runApp(app);
}

Future<Widget> initializeApp(AppFlavor devAppConfig) async {
  return Future.value(MyApp(devAppConfig));
}
