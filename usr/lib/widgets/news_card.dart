import 'package:flutter/material.dart';
import '../models/news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final bool isCompact;

  const NewsCard({super.key, required this.news, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            news.image,
            height: isCompact ? 120 : 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: isCompact ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Source: ${news.source}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Published: ${news.createdAt.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(color: Colors.grey),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 8),
                  Text(news.summary),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
