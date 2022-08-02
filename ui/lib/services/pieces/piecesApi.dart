import 'dart:convert';
import 'package:Artivation/config/config.dart';
import 'package:Artivation/handlers/error_responses.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:http/http.dart' as http;

class PiecesApi {
  static dynamic getArtPieces({payload}) async {
    List<ArtPiece> _pieceList = [];
    final _uri = Uri.http(
      base_url,
      'artPieces',
    );

    final response = await http
        .get(
      _uri,
      headers: headers,
      // body: jsonEncode(payload),
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
        _pieceList = items.map((item) => ArtPiece.fromJSON(item)).toList();

        return _pieceList;
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

  static dynamic addArtPiece({payload}) async {
    final _uri = Uri.http(
      base_url,
      'sendPiece',
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
