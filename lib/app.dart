import 'package:flutter/material.dart';

import 'package:tf_responsive/tf_responsive.dart';

import 'resources/themes.dart';
import 'screens/login/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TfResponsiveBuilder(builder: (context, deviceType, orientation) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: Themes.primaryLightTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      );
    });
  }
}
