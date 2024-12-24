import 'package:disaster_shield_bd/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'utils/themes/custom_themes/text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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