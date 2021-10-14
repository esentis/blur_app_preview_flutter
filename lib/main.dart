import 'dart:ui';

import 'package:blur_app_preview/lifecycle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blur app preview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Blur app preview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool shouldBlur = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: const TextStyle(fontSize: 40),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        if (shouldBlur)
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7.0,
              sigmaY: 7.0,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        AppLifecycleReactor(
          onStateChange: (state) {
            if (state == AppLifecycleState.inactive) {
              setState(() {
                shouldBlur = true;
              });
            } else if (state == AppLifecycleState.resumed) {
              setState(() {
                shouldBlur = false;
              });
            }
          },
        )
      ],
    );
  }
}
