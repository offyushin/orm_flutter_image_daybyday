import 'package:flutter_image_search_my_app/24_01_03/data/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}
