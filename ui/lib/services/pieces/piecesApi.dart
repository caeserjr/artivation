import 'dart:convert';

import 'package:Artivation/config/config.dart';
import 'package:Artivation/models/pieces.dart';
import 'package:http/http.dart' as http;

class PiecesApi {
  static Future<List<ArtPiece>> getArtPieces() async {
    var uri = Uri.http(base_url, "/pieces");

    final response = await http.get(uri, headers: headers);
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var piece in data["feed"]) {
      _temp.add(piece);
    }
    return ArtPiece.artPiecesFromSnapshot(_temp);
  }
}
