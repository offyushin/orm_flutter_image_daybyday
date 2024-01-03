import 'package:flutter_image_search_my_app/24_01_03/data/repository/image_item_repository.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/repository/image_item_repository_impl.dart';
import 'package:flutter_image_search_my_app/24_01_03/ui/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemReopositoryImpl());

  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepository>()));
}