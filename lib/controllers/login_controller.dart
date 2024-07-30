import 'dart:convert';

import 'package:cadeau_app/services/cache_helper.dart';
import 'package:http/http.dart' as http;
class LoginController {

  Future<bool> login(String phoneNumber, String password) async {
    final body = jsonEncode({
      "user": {
        "country_code": "20",
        "phone_number": phoneNumber,//120856987
        "password": password//"Testtest1@"
      },
      "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "dummy"
      }
    });
    print("body : $body");
    final response = await http.post(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1/auth/customer/login'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      String accessToken = data['data']['extra']['access_token'];
      print("Access Token: $accessToken");
      await CacheHelper.saveToken(accessToken);
      return true;
    } else {
      return false;
    }
  }
}
