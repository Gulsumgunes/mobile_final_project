import 'package:flutter/material.dart';
import 'AddSupplyScreen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

class SupplyDetailScreen extends StatelessWidget {
  final Supply supply;
  final void Function() onDelete;
  final void Function() onApply;
  final User currentUser;

  const SupplyDetailScreen({
    Key? key,
    required this.supply,
    required this.currentUser,
    required this.onDelete,
    required this.onApply,
  }) : super(key: key);

  void applyToSupply(Supply supply, User user) {
    // Supply'e başvur işlemleri
  }

  void addApplicationToMyApplications(Supply supply) {
    // Başvurularım listesine ekleme işlemleri
  }

  void handleApply() {
    applyToSupply(supply, currentUser);
    addApplicationToMyApplications(supply);
    // Diğer işlemler
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(supply.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description: ${supply.description}',
              style:
                  const TextStyle(color: Colors.black), // Metin rengini burada ayarla
            ),
            const SizedBox(height: 10),
            Text(
              'Sector: ${supply.sector}',
              style:
                  const TextStyle(color: Colors.black), // Metin rengini burada ayarla
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: handleApply,
                  child: const Text('Apply'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Oluşturan kullanıcının profil resmini görüntüle
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/anonim.png'),
              ),
              title: Text(
                'Oluşturan Kullanıcı: ${supply.createdBy.username}',
                style: const TextStyle(
                    color: Colors.black), // Metin rengini burada ayarla
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      user: supply.createdBy, userSupplies: const [],
                      // İstediğiniz diğer bilgileri de buraya ekleyebilirsiniz
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
