import 'package:flutter/material.dart';
import '../models/tweet.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  const TweetCard({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5), 
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(tweet.avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      tweet.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${tweet.handle} · ${tweet.time}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(tweet.content),
                const SizedBox(height: 8),
                if (tweet.image.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      tweet.image,
                      width: MediaQuery.of(context).size.width * 0.85,
                      fit: BoxFit.contain,
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconText(Icons.comment, tweet.comments),
                    _buildIconText(Icons.repeat, tweet.retweets),
                    _buildIconText(Icons.favorite, tweet.likes),
                    _buildIconText(Icons.bar_chart, tweet.views),
                    IconButton(
                      icon: Icon(
                        tweet.isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: tweet.isSaved ? Colors.blue : Colors.grey,
                        size: 20, 
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.grey, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey), 
        const SizedBox(width: 6),
        Text(count.toString(), style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}






