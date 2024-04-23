import 'package:binance/View/navigation/navBar.dart';
import 'package:binance/login/login.dart';
import 'package:binance/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 400,
                width: 400,
                child: Lottie.asset(
                  'assets/image/bit.json',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "The Forthcoming Era",
                      style: GoogleFonts.montserrat(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                           fontStyle: FontStyle.italic,
                          color: Colors.grey),
                    ),
                    Text(
                      "Delve deeper into the world of",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                           fontStyle: FontStyle.italic,
                          color: Colors.grey),
                    ),
                    Text(' cryptocurrency by referring',
                     style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                           fontStyle: FontStyle.italic,
                          color: Colors.grey),),
                    Text(
                      'to the future in Crypto...',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                           fontStyle: FontStyle.italic,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBar()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: RColor.secondary,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: myWidth * 0.05,
                          vertical: myHeight * 0.013),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(LoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'START TRADING  ',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                     fontStyle: FontStyle.italic,
                                    color: RColor.secondary,
                                  ),
                                ),
                                RotationTransition(
                                  turns: AlwaysStoppedAnimation(310 / 360),
                                  child: Icon(Icons.arrow_forward_rounded,color: RColor.secondary,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
