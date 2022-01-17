 
import 'package:flutter/material.dart';
import 'package:quoteworld/screens/bottom_navigation_pade.dart';
import 'package:quoteworld/utils/admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids
  // Admob.initialize(testDeviceIds: [AdManager.appId]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey, accentColor: Colors.white),
      title: 'Flutter Demo',
      home: NavigationScreen(),
    );
  }
}
