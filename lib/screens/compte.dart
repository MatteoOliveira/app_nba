import 'package:flutter/material.dart';

class CompteScreen extends StatelessWidget {
  const CompteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage(
                'images/mathieu_fight.gif',
              ),
              // Make sure the path is correct
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'John Doe',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Center(
            child: Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            subtitle: Text('Voir et modifier vos informations de profil'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            subtitle: Text('Gérer les paramètres de votre compte'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Confidentialité'),
            subtitle: Text('Ajuster vos paramètres de confidentialité'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Aide et support'),
            subtitle: Text('Obtenez de aide et trouvez des réponses à vos questions'),
          ),
          Divider(),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
