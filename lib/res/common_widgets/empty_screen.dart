import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  String text;
  String text2;
  EmptyScreen({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: height * .3,
              width: width * .5,
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.fill,
              )),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text(text, style: Theme.of(context).textTheme.headline2),
        SizedBox(
          height: height * 0.01,
        ),
        Text(text2, style: Theme.of(context).textTheme.headline3),
      ],
    );
  }
}
