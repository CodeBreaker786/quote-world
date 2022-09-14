<<<<<<< HEAD
 
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
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/blocs/search_bloc/search_bloc.dart';
import 'package:quotes_app/screens/home/home_screen.dart';
import 'package:quotes_app/screens/quotes/bloc/quotes_bloc.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuotesBloc>(
            create: (BuildContext context) => QuotesBloc(quotes: [])),
        BlocProvider<SearchBloc>(
            create: (BuildContext context) => SearchBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
>>>>>>> 51fe6d4 (first commit)
    );
  }
}
