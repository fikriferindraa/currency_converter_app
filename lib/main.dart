import 'dart:async';
import 'package:flutter/material.dart';
import 'infinitepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter Currency App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const InfinitePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/infinite_logo.png', scale: 2),
            const SizedBox(
              height: 30,
            ),
            const Text("INFINITE",
                style: TextStyle(
                    color: Colors.white, fontSize: 40, fontFamily: "Redhat")),
            const Text("CONVERTER CURRENCY",
                style: TextStyle(color: Colors.white, fontFamily: "Redhat")),
          ],
        )));
  }
}
