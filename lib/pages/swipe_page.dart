import 'package:flutter/material.dart';
import 'package:travelapp/utilities/swipe_card.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              height: 300,
              width: 200,
              color: Colors.grey,
              child: Stack(
                children: [
                  SwipeCard(
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
