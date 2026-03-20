import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final bool isCompact;

  const EventCard({super.key, required this.event, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            event.image,
            height: isCompact ? 120 : 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: TextStyle(
                          fontSize: isCompact ? 16 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        event.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                      onPressed: () {
                        provider.toggleBookmark(event.id);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Date: ${event.date.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Location: ${event.location}',
                  style: const TextStyle(color: Colors.grey),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 8),
                  Text(event.description),
                  const SizedBox(height: 8),
                  Chip(label: Text(event.category)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
