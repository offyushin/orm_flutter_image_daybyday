import 'dart:async';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

final class MainViewModel {
  final _repository = PixabayImageItemRepository();
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  final _loadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _loadingController.stream;

  Future<void> searchImage(String query) async {
    _loadingController.add(true);
    _imageItems = await _repository.getImageItems(query);
    _loadingController.add(false);
  }
}