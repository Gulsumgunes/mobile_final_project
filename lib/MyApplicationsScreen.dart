import 'package:flutter/material.dart';
import 'AddSupplyScreen.dart';
import 'HomeScreen.dart';

// Başvurularım sayfası
class MyApplicationsScreen extends StatelessWidget {
  final User user;
  final List<Supply> userApplications;

  const MyApplicationsScreen({
    Key? key,
    required this.user,
    required this.userApplications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Başvurularım'),
      ),
      body: ListView.builder(
        itemCount: userApplications.length,
        itemBuilder: (context, index) {
          final supply = userApplications[index];
          return ListTile(
            title: Text(supply.title),
            subtitle: Text(supply.description),
            // Diğer bilgileri ekle
          );
        },
      ),
    );
  }
}
