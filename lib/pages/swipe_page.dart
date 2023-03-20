import 'package:flutter/material.dart';
import 'package:travelapp/widgets/swipe_card.dart';

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
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  SwipeCard(
                    color: Colors.deepPurple,
                    text: "Caldo\no freddo?",
                  ),
                  SwipeCard(
                    color: Colors.yellow,
                    text: "Meglio in italia\no all'estero?",
                  ),
                  SwipeCard(
                    color: Colors.green,
                    text: "Preferisci il mare\no la montagna?",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
