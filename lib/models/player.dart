class Player {
  final int id;
  final String firstName;
  final String lastName;
  final String position;
  final int teamId;
  final String imageUrl;

  Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.teamId,
    required this.imageUrl,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? 'Unknown',
      lastName: json['last_name'] ?? 'Unknown',
      position: json['position'] ?? 'Unknown',
      teamId: json['team']['id'] ?? 0,
      imageUrl: json['image_url'] ?? 'https://www.hatchwise.com/resources/the-complete-history-of-the-nba-logo', // Replace with actual image URL field
    );
  }
}
