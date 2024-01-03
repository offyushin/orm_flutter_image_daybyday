import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    _imageItems = await repository.getImageItems(query);
  }
}