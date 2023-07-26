class ArtPiece {
  int price, pieceArtist, category, pieceId;
  String pieceName, pieceImage, pieceDesc, pieceDate;

  ArtPiece({
    required this.pieceId,
    required this.pieceName,
    required this.pieceDesc,
    required this.pieceImage,
    required this.price,
    required this.pieceArtist,
    required this.pieceDate,
    required this.category,
  });

  factory ArtPiece.fromJSON(dynamic json) {
    return ArtPiece(
      pieceId: json["pieceId"],
      pieceName: json["pieceName"],
      price: json["price"],
      pieceImage: json["pieceImage"],
      pieceDesc: json["pieceDesc"],
      pieceDate: json["pieceDate"],
      pieceArtist: json["pieceArtist"],
      category: json["pieceCategory"],
    );
  }

  static List<ArtPiece> artPiecesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return ArtPiece.fromJSON(data);
    }).toList();
  }
}

List<String> pieces = [
  'assets/pieces/1.jpg',
  'assets/pieces/2.jpg',
  'assets/pieces/3.jpg',
  'assets/pieces/4.jpg',
  'assets/pieces/5.jpg',
  'assets/pieces/6.jpg',
  'assets/pieces/7.jpg',
  'assets/pieces/8.jpg',
];

List<String> titles = [
  'Sage Jiraiya',
  'Gintama',
  'Shinra',
  'Squad 8',
  'Boku No Hero Gotham',
  'Gin-sama',
  'Eyelish Brown',
  'Justice League'
];
