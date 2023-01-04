import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Text('Ciao Piero'),
            ),
            const Padding(
              padding: EdgeInsets.only(),
              child: Text('Ready for a new experience?'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Find a new place'),
            ),
          ],
        ),
      ),
    );
  }
}
