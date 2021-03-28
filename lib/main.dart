import 'package:demo_user/modules/user/app/ui/list_user/list_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'injector.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  setupEasyLoading();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) => FlutterEasyLoading(child: child),
      title: 'Flutter Demo',
      home: ListUserPage(),
    );
  }
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.red
    ..progressColor = Colors.redAccent
    ..userInteractions = false
    ..textColor = Colors.black;
}
