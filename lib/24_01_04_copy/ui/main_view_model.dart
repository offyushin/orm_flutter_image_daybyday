import 'dart:async';

import 'package:flutter/material.dart';

import '../data/repository/image_item_repository.dart';
import '../main_state.dart';


final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainState _state = MainState();

  MainState get state => _state;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = (await _repository.getImageItems(query)).take(20).toList();
    _state = state.copyWith(
      isLoading: false,
      imageItems: results,
    );
    notifyListeners();
  }
}
