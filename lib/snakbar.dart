import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MySnackbar {
  static void showLottieSnackBar() {
    Get.snackbar(
      "",
      "",
      titleText: Center(
        child: Container(
          width: 250,
          height: 400,
          margin: const EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 5),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'asset/lottie/connection.json',
                  width: 200,
                  height: 200,
                  repeat: true,
                ),
                const SizedBox(height: 10),
                const Text(
                  "PLEASE CONNECT TO THE INTERNET",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors
          .transparent, // Make background transparent to avoid covering the screen
      borderRadius: 10,
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(days: 1),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
