import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/repository/image_item_repository.dart';

import '../data/model/image_item.dart';

final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository;

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = (await _repository.getImageItems(query)).take(20).toList();

    _isLoading = false;
    notifyListeners();
  }
}
