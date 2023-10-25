class ImageModel {
  String title;
  String description;
  final String imagePath;

  ImageModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  set setTitle(String newTitle) {
    title = newTitle;
  }

  set setDescription(String newDescription) {
    description = newDescription;
  }
}
