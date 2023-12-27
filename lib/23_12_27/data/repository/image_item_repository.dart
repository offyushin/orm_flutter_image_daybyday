import 'package:flutter_image_search_my_app/23_12_27/data/model/image_item.dart';

class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query) async {
    return [
      ImageItem(
          imageUrl: 'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
          tags: ''),
      ImageItem(
          imageUrl: 'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
          tags: ''),
      ImageItem(
          imageUrl: 'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
          tags: ''),
    ];
  }
}
