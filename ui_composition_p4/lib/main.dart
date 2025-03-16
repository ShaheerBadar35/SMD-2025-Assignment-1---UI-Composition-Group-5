import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ui_composition_p4/screens/chat/chat_screen.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}
