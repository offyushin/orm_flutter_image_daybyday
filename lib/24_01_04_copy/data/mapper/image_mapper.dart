import 'package:flutter_image_search_my_app/24_01_04_copy/data/dto/pixabay_dto.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/data/model/image_item.dart';

extension DtotToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/06/28/1a5a20db-c586-4676-b68f-aad83b3bd457.jpg',
      tags: tags ?? '',
    );
  }
}
