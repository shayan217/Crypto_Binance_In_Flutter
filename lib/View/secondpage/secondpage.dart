import 'package:binance/Model/coinModel.dart';
import 'package:binance/View/secondpage/item2.dart';
import 'package:binance/View/secondpage/topbar.dart';
import 'package:binance/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ));
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.amber,
                Colors.amber,
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SecondTopBar(),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: myHeight * 0.03),
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 15),
              //         child: Container(
              //           padding: EdgeInsets.only(
              //               right:
              //                   8),
              //           child: CircleAvatar(
              //             radius: 35,
              //             backgroundImage: AssetImage(
              //               'assets/image/shayan.jpg',
              //             ),
              //             backgroundColor: Colors
              //                 .transparent,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(right: 39),
              //             child: Text(
              //               'Crypto Mining...',
              //               style: GoogleFonts.montserrat(fontSize: 15),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 10),
              //             child: Text(
              //               'Shayan Siddique',
              //               style: GoogleFonts.montserrat(fontSize: 20,
              //               fontWeight: FontWeight.bold
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         '\$ 6,466.20',
              //         style: GoogleFonts.montserrat(fontSize: 35),
              //       ),
              //       Container(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: myWidth * 0.03,
              //             vertical: myHeight * 0.005),
              //         decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.circular(100)),
              //         child: Text(
              //           'TOP COINS',
              //           style: GoogleFonts.montserrat(fontSize: 18,color: Colors.amber),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              //   child: Row(
              //     children: [
              //       Text(
              //         '+162% all time',
              //         style: GoogleFonts.montserrat(fontSize: 16),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: myHeight * 0.02,
              ),
              Container(
                height: myHeight * 0.7,
                width: myWidth,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          spreadRadius: 3,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: myHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rcommend to Buy',
                            style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: myHeight * 0.02,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: myWidth * 0.03),
                        child: isRefreshing == true
                            ? Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.grey.withOpacity(0.5),
                              enabled: true,
                              period: Duration(
                                  milliseconds:
                                      1000), // Duration of the animation
                              child: ListView.builder(
                                itemCount:
                                    5, // or any number of shimmer lines you want
                                itemBuilder: (_, __) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                    ),
                                    title: Container(
                                      height: 20.0,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    subtitle: Container(
                                      height: 10.0,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : coinMarket == null || coinMarket!.isEmpty
                                ? Center(
                                    child: Lottie.asset("assets/image/1.json")
                                  )
                                : SizedBox(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: coinMarket!.length > 20
                                          ? 20
                                          : coinMarket!.length,
                                      itemBuilder: (context, index) {
                                        return Item2(
                                          item: coinMarket!.reversed
                                              .toList()[index],
                                          textColor: Colors.blue,
                                        );
                                      },
                                    ),
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: myHeight * 0.06,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
