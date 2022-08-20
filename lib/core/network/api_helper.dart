import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as network;
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/foundation.dart';

import 'package:cubit_bloc_demo/core/utils/logger_util.dart';
import 'network_result.dart';

class APIHelper {
  final bool _isDebug = kDebugMode;
  Map<String, String>? _headers;

  APIHelper._privateConstructor() {
    _createHeaders();
  }

  static final APIHelper _instance = APIHelper._privateConstructor();

  static APIHelper get instance => _instance;

  Future<NetworkResult> callPostApi(
      String path, dynamic params, bool isLoader) async {
    var callingURL = path;
    await _createHeaders();
    var parameter = json.encode(params);

    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers", usePrint: true);
      timber("API Parameters -> $parameter");
    }

    if (await isConnected()) {
      if (isLoader) {
        EasyLoading.show();
      }
      try {
        var resp = await network
            .post(Uri.parse(callingURL), body: parameter, headers: _headers)
            .timeout(Duration(minutes: 3));
        EasyLoading.dismiss();
        if (_isDebug) logger.d("API ~~ Response -> ${jsonDecode(resp.body)}");
        // log(resp.body,name:"log remove photo");
        if (resp.statusCode == 200) {
          return Future.value(NetworkResult.success(resp.body));
        } else {
          return Future.value(NetworkResult.error(resp.body));
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          // FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error("resp.body"));
      }
    } else {
      // _showNoInternetDialog(0, path, params, isLoader);
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<void> _createHeaders() async {
    String authToken = "";

    if (authToken.isNotEmpty) {
      _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "platform": Platform.isIOS ? "ios" : "android",
      };
    } else {
      _headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "platform": Platform.isIOS ? "ios" : "android",
      };
    }
  }

  Future<void> _createHeadersForMultipart() async {
    String authToken = "";
    if (authToken.isNotEmpty) {
      _headers = {
        "Content-Type": "multipart/form-data",
        'Accept': '*/*',
        "Accept": "application/json",
        "platform": Platform.isIOS ? "ios" : "android",
      };
    } else {
      _headers = {
        'Accept': '*/*',
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "platform": Platform.isIOS ? "ios" : "android",
      };
    }
  }

  Future<void> updateHeaders() async {
    await _createHeaders();
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void makeHeaderNull() {
    _headers = null;
  }
}
