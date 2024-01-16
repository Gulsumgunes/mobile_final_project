import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class AddSupplyScreen extends StatefulWidget {
  final void Function(dynamic supply) onSupplyAdded;
  final User user;

  const AddSupplyScreen({
    Key? key,
    required this.onSupplyAdded,
    required this.user,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddSupplyScreenState createState() => _AddSupplyScreenState();
}

class _AddSupplyScreenState extends State<AddSupplyScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var _pickImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Tedarik Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Colors.black), // Başlık rengini buradan ayarlayın
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Colors.black), // Başlık rengini buradan ayarlayın
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sectorController,
              decoration: const InputDecoration(
                labelText: 'Sector',
                labelStyle: TextStyle(
                    color: Colors.black), // Başlık rengini buradan ayarlayın
              ),
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 20),
            const SizedBox(height: 10),
            // Dosya ekleme ikonu
            InkWell(
              onTap: _pickImage, // Dosya ekleme işlevini tetikleyen fonksiyon
              child: const Icon(
                Icons.drive_folder_upload,
                size: 40,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add supply logic here
                final newSupply = Supply(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  sector: _sectorController.text,
                  createdBy: widget.user,
                  imageUrl: 'anonim.png',
                );

                widget.onSupplyAdded(newSupply);
                Navigator.pop(context);
              },
              child: const Text('Add Supply'),
            ),
          ],
        ),
      ),
    );
  }
}

class Supply {
  final String title;
  final String description;
  final String sector;
  final User createdBy;
  final String imageUrl;

  Supply({
    required this.title,
    required this.description,
    required this.sector,
    required this.createdBy,
    required this.imageUrl,
  });
}
