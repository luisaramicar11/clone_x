class Tweet {
  final String username;
  final String handle;
  final String content;
  final String image;
  final String avatarUrl;
  final int likes;
  final int retweets;
  final int comments;
  final int views;
  final String time; 
  final bool isSaved;

  Tweet({
    required this.username,
    required this.handle,
    required this.content,
    required this.image,
    required this.avatarUrl,
    required this.likes,
    required this.retweets,
    required this.comments,
    required this.views,
    required this.time, 
    this.isSaved = false,
  });
}


