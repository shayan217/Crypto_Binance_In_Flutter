import 'package:binance/View/Search/customecliper.dart';
import 'package:binance/View/home/customecliper.dart';
import 'package:binance/View/secondpage/customecliper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTopBar extends StatelessWidget {
  const SecondTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 250.0,
            width: 600.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: myHeight * 0.03),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/image/shayan.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 39),
                            child: Text(
                              'Crypto Mining...',
                              style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Shayan Siddique',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white 
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ 75,329',
                        style: GoogleFonts.montserrat(fontSize: 35, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.03,
                            vertical: myHeight * 0.005),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'COINS',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.09),
                  child: Row(
                    children: [
                      Text(
                        '+162% all time',
                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      clipper: SecondCustomClipper(),
    );
  }
}
