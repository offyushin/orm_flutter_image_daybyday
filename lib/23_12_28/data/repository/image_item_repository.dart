import 'package:flutter_image_search_my_app/23_12_27/data/data_source/pixabay_api.dart';
import 'package:flutter_image_search_my_app/23_12_27/data/mapper/image_mapper.dart';
import 'package:flutter_image_search_my_app/23_12_27/data/model/image_item.dart';

abstract interface class ImageItemRepository {}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  Future<List<ImageItem>> getImage(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((hits) => hits.toImageItem()).toList();
  }
}
