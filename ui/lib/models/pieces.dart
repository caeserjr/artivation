class ArtPiece {
  String pName;
  double price;
  String pImg;
  String pDesc;
  String pDate;
  String pArtist;

  ArtPiece({
    this.pName,
    this.pDesc,
    this.pImg,
    this.price,
    this.pArtist,
    this.pDate,
  });

  factory ArtPiece.fromJSON(dynamic json) {
    return ArtPiece(
      pName: json["pName"],
      price: json["price"],
      pImg: json["pImg"],
      pDesc: json["pDesc"],
      pDate: json["pDate"],
      pArtist: json["pArtist"],
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

// ignore: unused_element
List<ArtPiece> _featuredItems = [
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  ArtPiece(
      pName: 'Lions',
      price: 1000,
      pImg:
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
];
