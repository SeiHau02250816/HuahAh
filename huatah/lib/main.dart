import 'package:flutter/material.dart';
import 'package:huatah/models/spend_insight.dart';
import 'package:huatah/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpendInsight(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Huah Ahh',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
