import 'package:flutter_image_search_my_app/24_01_04_copy/core/result.dart';

import '../model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}
