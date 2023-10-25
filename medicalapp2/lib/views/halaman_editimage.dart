// halaman_editimage.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/controllers/image_controller.dart';
import 'package:medicalapp/models/image_model.dart';

class EditImagePage extends StatefulWidget {
  final ImageController imageController = Get.find();
  final int index;

  EditImagePage({required this.index});

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    final ImageModel image = widget.imageController.images[widget.index];
    titleController.text = image.title;
    descriptionController.text = image.description;
    super.initState();
  }

  // Di halaman_editimage.dart, setelah mengedit gambar:
  void updateImage() {
    widget.imageController.updateImage(
    widget.index,
    titleController.text,
    descriptionController.text,
  );

  // Memperbarui daftar gambar
    widget.imageController.images.refresh();

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Gambar'),
        backgroundColor: Color(0xFF7165D6),
        actions: [
          TextButton(
            onPressed: updateImage,
            child: Text('Simpan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul Gambar'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi Gambar'),
            ),
          ],
        ),
      ),
    );
  }
}
