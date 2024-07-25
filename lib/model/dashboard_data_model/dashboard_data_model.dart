import 'dart:convert';

import 'content.dart';

List<DashboardDataModel> dashboardDataModelFromResponse(String str) =>
    List<DashboardDataModel>.from(
        json.decode(str).map((x) => DashboardDataModel.fromMap(x)));

class DashboardDataModel {
  String? type;
  String? title;
  List<Content>? contents;
  String? id;
  String? imageUrl;

  DashboardDataModel({
    required this.type,
    required this.title,
    this.contents,
    required this.id,
    this.imageUrl,
  });

  factory DashboardDataModel.fromMap(Map<String, dynamic> json) =>
      DashboardDataModel(
        type: json["type"],
        title: json["title"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromMap(x))),
        id: json["id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "title": title,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toMap())),
        "id": id,
        "image_url": imageUrl,
      };
}
