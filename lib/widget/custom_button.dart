import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double hight;
  final Color bgColor;

  final Function onPressFunction;
  final Color fontColor;
  final double fontsize;
  final dynamic fontweight;
  final dynamic paddIng;
  final dynamic marGin;
  const CustomButton({
    Key? key,
    required this.title,
    required this.width,
    required this.hight,
    required this.onPressFunction,
    required this.bgColor,
    required this.fontColor,
    this.fontsize = 15,
    this.fontweight,
    this.paddIng,
    this.marGin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressFunction();
      },
      child: Container(
        height: hight,
        width: width,
        margin: marGin,
        padding: paddIng,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 10,
                fontWeight: FontWeight.bold,
                color: AppColor.appWhiteColor),
          ),
        ),
      ),
    );
  }
}
