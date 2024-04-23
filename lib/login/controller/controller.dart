import 'dart:convert';
import 'package:binance/View/home/home.dart';
import 'package:binance/View/navigation/navBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var loginStatus = false.obs;

  void handleLogin(String riderName, String riderPassword) async {
    try {
      var response = await authenticateUser(riderName, riderPassword);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        var loginStatus = jsonResponse['status'];
        if (loginStatus == 1) {
          Get.offAll(NavBar());
        } else {
          showCustomSnackbar(
            title: "Login Failed",
            message: "Invalid rider name or password",
            backgroundColor: Colors.grey.withOpacity(0.5), // Background color
            textColor: Colors.amber, // Text color
          );
        }
      } else {
        showCustomSnackbar(
          title: "Login Failed",
          message: "Failed to authenticate user",
            backgroundColor: Colors.grey.withOpacity(0.5), // Background color
            textColor: Colors.amber, // Text color
        );
      }
    } catch (e) {
      print("Exception occurred: $e");
      showCustomSnackbar(
        title: "Error",
        message: "An error occurred while processing your request",
           backgroundColor: Colors.grey.withOpacity(0.5), // Background color
            textColor: Colors.amber, // Text color
      );
    }
  }

  Future<http.StreamedResponse> authenticateUser(
      String riderName, String riderPassword) async {
    var headers = {
      'Ridername': riderName,
      'Riderpassword': riderPassword,
      'Cookie': 'PHPSESSID=a870f9db573e5604ee328f8cebae957a'
    };
    var request = http.Request(
        'POST', Uri.parse('https://falcon.onelogitech.com/api/riderapp_login'));
    request.body = '';
    request.headers.addAll(headers);

    return await request.send();
  }

  void showCustomSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
