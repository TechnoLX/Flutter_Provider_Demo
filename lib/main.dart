import 'package:flutter/material.dart';
import 'package:flutter_video/demoModel.dart';
import 'package:provider/provider.dart';
import 'demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

//Advanced Flutter UI EP17: State Management (Part 2)
//Welcome back, today topic is Provider

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DemoModel>(
      create: (_) => DemoModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //create a new class for this
        home: Demo(),
      ),
    );
  }
}
