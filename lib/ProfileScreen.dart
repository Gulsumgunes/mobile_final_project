import 'package:flutter/material.dart';
import 'FigmaToCodeApp.dart';
import 'HomeScreen.dart';
import 'AddSupplyScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FigmaToCodeApp());
}

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({
    Key? key,
    required this.user,
    required List<Supply> userSupplies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Ekranı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/anonim.png'),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('Merhaba! ${user.email}'), // Kullanıcının resim URL'si
            const SizedBox(height: 20),
            Text('E-posta: ${user.username}!'),

            // Başka kullanıcı bilgilerini buraya ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
