import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/team_page.dart';
import '../theme.dart'; // Ensure this import points to the correct path

final Uri _url = Uri.parse('https://flutter.dev');

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: customContainerStyle.padding,
              decoration: customContainerStyle.decoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image.asset('assets/images/coupe2.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'History of the NBA',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'The National Basketball Association (NBA) is a professional basketball league in North America. The league was founded in New York City on June 6, 1946, as the Basketball Association of America (BAA). It changed its name to the NBA in 1949 after merging with the rival National Basketball League (NBL). The NBA is one of the major professional sports leagues in the United States and Canada. It is composed of 30 teams (29 in the United States and 1 in Canada) and is one of the four major professional sports leagues in the United States and Canada. The NBA is widely considered.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamsPage()),
                      );
                    },
                    child: const Text('View Teams'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: secondaryContainerStyle.padding,
                    decoration: secondaryContainerStyle.decoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About the Application',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'The NBA App is designed to bring you the latest updates and detailed statistics about NBA games and players. You can explore different teams, track player performances, and get insights into game analytics. Whether you are a casual fan or a die-hard basketball enthusiast, this app has something for everyone.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row rowMaker(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
