class AlbumModel {
  final int id;
  final int artistId;
  final String title;
  final String imageUrl;
  final String tracks;

  AlbumModel({required this.id, required this.artistId, required this.title, required this.imageUrl, required this.tracks});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      artistId: json['artists'][0]['id'],
      title: json['name'] ?? "",
      imageUrl: json['uri'] ?? "",
      tracks: json['tracks']['href'] ?? "",
    );
  }
}