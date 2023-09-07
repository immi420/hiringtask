import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool loading;
  final String title;
  const RoundedButton(
      {super.key,
      required this.onTap,
      required this.loading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25.0)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
