import 'package:flutter_image_search_my_app/23_12_27/data/model/image_item.dart';

class DummyImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query) async {
    await Future.delayed(Duration(seconds: 1));

    if (query == 'apple') {
      return [
        ImageItem(
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
            tags: ''),
        ImageItem(
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
            tags: ''),
        ImageItem(
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
            tags: ''),
      ];
    } else {
      return [
        ImageItem(
            imageUrl: 'https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg',
            tags: ''),
        ImageItem(
            imageUrl: 'https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg',
            tags: ''),
      ];
    }
  }
}
