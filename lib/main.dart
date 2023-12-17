import 'package:flutter/material.dart';
import 'package:mp_task_9/screen/timer_home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengatur Waktu Produktivitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        body: Center(
          child: TimerHomePage(),
        ),
      ),
    );
  }
}
