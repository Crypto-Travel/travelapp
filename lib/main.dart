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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/564x/35/66/1a/35661a62490f0f974f334bfe3fbefd08.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 50,
                ),
                Text(
                  "It's a Big World",
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Out There,\nGo Explore",
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 300,
            ),
            Center(
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
                      left: 120,
                      right: 120,
                      top: 25,
                      bottom: 25,
                    ),
                  ),
                ),
                onPressed: () {
                  debugPrint("Prova");
                },
                child: const Text("sasd"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
