import 'package:binance/View/Search/search_icon_detail_page.dart';
import 'package:binance/View/Search/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool isRefreshing = true;
  List? coinMarket = [];
  List<dynamic> filteredCoins = [];
  @override
  void initState() {
    super.initState();
    getCoinMarket();
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
            colors: [Colors.amber, Colors.amber],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
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
                      offset: Offset(0, 3),
                    )
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
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
                          Expanded(
                            child: Container(
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: TextField(
                                controller: _searchController,
                                onChanged: (value) {
                                  filterCoins(value);
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Search',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Iconsax.search_favorite,
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
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
                                period: Duration(milliseconds: 800),
                                child: Row(
                                  children: List.generate(
                                    2, // Number of Expanded widgets
                                    (index) => Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: List.generate(
                                            5, // Number of cards in each column
                                            (index) => Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 70,
                                                  width: 200,
                                                  child: Card(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : filteredCoins.isEmpty
                                ? Center(
                                    child: Lottie.asset("assets/image/1.json")
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        (filteredCoins.length / 2).ceil(),
                                    itemBuilder: (context, index) {
                                      final int startIndex = index * 2;
                                      final Map<String, dynamic> item1 =
                                          filteredCoins[startIndex];
                                      Map<String, dynamic>? item2; // Nullable
                                      if (startIndex + 1 <
                                          filteredCoins.length) {
                                        item2 = filteredCoins[startIndex + 1];
                                      }

                                      return Item3(
                                        item1: item1,
                                        item2: item2,
                                        textColor: Colors.blue,
                                        onTap1: () {
                                          navigateToCoinDetail(context, item1);
                                        },
                                        onTap2: item2 != null
                                            ? () => navigateToCoinDetail(
                                                context, item2!)
                                            : null,
                                      );
                                    },
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

  Future<void> getCoinMarket() async {
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
      var coinMarketList = jsonDecode(x);
      setState(() {
        coinMarket = coinMarketList;
        filteredCoins = List.from(coinMarket!);
      });
    } else {
      print(response.statusCode);
    }
  }

  void filterCoins(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCoins = coinMarket!.where((coin) {
          return coin['id']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      } else {
        filteredCoins = List.from(coinMarket!);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void navigateToCoinDetail(BuildContext context, dynamic item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoinDetailPage(
          coinData: item,
        ),
      ),
    );
  }
}
