
import 'package:flutter_image_search_my_app/24_01_04_copy/data/mapper/image_mapper.dart';

import '../../core/result.dart';
import '../data_source/pixabay_api.dart';
import '../model/image_item.dart';
import 'image_item_repository.dart';

class ImageItemReopositoryImpl implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    try {
      final dto = await _api.getImagesResult(query);

      if (dto.hits == null) {
        return Result.success([]);
      }
      return Result.success(dto.hits!.map((e) => e.toImageItem()).toList());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}