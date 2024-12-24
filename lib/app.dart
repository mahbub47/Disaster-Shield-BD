import 'package:disaster_shield_bd/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'utils/themes/custom_themes/text_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }
  void initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DappTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("Disaster Shield BD", style: DTextTheme.lightTextTheme.bodyMedium),
        ),
      ),
    );
  }
}