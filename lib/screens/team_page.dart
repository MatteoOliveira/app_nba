import 'package:flutter/material.dart';
import '../models/team.dart';
import '../services/api_service.dart';
import 'team_detail.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  late Future<List<Team>> futureTeams;

  @override
  void initState() {
    super.initState();
    futureTeams = ApiService().fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NBA Teams'),
      ),
      body: FutureBuilder<List<Team>>(
        future: futureTeams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load teams: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No teams found'));
          } else {
            List<Team> teams = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: teams.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamDetailPage(team: teams[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(
                          teams[index].logoUrl,
                          height: 100,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(teams[index].fullName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text('Abbreviation: ${teams[index].abbreviation}'),
                              SizedBox(height: 5),
                              Text('Conference: ${teams[index].conference}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
