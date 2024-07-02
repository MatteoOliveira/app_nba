class Team {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;
  final String logoUrl;

  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
    required this.logoUrl,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] ?? 0,
      abbreviation: json['abbreviation'] ?? '',
      city: json['city'] ?? '',
      conference: json['conference'] ?? '',
      division: json['division'] ?? '',
      fullName: json['full_name'] ?? '',
      name: json['name'] ?? '',
      logoUrl: json['logo_url'] ?? 'https://www.hatchwise.com/resources/the-complete-history-of-the-nba-logo', 
    );
  }
}
