import 'package:flutter/material.dart';

class SnackBarUtils {
  static void defualtSnackBar(String? message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final SnackBar snackBar = SnackBar(
      content: Center(
        child: Text(
          message ?? '',
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void errorSnackBar(String? message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final SnackBar snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Center(
        child: Text(message ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void successSnackBar(String? message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final SnackBar snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Center(
        child: Text(message ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
