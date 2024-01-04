import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/data/di/di_setup.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/routes.dart';



void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
