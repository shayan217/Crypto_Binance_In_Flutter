import 'package:binance/View/notification/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.grey),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.9),
                child: IconButton(
                  icon: Icon(
                    Iconsax.notification5,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    Get.to(MyApp());
                  },
                ),
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.grey),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 70),
              child: Column(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Container(
                      height: 300,
                      width: 370,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.9),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                              blurStyle: BlurStyle.normal),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/image/shayan.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Shayan Siddique',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Android Developer',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '\$85',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                          'Profit',
                                          style: GoogleFonts.montserrat(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 105,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '\$15',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                          'Loss',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Positioned(
                    top: 370,
                    left: 20,
                    child: Container(
                      height: 70,
                      width: 370,
                      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.grey.withOpacity(0.9),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 0),
          blurStyle: BlurStyle.normal
        ),
      ],
    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 8, right: 8, left: 8),
                            child: Text(
                              'Total Balance:      \$ 75,329',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Positioned(
                    top: 444,
                    left: 20,
                    child: Container(
                      height: 210,
                      width: 370,
                      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.grey.withOpacity(0.9),
        width: 1, // Border width
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 0),
          blurStyle: BlurStyle.normal
        ),
      ],
    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8, top: 22),
                            child: Text(
                              'About Me',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: Text(
                              'I am a fervent Web Designer, Photography, Web Developer, Mobile App Developer. My unique approach revolves around transforming each project into a narrative, skillfully curating an immersive and visually captivating experience.',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Positioned(
                    top: 600,
                    left: 20,
                    child: Container(
                      height: 227,
                      width: 370,
                      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.grey.withOpacity(0.9),
        width: 1, // Border width
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 0),
          blurStyle: BlurStyle.normal
        ),
      ],
    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 22, right: 8, left: 8, bottom: 8),
                            child: Text(
                              'Contact',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 8, right: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors
                                      .white, // Set background color to white
                                  child: Icon(
                                    Iconsax.call5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '+92-316-203-6763',
                                  style: GoogleFonts.montserrat(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 8, right: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors
                                      .white, // Set background color to white
                                  child: Icon(
                                    Iconsax.message5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'shayanchannel721@gmail.com',
                                  style: GoogleFonts.montserrat(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 8, right: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors
                                      .white, // Set background color to white
                                  child: Icon(
                                    Iconsax.house_25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Pakistan, Karachi',
                                  style: GoogleFonts.montserrat(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomShapeClipper oldClipper) {
    return false;
  }
}