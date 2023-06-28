import 'dart:convert';

class CategoryModel {
  final int count;
  final dynamic next;
  final String previous;
  final List<Result> results;

  CategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"] ?? "",
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Result {
  final int id;
  final String titleNepali;
  final String slug;
  final String subtitleNepali;
  final String descNepali;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final dynamic deletedAt;
  final dynamic parent;

  Result({
    required this.id,
    required this.titleNepali,
    required this.slug,
    required this.subtitleNepali,
    required this.descNepali,
    required this.createdAt,
    required this.modifiedAt,
    required this.deletedAt,
    required this.parent,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        titleNepali: json["title_nepali"],
        slug: json["slug"],
        subtitleNepali: json["subtitle_nepali"],
        descNepali: json["desc_nepali"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
        deletedAt: json["deleted_at"] ?? "",
        parent: json["parent"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title_nepali": titleNepali,
        "slug": slug,
        "subtitle_nepali": subtitleNepali,
        "desc_nepali": descNepali,
        "created_at": createdAt.toIso8601String(),
        "modified_at": modifiedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "parent": parent,
      };
}
