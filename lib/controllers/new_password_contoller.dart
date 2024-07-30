import 'dart:convert';
import 'package:http/http.dart' as http;

class NewPasswordController {
  Future<String> sendPhoneNumber(String phoneNumber) async {
    final body = jsonEncode({
      "user": {
        "country_code": "+20",
        "phone_number": phoneNumber,
      }
    });
    print("body : $body");
    final response = await http.post(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1/auth/passwords/customer/send_reset_password_info'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final verificationCode = data['data']['reset_password_token'];
      print('Verification code : $verificationCode');
      return verificationCode;
    } else {
      return "Error in response";
    }
  }

  Future<String> verifyOtp(String phoneNumber, String verificationCode) async {
    final body = jsonEncode({
      "verification_code": verificationCode,
      "user": {"country_code": "+20", "phone_number": phoneNumber}
    });
    print("body : $body");
    final response = await http.post(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1/auth/passwords/customer/verify_otp'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic>  data = jsonDecode(response.body);
      final token = data['data']['token'];
      return token;
    } else {
      return "Error in verify otp";
    }
  }

  Future<bool> resetPassword(
      String phoneNumber, String newPassword, String token) async {
    final body = jsonEncode(
      {
        "user": {
          "country_code": "+20",
          "phone_number": phoneNumber,
          "password": newPassword,
          "password_confirmation": newPassword
        },
        "device": {
          "device_type": "android", //"android" , "ios" , "web", "unknown"
          "fcm_token": "dummy"
        }
      }
    );
    print("body : $body");
    final response = await http.post(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1/auth/passwords/customer/reset_password'),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'verification-token': token
      },
    );
    print('RESPONSE BODY : ${response.body}');
    if (response.statusCode == 200){
      return true;
    }
    return false;
  }
}
