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

class MyNotificationScreen extends StatelessWidget {
  final User user;

  const MyNotificationScreen({
    Key? key,
    required this.user,
    required List<Supply> userSupplies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimlerim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Merhaba, ${user.username}!'),
            const SizedBox(height: 20),
            const Text('Bildiimlerim Listesi:'),
            // Başvurularınızın listesini göstermek için gerekli widget'ları ekleyin
          ],
        ),
      ),
    );
  }
}
