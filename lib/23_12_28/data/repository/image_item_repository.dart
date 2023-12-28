import '../data_source/pixabay_api.dart';
import '../dto/pixabaydto.dart';
import '../model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImage(String query);
}

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90',
      tags: tags ?? '',
    );
  }
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImage(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      List<ImageItem> result = [];
      return result;
    }

    return dto.hits!.map((hits) => hits.toImageItem()).toList();
  }
}
