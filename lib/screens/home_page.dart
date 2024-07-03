import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/team_page.dart';
import '../theme.dart'; // Ensure this import points to the correct path

final Uri _url = Uri.parse('https://flutter.dev');

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color nbaBlue = Color(0xFF007AC1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: CustomStyles.primaryContainer.padding,
              decoration: CustomStyles.primaryContainer.decoration,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/coupe2.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'History of the NBA',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: nbaBlue,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'La National Basketball Association (NBA) est une ligue professionnelle de basket-ball en Amérique du Nord. La ligue a été fondée à New York le 6 juin 1946 sous le nom de Basketball Association of America (BAA). Elle a changé son nom pour devenir la NBA en 1949 après avoir fusionné avec la ligue rivale National Basketball League (NBL)...',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: CustomStyles.secondaryContainer.padding,
                  decoration: CustomStyles.secondaryContainer.decoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About the Application',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: nbaBlue,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lapplication NBA est conçue pour vous apporter les dernières mises à jour et des statistiques détaillées sur les matchs et les joueurs de la NBA. Vous pouvez explorer différentes équipes, suivre les performances des joueurs et obtenir des analyses détaillées des matchs. Que vous soyez un fan occasionnel ou un passionné de basket-ball, cette application a quelque chose à offrir pour tout le monde',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: CustomStyles.secondaryContainer.padding,
                  decoration: CustomStyles.secondaryContainer.decoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore NBA Teams',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: nbaBlue,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cliquez sur le bouton ci-dessous pour voir des informations détaillées sur les différentes équipes de la NBA, leurs statistiques, leurs joueurs et bien plus encore',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeamsPage()),
                            );
                          },
                          child: const Text('Voir les équipes'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
