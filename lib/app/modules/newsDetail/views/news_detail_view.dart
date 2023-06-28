import 'package:astha/app/data/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsDetailView extends StatelessWidget {
  final Post post;
  const NewsDetailView({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetailView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Hero(
              tag: post.id,
              child: CachedNetworkImage(imageUrl: post.titlePhoto)),
          Text(post.shortDesc)
        ],
      ),
    );
  }
}
