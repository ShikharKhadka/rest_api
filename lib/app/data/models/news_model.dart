// To parse this JSON data, do
//
//     final newsModel = newsModelFromMap(jsonString);

import 'dart:convert';

class NewsModel {
  final String status;
  final int count;
  final int countTotal;
  final List<Post> posts;

  NewsModel({
    required this.status,
    required this.count,
    required this.countTotal,
    required this.posts,
  });

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        posts: List<Post>.from(
          json["posts"].map(
            (x) => Post.fromMap(x),
          ),
        ),
      );
}

class Post {
  final int id;
  final String type;
  final String typeTitle;
  final String slug;
  final String url;
  final String status;
  final String title;
  final String titlePlain;
  final String titlePhoto;
  final String titlePhotoSmallThumb;
  final String titlePhotoMediumThumb;
  final String shortDesc;
  final String content;
  final DateTime dateNepali;
  final DateTime modified;
  final String timesince;
  final String author;
  final String authorUrl;
  final dynamic pdf;

  Post({
    required this.id,
    required this.type,
    required this.typeTitle,
    required this.slug,
    required this.url,
    required this.status,
    required this.title,
    required this.titlePlain,
    required this.titlePhoto,
    required this.titlePhotoSmallThumb,
    required this.titlePhotoMediumThumb,
    required this.shortDesc,
    required this.content,
    required this.dateNepali,
    required this.modified,
    required this.timesince,
    required this.author,
    required this.authorUrl,
    required this.pdf,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        type: json["type"],
        typeTitle: json["type_title"],
        slug: json["slug"],
        url: json["url"],
        status: json["status"],
        title: json["title"],
        titlePlain: json["title_plain"],
        titlePhoto: json["title_photo"] ?? "",
        titlePhotoSmallThumb: json["title_photo_small_thumb"] ?? "",
        titlePhotoMediumThumb: json["title_photo_medium_thumb"] ?? "",
        shortDesc: json["short_desc"],
        content: json["content"],
        dateNepali: DateTime.parse(json["date_nepali"]),
        modified: DateTime.parse(json["modified"]),
        timesince: json["timesince"],
        author: json["author"],
        authorUrl: json["author_url"],
        pdf: json["pdf"],
      );
}
