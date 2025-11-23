

import 'package:flutter/material.dart';
import 'widgets/custom_title.dart';
import 'widgets/custom_counter.dart';
import 'widgets/animated_container_box.dart';
import 'widgets/animated_logo.dart';
import 'widgets/gesture_demo.dart';
import 'widgets/animated_list_demo.dart';

void main() => runApp(const LabApp());

class LabApp extends StatefulWidget {
  const LabApp({Key? key}) : super(key: key);

  @override
  State<LabApp> createState() => _LabAppState();
}

class _LabAppState extends State<LabApp> {
  ThemeMode _mode = ThemeMode.light;

  void _toggleTheme(bool dark) {
    setState(() => _mode = dark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming Lab 9',
      themeMode: _mode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: HomePage(
        isDark: _mode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDark;

  const HomePage({
    Key? key,
    required this.onThemeChanged,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 9 — Advanced UI & Animations'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(value: isDark, onChanged: onThemeChanged),
              const Icon(Icons.dark_mode),
            ],
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTitle(text: 'Welcome to Lab 9', color: Colors.indigo),
              const SizedBox(height: 12),

              // Task 1
              const CustomTitle(text: 'Task 1 — Widgets Layout', color: Colors.teal),
              const SizedBox(height: 8),
              _BoxesLayout(),
              const SizedBox(height: 16),

              // Task 4
              const CustomTitle(text: 'Task 4 — Counter', color: Colors.orange),
              const SizedBox(height: 8),
              const CustomCounter(),
              const SizedBox(height: 16),

              // Task 5
              const CustomTitle(text: 'Task 5 — AnimatedContainer', color: Colors.purple),
              const SizedBox(height: 8),
              const AnimatedContainerBox(),
              const SizedBox(height: 16),

              // Task 6
              const CustomTitle(text: 'Task 6 — Explicit Animation', color: Colors.blue),
              const SizedBox(height: 8),
              const AnimatedLogoWidget(),
              const SizedBox(height: 16),

              // Task 7
              const CustomTitle(text: 'Task 7 — GestureDetector', color: Colors.green),
              const SizedBox(height: 8),
              const GestureDemo(),
              const SizedBox(height: 16),

              // Task 9
              const CustomTitle(text: 'Task 9 — AnimatedList', color: Colors.brown),
              const SizedBox(height: 8),
              const AnimatedListDemo(),
              const SizedBox(height: 24),

              const CustomTitle(text: 'Task 10 — Combined UI (You did it!)', color: Colors.indigo),
              const SizedBox(height: 8),
              const Text('This page combines all custom widgets, gestures, themes, and animations.'),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoxesLayout extends StatelessWidget {
  const _BoxesLayout();

  Widget _box(Color c, String label, {double size = 60}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 4)
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _box(Colors.red, 'A'),
              _box(Colors.blue, 'B'),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _box(Colors.green, 'C', size: 80),
              _box(Colors.orange, 'D', size: 80),
              _box(Colors.purple, 'E', size: 80),
            ],
          ),
        ],
      ),
    );
  }
}
