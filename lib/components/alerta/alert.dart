import 'package:flutter/material.dart';

alertError(BuildContext context, String title, String msg, action) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(
            child: Icon(
          Icons.warning_amber_outlined,
          size: 50,
          color: Colors.red,
        )),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        ),
        actions: action,
      );
    },
  );
}

alertaSucesso(BuildContext context, String title, String msg, action) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(
            child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.green,
        )),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        ),
        actions: action,
      );
    },
  );
}
