import 'package:get/get.dart';
import 'package:medicalapp/models/image_model.dart';

class ImageController extends GetxController {
  final RxList<ImageModel> images = <ImageModel>[].obs;

  // Fungsi untuk menambahkan gambar ke daftar
  void addImage(ImageModel image) {
    images.add(image);
  }

  // Fungsi untuk memperbarui gambar dalam daftar
  void updateImage(int index, String newTitle, String newDescription) {
    if (index >= 0 && index < images.length) {
      final ImageModel image = images[index];
      if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
        image.title = newTitle;
        image.description = newDescription;
      }
    }
  }
  
  // Fungsi lain sesuai kebutuhan (misalnya, menghapus gambar)
}
