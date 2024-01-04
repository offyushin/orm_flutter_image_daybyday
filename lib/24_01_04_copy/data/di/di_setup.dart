import 'package:get_it/get_it.dart';
import '../../ui/main_view_model.dart';
import '../repository/image_item_repository.dart';
import '../repository/image_item_repository_impl.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemReopositoryImpl());

  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepository>()));
}