import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/repository/image_item_repository.dart';
import 'package:flutter_image_search_my_app/24_01_03/main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  Mainstate _state =
      Mainstate(imageItems: List.unmodifiable([]), isLoading: false);

  Mainstate get state => _state;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    _state = state.copyWith(
      isLoading: false,
      imageItems: List.unmodifiable(
          (await _repository.getImageItems(query)).take(20).toList()),
    );
    notifyListeners();
  }
}
