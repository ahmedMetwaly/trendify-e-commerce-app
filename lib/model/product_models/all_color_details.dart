
class AllColorDetailImages {
  List? colorKeys;
  List? images;
  List<Map<String,List<String>>>? colorImages;
  AllColorDetailImages();

  AllColorDetailImages.fromJson(Map<String, dynamic> json) {
    colorKeys = json.keys.toList();
    List colorValues = json.values.toList();
    List<String> images = [];
    List<Map<String,List<String>>> data = [];
    for (int i = 0; i < colorValues.length; i++) {
      for (var image in colorValues[i]) {
        images.add(ImageUrl.fromJson(image).originImage??"");
      }
     Map<String,List<String>> entry = {colorKeys![i]: images};
      data.add(entry);
      images = [];
    }
    colorImages = data;
  }
}

class ImageUrl {
  String? originImage;

  ImageUrl({originImage});

  ImageUrl.fromJson(Map<String, dynamic> json) {
    originImage = json['origin_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['origin_image'] = originImage;
    return data;
  }
}
