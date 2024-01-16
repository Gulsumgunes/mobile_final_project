import 'package:flutter/material.dart';
import 'AddSupplyScreen.dart';
import 'HomeScreen.dart';


// Tedariklerim sayfası
class MySuppliesScreen extends StatelessWidget {
  final User user;
  final List<Supply> userSupplies;

  const MySuppliesScreen({
    Key? key,
    required this.user,
    required this.userSupplies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tedariklerim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 2),

            const Text(
              'Sizin Oluşturduğunuz Tedarikler:',
              style: TextStyle(
                color: Colors.black, // Eklenen tedarik yazı rengi
                fontSize: 16, // Eklenen tedarik yazı boyutu
              ),
            ),
            const SizedBox(height: 10),
            // Burada eklenen tedariklerin listesi yer alabilir

            Column(
              children: userSupplies.map((supply) {
                return ListTile(
                  title: Text(
                    supply.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(supply.description),
                );
              }).toList(),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
