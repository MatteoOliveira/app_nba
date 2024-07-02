import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';
import '../models/player.dart';

class ApiService {
  final String apiUrl = 'https://api.balldontlie.io/v1';
  final String apiKey = 'b3a62c1d-440f-47f0-886f-a2965d5040ec';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(
      Uri.parse('$apiUrl/teams'),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((team) => Team.fromJson(team)).toList();
    } else {
      throw Exception('Failed to load teams');
    }
  }

  Future<List<Player>> fetchPlayers(int teamId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/players?team_ids[]=$teamId'),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((player) => Player.fromJson(player)).toList();
    } else {
      throw Exception('Failed to load players');
    }
  }

  Future<Map<String, dynamic>> fetchTeamStats(int teamId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/stats?team_ids[]=$teamId'),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load team stats');
    }
  }

  Future<Map<String, dynamic>> fetchSeasonStats(int teamId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/stats?team_ids[]=$teamId&seasons[]=2023'),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load season stats');
    }
  }
}
