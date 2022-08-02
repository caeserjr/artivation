class ArtPiece {
  int price;
  int pieceArtist;
  int category;
  String pieceName;
  String pieceImage;
  String pieceDesc;
  String pieceDate;

  ArtPiece({
    this.pieceName,
    this.pieceDesc,
    this.pieceImage,
    this.price,
    this.pieceArtist,
    this.pieceDate,
    this.category,
  });

  factory ArtPiece.fromJSON(dynamic json) {
    return ArtPiece(
      pieceName: json["pieceName"],
      price: json["price"],
      pieceImage: json["pieceImage"],
      pieceDesc: json["pieceDesc"],
      pieceDate: json["pieceDate"],
      pieceArtist: json["pieceArtist"],
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
