import 'package:flutter/material.dart';
import 'package:travelapp/pages/home_screen.dart';
import 'package:travelapp/utilities/colors.dart';

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
            image: AssetImage(
                'assets/images/welcomePage.jpg'), //loading più veloce
            fit: BoxFit.cover,
            //cover è il metodo giusto per coprire lo schermo completamentre,
            // BoxFit lasciava delle strisce bianche ai bordi del mio sim
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
              child: InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                },
                child: Container(
                  height: 55,
                  width: 370,
                  decoration: BoxDecoration(
                      color: kWhiteClr,
                      borderRadius: BorderRadius.circular(300)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/Google.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Continua con Google",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //     body: Stack(children: [
    //   Image.asset(
    //     "assets/images/welcomePage.jpg",
    //     fit: BoxFit.cover,
    //     height: double.infinity,
    //     width: double.infinity,
    //   ),
    //   SafeArea(
    //       child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 100,
    //       ),
    //       Row(
    //         children: const [
    //           SizedBox(
    //             width: 50,
    //           ),
    //           Text(
    //             "It's a Big World",
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontStyle: FontStyle.normal,
    //             ),
    //           ),
    //         ],
    //       ),
    //       Row(
    //         children: const [
    //           SizedBox(
    //             width: 50,
    //           ),
    //           Text(
    //             "Out There,\nGo Explore",
    //             style: TextStyle(
    //               fontSize: 50,
    //               fontStyle: FontStyle.normal,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //       Spacer(),

    //       //login buttons
    //       InkWell(
    //         onTap: () => {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => HomeScreen()))
    //         },
    //         child: Container(
    //           height: 55,
    //           width: 370,
    //           decoration: BoxDecoration(
    //               color: kWhiteClr, borderRadius: BorderRadius.circular(300)),
    //           child:
    //               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //             Image.asset(
    //               "assets/icons/Google.png",
    //               height: 30,
    //               width: 30,
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             const Text(
    //               "Continua con Google",
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    //             )
    //           ]),
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       InkWell(
    //         onTap: () => {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => HomeScreen()))
    //         },
    //         child: Container(
    //           height: 55,
    //           width: 370,
    //           decoration: BoxDecoration(
    //               color: kWhiteClr, borderRadius: BorderRadius.circular(100)),
    //           child:
    //               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //             Image.asset(
    //               "assets/icons/facebook.png",
    //               height: 30,
    //               width: 30,
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             const Text(
    //               "Continua con Facebook",
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    //             )
    //           ]),
    //         ),
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.1,
    //       ),
    //     ],
    //   ))
    // ]));
  }
}
