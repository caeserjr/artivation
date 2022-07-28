import 'dart:convert';
import 'package:Artivation/config/config.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  static dynamic userLogin({payload}) async {
    final _uri = Uri.http(
      base_url,
      'auth/login',
    );

    final response = await http
        .post(
      _uri,
      headers: headers,
      body: jsonEncode(payload),
    )
        .timeout(
      Duration(
        seconds: timeout,
      ),
      onTimeout: () {
        return http.Response("Request timeout, server unreachable.", 408);
      },
    );

    print(payload);

    if (response.statusCode == 200) {
      var resultJSON = jsonDecode(response.body);
      return resultJSON;
    } else if (response.statusCode == 408) {
      return ErrorResponse(
        message: "An error has occurred.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else {
      
    }
  }
}
