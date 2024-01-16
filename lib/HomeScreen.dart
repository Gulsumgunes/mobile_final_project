import 'package:flutter/material.dart';
import 'AddSupplyScreen.dart';
import 'AndroidSmall2.dart';
import 'EditSupplyScreen.dart';
import 'SupplyDetailScreen.dart';
import 'ProfileScreen.dart';
import 'MyApplicationsScreen.dart';
import 'MyNotificationScreen.dart';
import 'MySuppliesScreen.dart';





class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

List<Supply> userApplications = []; // Kullanıcının başvurularını tutan liste

class User {
  final String username;
  final String email;
  final String imageUrl;

  User({
    required this.username,
    required this.email,
    required this.imageUrl,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Supply> supplyList = [
    Supply(
      title: 'Tedarik 1',
      description: 'Açıklama 1',
      sector: 'Sektor 1',
      createdBy: User(username: 'user1', email: '', imageUrl: ''),
      imageUrl: 'anonim.png',
    ),
    Supply(
      title: 'Tedarik 2',
      description: 'Açıklama 2',
      sector: 'Sektor 2',
      createdBy: User(username: 'user2', email: '', imageUrl: ''),
      imageUrl: 'anonim.png',
    ),
    Supply(
      title: 'Tedarik 3',
      description: 'Açıklama 3',
      sector: 'Sektor 3',
      createdBy: User(username: 'user3', email: '', imageUrl: ''),
      imageUrl: 'anonim.png',
    ),
  ];

  String searchQuery = '';
  List<Supply> userApplications = [];

  void _deleteSupply(Supply supply) {
    if (supply.createdBy == widget.user) {
      setState(() {
        supplyList.remove(supply);
      });
    }
  }

  void _logout() {
    // Kullanıcının oturumunu sonlandırma işlemi
    // Bu kısma, kullanıcının oturumunu sonlandırdığınız bir kodu ekleyin.

    // Örneğin, oturumu sonlandırdıktan sonra giriş ekranına geri dönebilirsiniz.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AndroidSmall2(),
      ),
    );
  }

  // ignore: unused_element
  void _editSupply(Supply supply) async {
    // Kullanıcının eklediği tedarikleri kontrol et
    if (supply.createdBy == widget.user) {
      final editedSupply = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditSupplyScreen(initialSupply: supply),
        ),
      );

      if (editedSupply != null) {
        setState(() {
          // Tedarik öğesini güncelleme işlemleri burada yapılır
          // Sadece kullanıcının eklediği tedarikleri güncelle
          if (supplyList.contains(supply)) {
            supplyList.remove(supply);
            supplyList.add(editedSupply);
          }
        });
      }
    }
  }

  void _shareSupply(Supply supply) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // ignore: avoid_unnecessary_containers
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('Whatsapp'),
                onTap: () {
                  Navigator.pop(context);
                  // Mesajla işlemini gerçekleştir
                  _shareViaMessage(supply);
                },
              ),
              ListTile(
                leading: const Icon(Icons.work, color: Colors.blue),
                title: const Text('JOBSocial'),
                onTap: () {
                  Navigator.pop(context);
                  // Mesajla işlemini gerçekleştir
                  _shareViaMessage(supply);
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                onTap: () {
                  Navigator.pop(context);
                  // Mesajla işlemini gerçekleştir
                  _shareViaMessage(supply);
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Bağlantı Kopyala'),
                onTap: () {
                  Navigator.pop(context);
                  // Bağlantıyı kopyala işlemini gerçekleştir
                  _copyLink(supply);
                },
              ),
              // İstediğiniz diğer paylaşma seçeneklerini ekleyebilirsiniz
            ],
          ),
        );
      },
    );
  }

  void _shareViaMessage(Supply supply) {
    // Mesajla paylaşma işlemleri
    print('Mesajla paylaşma: ${supply.title}');
  }

  void _copyLink(Supply supply) {
    // Bağlantıyı kopyala işlemleri
    print('Bağlantı kopyalandı: ${supply.title}');
  }

  // ignore: unused_element
// ignore: unused_element
  void _viewSupplyDetail(Supply supply) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SupplyDetailScreen(
          supply: supply,
          currentUser: widget.user,
          onDelete: () => _deleteSupply(supply),
          onApply: () {
            setState(() {
              // Kullanıcının başvurularını tuttuğunuz listeye supply ekleyin
              userApplications.add(supply);
              print('Başvuru eklendi: ${supply.title}');
            });
            Navigator.pop(context); // SupplyDetailScreen'ı kapatın
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Akış'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    user: widget.user,
                    userSupplies: supplyList
                        .where((supply) => supply.createdBy == widget.user)
                        .toList(),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _logout,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Menü',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Bildirimler'),
              onTap: () {
                Navigator.pop(context); // Menüyü kapat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyNotificationScreen(
                      user: widget.user,
                      userSupplies: supplyList
                          .where((supply) => supply.createdBy == widget.user)
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Tedarikler'),
              onTap: () {
                Navigator.pop(context); // Menüyü kapat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySuppliesScreen(
                      user: widget.user,
                      userSupplies: supplyList
                          .where((supply) => supply.createdBy == widget.user)
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Başvurular'),
              onTap: () {
                Navigator.pop(context); // Menüyü kapat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApplicationsScreen(
                      user: widget.user,
                      userApplications: userApplications,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Tedarik ara...',
                prefixIcon: Icon(Icons.search),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: searchQuery.isEmpty
                  ? supplyList.length
                  : supplyList
                      .where((supply) =>
                          supply.title.toLowerCase().contains(searchQuery))
                      .length,
              itemBuilder: (context, index) {
                final supply = searchQuery.isEmpty
                    ? supplyList[index]
                    : supplyList
                        .where((supply) =>
                            supply.title.toLowerCase().contains(searchQuery))
                        .toList()[index];
                // ignore: unused_local_variable
                final imageUrl = supply.imageUrl.isNotEmpty
                    ? supply.imageUrl
                    : 'assets/images/anonim.png';
                return Dismissible(
                  key: Key(supply.title),
                  onDismissed: (direction) {
                    _deleteSupply(supply);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    if (supply.createdBy == widget.user) {
                      return true;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Bu tedariki silemezsiniz."),
                        ),
                      );
                      return false;
                    }
                  },

                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          supply.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ListTile(
                          leading: supply.imageUrl.isNotEmpty
                              ? const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/anonim.png'),
                                )
                              : null,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.share),
                                onPressed: () {
                                  _shareSupply(supply);
                                },
                                iconSize: 16,
                              ),
                              if (supply.createdBy == widget.user)
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _editSupply(supply);
                                  },
                                  iconSize: 16,
                                ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SupplyDetailScreen(
                                  supply: supply,
                                  currentUser: widget.user,
                                  onDelete: () => _deleteSupply(supply),
                                  onApply: () {
                                    setState(() {
                                      userApplications.add(supply);
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newSupply = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSupplyScreen(
                onSupplyAdded: (supply) {
                  setState(() {
                    supplyList.add(supply);
                  });
                },
                user: widget.user,
              ),
            ),
          );

          if (newSupply != null) {
            setState(() {
              supplyList.add(newSupply);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
