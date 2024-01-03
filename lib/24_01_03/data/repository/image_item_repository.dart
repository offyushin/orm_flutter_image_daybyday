import 'package:flutter_image_search_my_app/24_01_03/data/data_source/pixabay_api.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/mapper/image_mapper.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
