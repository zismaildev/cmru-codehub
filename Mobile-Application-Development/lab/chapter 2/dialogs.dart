import 'package:flutter/material.dart';

Future<void> showWelcomeDialog(
    BuildContext context, String fullname, String email, String gender) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Welcome'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(fullname),
              Text(email),
              Text(gender),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
