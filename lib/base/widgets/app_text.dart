
import 'package:flutter/gestures.dart';

import '../../exports.dart';



class AppText extends Text {
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final double fontSize;

  AppText.small(String data,
      {Key? key,
      this.color = ColorName.blackColor,
      this.fontWeight = FontWeight.normal,
      TextAlign? textAlign = TextAlign.left,
      int? maxLine,
      TextOverflow? textOverflow,
      this.height,
      this.letterSpacing,
      this.fontSize = 12})
      : super(
          key: key,
          data,
          textAlign: textAlign,
          maxLines: maxLine,
          style: TextStyle(
              fontFamily: FontFamily.workSans,
              fontSize: fontSize.sp,
              color: color,
              height: height,
              fontWeight: fontWeight,
              overflow: textOverflow,
              letterSpacing: letterSpacing),
        );

  AppText.medium(
    String data, {
    Key? key,
    this.color = ColorName.blackColor,
    this.fontWeight = FontWeight.w600,
    TextAlign? textAlign = TextAlign.left,
    int? maxLine,
    TextOverflow? textOverflow,
    this.height,
    this.letterSpacing,
    this.fontSize = 14,
    TextDecoration textDecoration = TextDecoration.none,
  }) : super(
          key: key,
          data,
          textAlign: textAlign,
          maxLines: maxLine,
          style: TextStyle(
              fontFamily: FontFamily.workSans,
              fontSize: fontSize.sp,
              color: color,
              height: height,
              fontWeight: fontWeight,
              overflow: textOverflow,
              letterSpacing: letterSpacing),
        );

  AppText.large(
    String data, {
    Key? key,
    this.color = ColorName.blackColor,
    this.fontWeight = FontWeight.bold,
    TextAlign? textAlign = TextAlign.center,
    int? maxLine,
    TextOverflow? textOverflow,
    String? fontFamily = FontFamily.workSans,
    this.height,
    this.letterSpacing,
    this.fontSize = 24,
  }) : super(
          key: key,
          data,
          textAlign: textAlign,
          maxLines: maxLine,
          
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize.sp,
              color: color,
              height: height,
              fontWeight: fontWeight,
              overflow: textOverflow,
              letterSpacing: letterSpacing),
        );
}

class AppTextSpan extends TextSpan {
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;
  final double fontSize;

  AppTextSpan.large(String data, {
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.bold,
    this.textAlign,
    this.height,
    this.fontSize = 24,
    this.letterSpacing,
    GestureRecognizer? recognizer
  }) : super(
    text: data,
    recognizer: recognizer,
    style: TextStyle(
      fontFamily: FontFamily.workSans,
      fontSize: fontSize.sp,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    ),
  );

  AppTextSpan.medium(String data, {
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
    this.height,
    this.fontSize = 14,
    this.letterSpacing,
    TextDecoration textDecoration = TextDecoration.none,
    GestureRecognizer? recognizer
  }) : super(
    text: data,
    recognizer: recognizer,
    style: TextStyle(
      fontFamily: FontFamily.workSans,
      fontSize: fontSize.sp,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    ),
  );

  AppTextSpan.small(String data, {
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
    this.height,
    this.fontSize = 12,
    this.letterSpacing,
    TextDecoration textDecoration = TextDecoration.none,
    GestureRecognizer? recognizer
  }) : super(
    text: data,
    recognizer: recognizer,
    style: TextStyle(
      fontFamily: FontFamily.workSans,
      fontSize: fontSize.sp,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    ),
  );
}
