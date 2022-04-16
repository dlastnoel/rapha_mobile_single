import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../configs/global.dart';
import '../api/api_endpoints.dart';
import '../preferences/client_preferences.dart';
import '../helpers/otp_generator.dart';

class ClientProvider with ChangeNotifier {
  final _clientPreferences = ClientPreferences();
  final _otpGenerator = OtpGenerator();
  String userId = '';
  String code = '';
  String otp = '';

  Future<bool> updateClient(String username, String contact) async {
    try {
      Map<String, String> body = {
        'username': username,
        'contact': contact,
      };
      await http.post(
        Uri.parse(ApiEndpoints.updateClientUrl),
        body: body,
      );
      return Future.value(true);
    } catch (exception) {
      return Future.value(false);
    }
  }

  Future<bool> getCode(String username, String contact) async {
    Map<String, String> body = {
      'username': username,
      'contact': contact,
    };
    final response = await http.post(
      Uri.parse(ApiEndpoints.getClientUrl),
      body: body,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> apiResponse = json.decode(response.body);
      userId = apiResponse['id'];
      code = apiResponse['code'];
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<String> getAccessToken() async {
    final accessTokenUri =
        Uri.parse(ApiEndpoints.requestAccessTokenUrl).replace(queryParameters: {
      'app_id': Global.globeId,
      'app_secret': Global.globeSecret,
      'code': code,
    });
    final response = await http.post(accessTokenUri);

    Map<String, dynamic> apiResponse = json.decode(response.body);
    String value = apiResponse['access_token'];
    print(value);
    print("TOKEN");
    return value;
  }

  void sendOtp(String contact) async {
    String accessToken = await getAccessToken();
    final String otp = _otpGenerator.getCode();
    Map<String, dynamic> body = {
      'outboundSMSMessageRequest': {
        'senderAddress': '3796',
        'outboundSMSTextMessage': {
          'message':
              'Rapha greets you back! To authorize your login, kindly use this OTP: ' +
                  otp,
        }
      },
      'address': contact,
    };
    final sendOtpUri =
        Uri.parse(ApiEndpoints.requestOtpUrl).replace(queryParameters: {
      'access_token': accessToken,
    });
    await http.post(sendOtpUri,
        headers: {
          'Content-Type': 'application/json',
          'Host': 'devapi.globelabs.com.ph'
        },
        body: jsonEncode(body));
    this.otp = otp;
  }

  Future<bool> loginClient(
      String username, String contact, String userOtp) async {
    if (userOtp == otp) {
      final jwt = JWT(
        {
          'id': userId,
        },
      );

      String token =
          jwt.sign(SecretKey(code), expiresIn: const Duration(days: 10));
      JWT.verify(token, SecretKey(code));
      _clientPreferences.removeClient();
      _clientPreferences.setClient(token, code);
      print('TOKEN: ' + token);
      print('CODE: ' + code);
      return Future.value(true);
    }
    return Future.value(false);
  }
}
