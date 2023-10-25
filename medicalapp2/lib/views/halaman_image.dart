// halaman_image.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicalapp/controllers/image_controller.dart';
import 'package:medicalapp/models/image_model.dart';
import 'dart:io';

import 'package:medicalapp/views/halaman_editimage.dart';

class ImagePage extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());

  Future<void> getImage(ImageSource source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final title = "Judul Gambar"; // Gantilah dengan input yang sesuai
      final description = "Deskripsi Gambar"; // Gantilah dengan input yang sesuai

      final imageModel = ImageModel(
        title: title,
        description: description,
        imagePath: pickedFile.path,
      );

      imageController.addImage(imageModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gambar'),
        backgroundColor: Color(0xFF7165D6),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: imageController.images.length,
          itemBuilder: (context, index) {
            final image = imageController.images[index];
            return ListTile(
              title: Text(image.title),
              subtitle: Text(image.description),
              leading: Image.file(File(image.imagePath)),
              onTap: () {
                Get.to(EditImagePage(index: index)); // Navigasi ke halaman edit
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Pilih Gambar'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Galeri'),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Kamera'),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF7165D6),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}