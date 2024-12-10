import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.validator,
    // onChanged,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    this.readOnly = false,
    this.controller,
    this.inputAction,
    this.focusNode,
    required this.label,
    this.hint = "",
    required this.onTap,
    this.prefix,
    this.suffixIcon,
    this.keyboardtype,
    this.autofillHints,
    this.inputFormatters,
    this.prefixIcon,
    required this.obscureText,
    this.onFieldSubmitted,
    this.title,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final String label;
  final String hint;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool obscureText;
  final bool isLabelEnabled;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? title;
  final dynamic keyboardtype;
  final Function() onTap;
  final Widget? prefix;
  final Widget? prefixIcon;
  final bool autofocus = false;
  final dynamic autofillHints;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
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
                  style: AppTheme.of(context)
                      .bodyText1
                      .override(fontSize: e10 + 6, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: TextFormField(
                  obscureText: obscureText,
                  inputFormatters: inputFormatters,
                  autofillHints: autofillHints,
                  cursorColor: AppColor.appBlackColor,
                  onTap: onTap,
                  maxLines: maxLines,
                  onFieldSubmitted: onFieldSubmitted,
                  focusNode: focusNode,
                  controller: controller,
                  readOnly: readOnly,
                  autofocus: false,
                  keyboardType: keyboardtype,
                  textInputAction: TextInputAction.next,
                  textCapitalization: isCapitalized
                      ? TextCapitalization.words
                      : TextCapitalization.none,
                  style: const TextStyle(
                      color: AppColor.appBlackColor, fontSize: 12),
                  validator: validator,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      suffixIcon: suffixIcon,
                      prefix: prefix,
                      prefixIcon: prefixIcon,
                      labelStyle: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: AppColor.appTextGreyColor),
                      hintText: isLabelEnabled ? hint : null,
                      hintStyle: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: AppColor.appTextGreyColor),
                      fillColor: const Color(0xffF0F5FE),
                      filled: true),
                ),
              ),
            ]));
  }
}
