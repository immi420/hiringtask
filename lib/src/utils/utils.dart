import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  void showAlertDialog(BuildContext context, String title, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(error),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).backgroundColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Try Again",
                    style: TextStyle(color: Colors.white))),
          ],
        );
      },
    );
  }
}
