import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/home_page/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // Agar sesuai dengan Device Preview
      locale: DevicePreview.locale(context), // Locale dari Device Preview
      builder: DevicePreview.appBuilder, // Builder untuk Device Preview
      home: const HomePage(),
    );
  }
}
