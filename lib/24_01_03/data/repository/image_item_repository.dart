import 'package:flutter_image_search_my_app/24_01_03/data/model/image_item.dart';

class ImageItemREpositoy {
  Future<List<ImageItem>> getImageItems(String query) async {
    return [
      ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2023/12/06/08/41/mountain-8433234_1280.jpg',
          tags: ''),
      ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2023/10/20/19/25/moon-8330104_640.png',
          tags: ''),
      ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2023/11/26/17/52/flowers-8414039_640.jpg',
          tags: ''),
      ImageItem(
          imageUrl:
              'https://cdn.pixabay.com/photo/2023/11/02/10/19/bird-8360220_640.jpg',
          tags: ''),
    ];
  }
}
