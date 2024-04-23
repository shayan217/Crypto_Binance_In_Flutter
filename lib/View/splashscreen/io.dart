import 'dart:async';
import 'package:binance/View/splashscreen/splash.dart';
import 'package:binance/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class IO extends StatefulWidget {
  const IO({Key? key}) : super(key: key);
  @override
  State<IO> createState() => _IOState();
}

class _IOState extends State<IO> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.amber,
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          height: myHeight,
          width: myWidth,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                Center(
                  child: Image.asset(
                    'assets/image/splashscreen.png',
                  ),
                ),
                SizedBox(height: 80,),
                Center(child: Text('Currency Exchange',
                style: GoogleFonts.montserrat(fontSize: 40,
                 fontWeight: FontWeight.bold,
                 fontStyle: FontStyle.italic)
                 )
                 ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Created by Shayan Siddique',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        SizedBox(
                          width: myWidth * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myHeight * 0.005,
                    ),
                    Image.asset(
                      'assets/image/loading1.gif',
                      height: myHeight * 0.015,
                      color: Colors.black,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
