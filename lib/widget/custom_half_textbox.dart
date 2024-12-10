import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class HalfWidthTextBox extends StatelessWidget {
  final dynamic controllerText;
  final String? textName;
  final bool? obscureText;
  final String? Function(String?)? validateName;
  final FocusNode focusNode;
  final bool enable;
  final TextCapitalization character;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final Widget? suffixicon;
  final int? maxLength;
  final TextStyle? labelStyle;
  final bool? labletextstyle;
  final dynamic decoration;
  final dynamic style;
  final bool autocorrect;
  final dynamic validator;
  final String? title;
  final String? hintText;
  void Function(String)? onChanged;

  HalfWidthTextBox({
    Key? key,
    this.controllerText,
    required this.textName,
    this.obscureText,
    this.validateName,
    this.keyboardType,
    required this.focusNode,
    this.enable = true,
    this.character = TextCapitalization.none,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.suffixicon,
    this.maxLength,
    inputFormatters,
    this.decoration,
    this.labelStyle,
    this.labletextstyle,
    this.style,
    this.autocorrect = false,
    this.validator,
    this.title,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: e10,
          ),
          Padding(
            padding: EdgeInsets.only(left: e10 - 5),
            child: Text(
              title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTheme.of(context)
                  .bodyText1
                  .override(fontSize: e10 + 6, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            enabled: enable,
            maxLength: maxLength,
            controller: controllerText,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            focusNode: focusNode,
            keyboardType: keyboardType ?? TextInputType.emailAddress,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            textCapitalization: character,
            validator: validateName,
            cursorHeight: 20,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontSize: 13.0,
                    color: AppColor.appHintTextColor,
                    fontWeight: FontWeight.w500),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                fillColor: const Color(0xffF0F5FE),
                filled: true),
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColor.resumeblackColor),
          ),
        ],
      ),
    );
  }
}

class HalfTextBox extends StatelessWidget {
  final dynamic controllerText;
  final String? textName;
  final bool? obscureText;
  final String? Function(String?)? validateName;
  final FocusNode focusNode;
  final bool enable;
  final TextCapitalization character;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final Widget? suffixicon;
  final int? maxLength;
  final String? title;
  final String? hintText;

  const HalfTextBox({
    Key? key,
    this.controllerText,
    required this.textName,
    this.obscureText,
    this.validateName,
    this.keyboardType,
    required this.focusNode,
    this.enable = true,
    this.character = TextCapitalization.none,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.suffixicon,
    this.maxLength,
    this.title,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        enabled: enable,
        maxLength: maxLength,
        controller: controllerText,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        textCapitalization: character,
        validator: validateName,
        cursorHeight: 20,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 13.0,
                color: AppColor.appHintTextColor,
                fontWeight: FontWeight.w500),
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(13.0),
            ),
            fillColor: const Color(0xffF0F5FE),
            filled: true),
        style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColor.resumegreyColor),
      ),
    );
  }
}
