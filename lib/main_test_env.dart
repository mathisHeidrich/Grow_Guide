import 'package:flutter/material.dart';
import 'testing/scenario_launcher_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MaterialApp(
      title: 'Grow Guide - Test Env',
      theme: ThemeData.dark(),
      home: const ScenarioLauncherScreen(),
    ),
  );
}
