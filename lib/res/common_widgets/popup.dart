import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';

popup({required context, required text, required onTap, required buttonText}) {
  return showDialog(
      context: context,
      builder: (BuildContext cntext) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: AppColors.buttonColor,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.white),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Center(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                        border:
                            Border.all(width: 1, color: AppColors.transparent),
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Center(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                        border:
                            Border.all(width: 1, color: AppColors.transparent),
                      ),
                      child: Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      });
}
