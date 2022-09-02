import 'package:flutter/material.dart';
import '../pages/main/myApp.dart';

class Style {

  static TextStyle get textSplashScreen => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      fontFamily: 'IRANSansX',
      color: Colors.white
  );
  static TextStyle h1({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:36,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }
  static TextStyle h2({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:24,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }
  static TextStyle h3({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:18.5,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }
  static TextStyle h4({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:16,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }
  static TextStyle h5({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:13,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }
  static TextStyle h6({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:8,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }

  static TextStyle h10p({FontWeight fontWeight = FontWeight.normal, Color? color, double? height}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:10,
        fontFamily: 'IRANSansX',
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }

  static TextStyle h12p({FontWeight fontWeight = FontWeight.normal, Color? color, double? height,fontFamily = 'IRANSansX'}){
    return TextStyle(
        height: height,
        fontWeight: fontWeight ,
        fontSize:12,
        fontFamily: fontFamily,
        color: color != null ? color: MyApp.color.baseTextColor
    );
  }

}
