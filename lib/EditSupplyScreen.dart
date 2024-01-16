import 'package:flutter/material.dart';
import 'AddSupplyScreen.dart';



class EditSupplyScreen extends StatefulWidget {
  final Supply initialSupply;

  const EditSupplyScreen({Key? key, required this.initialSupply})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditSupplyScreenState createState() => _EditSupplyScreenState();
}

class _EditSupplyScreenState extends State<EditSupplyScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _sectorController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialSupply.title);
    _descriptionController =
        TextEditingController(text: widget.initialSupply.description);
    _sectorController =
        TextEditingController(text: widget.initialSupply.sector);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tedarik Düzenle'),
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
                    color: Colors.black), // Label rengini buradan ayarlayın
              ),
              style: const TextStyle(
                  color: Colors.black), // Metin rengini buradan ayarlayın
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Colors.black), // Label rengini buradan ayarlayın
              ),
              style: const TextStyle(
                  color: Colors.black), // Metin rengini buradan ayarlayın
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sectorController,
              decoration: const InputDecoration(
                labelText: 'Sector',
                labelStyle: TextStyle(
                    color: Colors.black), // Label rengini buradan ayarlayın
              ),
              style: const TextStyle(
                  color: Colors.black), // Metin rengini buradan ayarlayın
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final editedSupply = Supply(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  sector: _sectorController.text,
                  createdBy: widget.initialSupply.createdBy,
                  imageUrl: 'anonim.png',
                );

                Navigator.pop(context, editedSupply);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
