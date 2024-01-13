import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

class ButtonWidget extends StatefulWidget {
 final VoidCallback onTap;
 final String text;
 final bool loading;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.loading = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: height * 0.07,
        width: width * 0.75,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.containerB12.withOpacity(0.2),
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(0.5, 1),
                  blurRadius: 10,
                  spreadRadius: 5)
            ],
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(height * 0.05)),
        child: Center(
            child: widget.loading
                ? CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : Text(
                    widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.white),
                  )),
      ),
    );
  }
}
