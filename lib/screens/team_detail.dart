import 'package:flutter/material.dart';
import '../models/team.dart';
import '../models/player.dart';
import '../services/api_service.dart';

class TeamDetailPage extends StatefulWidget {
  final Team team;

  TeamDetailPage({Key? key, required this.team}) : super(key: key);

  @override
  TeamDetailPageState createState() => TeamDetailPageState();
}

class TeamDetailPageState extends State<TeamDetailPage> {
  late Future<List<Player>> futurePlayers;
  late Future<Map<String, dynamic>> futureSeasonStats;
  late Future<Map<String, dynamic>> futureTeamStats;

  @override
  void initState() {
    super.initState();
    futurePlayers = ApiService().fetchPlayers(widget.team.id);
    futureSeasonStats =
        ApiService().fetchSeasonStats(widget.team.id); // Implement this method
    futureTeamStats = ApiService().fetchTeamStats(widget.team.id);
  }

  void _showSeasonStats() {
    showModalBottomSheet(
      context: context,
      builder: (context) => FutureBuilder<Map<String, dynamic>>(
        future: futureSeasonStats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Failed to load season stats: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No season stats found'));
          } else {
            Map<String, dynamic> stats = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Points per game: ${stats['points_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Rebounds per game: ${stats['rebounds_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Assists per game: ${stats['assists_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _showTeamStats() {
    showModalBottomSheet(
      context: context,
      builder: (context) => FutureBuilder<Map<String, dynamic>>(
        future: futureTeamStats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Failed to load team stats: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No team stats found'));
          } else {
            Map<String, dynamic> stats = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Points per game: ${stats['points_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Rebounds per game: ${stats['rebounds_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Assists per game: ${stats['assists_per_game']}',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.team.logoUrl,
              height: 100,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
            const SizedBox(height: 10),
            Text('City: ${widget.team.city}',
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 10),
            Text('Conference: ${widget.team.conference}',
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 10),
            Text('Division: ${widget.team.division}',
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 10),
            Text('Abbreviation: ${widget.team.abbreviation}',
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showSeasonStats,
              child: const Text('Season Stats'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showTeamStats,
              child: const Text('Team Stats'),
            ),
            const SizedBox(height: 20),
            Text('Players:', style: Theme.of(context).textTheme.headline6),
            Expanded(
              child: FutureBuilder<List<Player>>(
                future: futurePlayers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child:
                            Text('Failed to load players: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No players found'));
                  } else {
                    List<Player> players = snapshot.data!;
                    return ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              players[index].imageUrl,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(
                                '${players[index].firstName} ${players[index].lastName}'),
                            subtitle:
                                Text('Position: ${players[index].position}'),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
