import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:battery_plus/battery_plus.dart';

class DeviceUtils {
  // معلومات النظام
  static Future<String> getSystemInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo.manufacturer);
      return 'Android ${androidInfo.version.release}, ${androidInfo.model}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print(
          'iOS ${iosInfo.systemVersion}, ${iosInfo.model}, ${iosInfo.name}, ${iosInfo.identifierForVendor}, ${iosInfo.isPhysicalDevice}, ${iosInfo.utsname}, ${iosInfo.localizedModel}, ${iosInfo.systemName}, ${iosInfo.utsname}, ${iosInfo.utsname.machine}, ${iosInfo.utsname.nodename}, ${iosInfo.utsname.release}, ${iosInfo.utsname.sysname}, ${iosInfo.utsname.version}, ${iosInfo.utsname.version}');
      return 'iOS ${iosInfo.systemVersion}, ${iosInfo.model}';
    } else {
      return 'Unsupported Platform';
    }
  }

  // نوع الجهاز: هاتف أو تابلت
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = sqrt(size.width * size.width + size.height * size.height);
    print(diagonal);
    return diagonal > 1100; // افتراض أن الأجهزة اللوحية أكبر من 1100 بيكسل
  }

  // حجم الشاشة
  static Size getScreenSize(BuildContext context) {
    print(MediaQuery.of(context).size);
    return MediaQuery.of(context).size;
  }

  // حالة الاتصال بالإنترنت
  static Future<String> getConnectivityStatus() async {
    ConnectivityResult connectivityResult =
        (await Connectivity().checkConnectivity()) as ConnectivityResult;
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        return 'Connected to Mobile Data';
      case ConnectivityResult.wifi:
        return 'Connected to WiFi';
      case ConnectivityResult.none:
        return 'No Internet Connection';
      default:
        return 'Unknown';
    }
  }

  // مستوى البطارية
  static Future<int> getBatteryLevel() async {
    Battery battery = Battery();
    return await battery.batteryLevel;
  }

  // لغة النظام
  static String getSystemLanguage(BuildContext context) {
    print(Localizations.localeOf(context).languageCode);
    return Localizations.localeOf(context).languageCode;
  }

  // الوضع الحالي: داكن أو فاتح
  static bool isDarkMode(BuildContext context) {
    print(MediaQuery.of(context).platformBrightness);
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
