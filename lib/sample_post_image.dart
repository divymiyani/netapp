import 'dart:convert';

List<SamplePostImages> samplePostImagesFromJson(String str) =>
    List<SamplePostImages>.from(
        json.decode(str).map((x) => SamplePostImages.fromJson(x)));

String samplePostImagesToJson(List<SamplePostImages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePostImages {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  SamplePostImages({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory SamplePostImages.fromJson(Map<String, dynamic> json) =>
      SamplePostImages(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
