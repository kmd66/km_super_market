import 'dart:convert';
import 'package:flutter/services.dart';

class AppStrings {
  static loadJson() async {
    String _data = await rootBundle.loadString('assets/appSettings.json');
    var jsonResult = json.decode(_data);
    applicationID =  jsonResult['applicationID'];
    clientId =  jsonResult['clientId'];
    apiHost =  jsonResult['apiHost'];
    apiKey =  jsonResult['apiKey'];
    // organizationHost =  jsonResult['organizationHost'];
    // salaryHost =  jsonResult['salaryHost'];
    appName =  jsonResult['appName'];
    appVersion =  jsonResult['appVersion'];
  }
  static String applicationID = '';
  static String clientId = '';
  static String apiKey = '';
  static String apiHost = '';
  // static String organizationHost = "";
  // static String salaryHost = "";
  static String appName = '';
  static String appVersion = '';
}