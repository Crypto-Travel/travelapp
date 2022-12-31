import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/564x/35/66/1a/35661a62490f0f974f334bfe3fbefd08.jpg',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Positioned(
              top: 100,
              width: 237,
              child: Text(
                "It's a Big World",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            const Positioned(
              top: 130,
              child: Text(
                "Out There,\nGo Explore",
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(
                      left: 50,
                      right: 50,
                      top: 20,
                      bottom: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  debugPrint("Prova");
                },
                child: const Text(
                  "Navigate the world!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
