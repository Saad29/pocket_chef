import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_chef/screens/login_screen.dart';

import 'screens/mode_selection.dart';
import 'screens/chef_profile.dart';

void main() {
  runApp(PouchApp());
}

class PouchApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/mode': (context) => ModeSelectionPage(),
        '/profile': (context) => ChefProfilePage()
      },
    );
  }
}
