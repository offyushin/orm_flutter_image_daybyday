import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/core/result.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/data/model/image_item.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/ui/main_event.dart';

import '../data/repository/image_item_repository.dart';
import '../main_state.dart';


final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  final _evnetController = StreamController<MainEvent>();

  Stream<MainEvent> get evnetController => _evnetController.stream;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageItems(query);
    switch (result) {
      case Success<List<ImageItem>>():
    _state = state.copyWith(
    isLoading: false,
    imageItems: result.data.take(30).toList(),
    );
    notifyListeners();
    _evnetController.add(const MainEvent.showSnackBar('성공'));
      case Error<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        _evnetController.add(MainEvent.showSnackBar(result.e.toString()));
      case Loading<List<ImageItem>>():
    }
  }
}