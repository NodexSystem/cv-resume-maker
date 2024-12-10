// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:resume_maker/common/common_widgets.dart';
// import 'package:resume_maker/components/appcolors/app_color.dart';
// import 'package:resume_maker/config/app_theme.dart';

// class CustomTextField {
//   static Widget textField(BuildContext context,String title,
//       {bool isPassword = false,
//       bool isNumber = false,
//       int? length,
//       TextEditingController? textController,
//       String? hintText,
//       int lines = 1}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 2),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             height: e10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: e10 - 5),
//             child: Text(
//               title,
//               style: AppTheme.of(context)
//                   .bodyText1
//                   .override(fontSize: e10 + 6, fontWeight: FontWeight.w600),
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           TextFormField(
//             maxLines: lines,
//             controller: textController,
//             maxLength: length,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(length),
//             ],
//             obscureText: isPassword,
//             keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//             decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 hintText: hintText,
//                 hintStyle: const TextStyle(
//                     fontSize: 13.0,
//                     color: AppColor.appHintTextColor,
//                     fontWeight: FontWeight.w500),
//                 counterText: '',
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(13.0),
//                 ),
//                 fillColor: const Color(0xffF0F5FE),
//                 filled: true),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class WidthTextBox extends StatelessWidget {
  final dynamic controllerText;
  final String? textName;
  final bool? obscureText;
  final String? Function(String?)? validateName;
  final FocusNode focusNode;
  final bool enable;
  final void Function()? onTap;
  final TextCapitalization character;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final Widget? suffixicon;
  final TextStyle? labelStyle;
  final int? maxLength;
  final dynamic inputFormatters;
  final bool? labletextstyle;
  final String? title;
  final String? hintText;
  final int? maxLines;

  final dynamic validator;

  const WidthTextBox({
    Key? key,
    this.controllerText,
    required this.textName,
    this.obscureText,
    this.validateName,
    this.keyboardType,
    required this.focusNode,
    this.enable = true,
    this.onTap,
    this.character = TextCapitalization.none,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.suffixicon,
    this.labelStyle,
    this.maxLength,
    this.inputFormatters,
    this.labletextstyle,
    this.validator,
    this.title,
    this.hintText,
    this.maxLines,
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
              style: AppTheme.of(context)
                  .bodyText1
                  .override(fontSize: e10 + 6, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: keyboardType ?? TextInputType.emailAddress,
            textInputAction: textInputAction,
            maxLength: maxLength,
            validator: validateName,
            onFieldSubmitted: onFieldSubmitted,
            // maxLines: lines,
            controller: controllerText,
            maxLines: maxLines,
            // maxLength: length,
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(length),
            // ],
            // obscureText: isPassword,
            // keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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
          )
        ],
      ),
    );
  }
}
