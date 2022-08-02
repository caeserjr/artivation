import 'dart:convert';

import 'package:Artivation/config/config.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/messages.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MessagesApi {
  static dynamic getConversations({payload}) async {
    List<Message> _messageList = [];
    final _uri = Uri.http(
      base_url,
      'conversations',
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

    if (response.statusCode == 200) {
      var resultJSON = jsonDecode(response.body);
      if (resultJSON["status"] == "success") {
        Iterable items = resultJSON["data"];
        _messageList = items.map((item) => Message.fromJSON(item)).toList();
        return _messageList;
      } else {
        return ErrorResponse(
          message: resultJSON["data"],
          content: response.toString(),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == 400) {
      return ErrorResponse(
        message: "Invalid user request.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else if (response.statusCode == 408) {
      return ErrorResponse(
        message: "Server unreachable.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else {
      return ErrorResponse(
        message: "An error has occurred.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    }
  }

  static dynamic getMessages({payload}) async {
    List<Message> _messageList = [];
    final _uri = Uri.http(
      base_url,
      'messages',
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

    if (response.statusCode == 200) {
      var resultJSON = jsonDecode(response.body);
      if (resultJSON["status"] == "success") {
        Iterable items = resultJSON["data"];

        _messageList = items.map((item) => Message.fromJSON(item)).toList();

        return _messageList;
      } else {
        return ErrorResponse(
          message: resultJSON["data"],
          content: response.toString(),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == 400) {
      return ErrorResponse(
        message: "Invalid user request.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else if (response.statusCode == 408) {
      return ErrorResponse(
        message: "Server unreachable.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else {
      return ErrorResponse(
        message: "An error has occurred.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    }
  }

  static dynamic sendMessage({payload}) async {
    final _uri = Uri.http(
      base_url,
      'sendMessage',
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

    if (response.statusCode == 200) {
      var resultJSON = jsonDecode(response.body);
      if (resultJSON["status"] == "success") {
        return resultJSON["data"];
      } else {
        return ErrorResponse(
          message: resultJSON["data"],
          content: response.toString(),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == 400) {
      return ErrorResponse(
        message: "Invalid user request.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else if (response.statusCode == 408) {
      return ErrorResponse(
        message: "Server unreachable.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    } else {
      return ErrorResponse(
        message: "An error has occurred.",
        content: response.toString(),
        statusCode: response.statusCode,
      );
    }
  }
}
