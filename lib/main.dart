import 'package:archonit_crypto_app/core/routing/routing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archonit Crypto App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: RoutePath.splash,
      onGenerateRoute: Routing.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
