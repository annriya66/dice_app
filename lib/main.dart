import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green.shade900,
        appBar: AppBar(
          title: const Text(
            'Dice Roller',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green.shade900,
          elevation: 0,
          centerTitle: true,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: rollDice,           // Tap anywhere on the die to roll
        child: DiceFace(number: diceNumber),
      ),
    );
  }
}

// Custom Big Square Die
class DiceFace extends StatelessWidget {
  final int number;

  const DiceFace({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,      // Bigger size
      height: 180,
      decoration: BoxDecoration(
        color: Colors.red.shade700,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child: Center(
        child: DiceDots(number: number),
      ),
    );
  }
}

// Dots for each face
class DiceDots extends StatelessWidget {
  final int number;

  const DiceDots({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    const double dotSize = 22.0;
    const Color dotColor = Colors.white;

    switch (number) {
      case 1:
        return const Dot(size: dotSize, color: dotColor);
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
          ],
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Dot()]),
          ],
        );
      case 4:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
          ],
        );
      case 5:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
          ],
        );
      case 6:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Dot(), Dot()]),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}

class Dot extends StatelessWidget {
  final double size;
  final Color color;

  const Dot({super.key, this.size = 22.0, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}