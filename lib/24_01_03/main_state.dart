import 'package:flutter_image_search_my_app/24_01_03/data/model/image_item.dart';

class Mainstate {
  final List<ImageItem> imageItems;
  final bool isLoading;

//<editor-fold desc="Data Methods">
  Mainstate({
    required this.imageItems,
    required this.isLoading,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mainstate &&
          runtimeType == other.runtimeType &&
          imageItems == other.imageItems &&
          isLoading == other.isLoading);

  @override
  int get hashCode => imageItems.hashCode ^ isLoading.hashCode;

  @override
  String toString() {
    return 'Mainstate{' +
        ' imageItems: $imageItems,' +
        ' isLoading: $isLoading,' +
        '}';
  }

  Mainstate copyWith({
    List<ImageItem>? imageItems,
    bool? isLoading,
  }) {
    return Mainstate(
      imageItems: imageItems ?? this.imageItems,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageItems': this.imageItems,
      'isLoading': this.isLoading,
    };
  }

  factory Mainstate.fromMap(Map<String, dynamic> map) {
    return Mainstate(
      imageItems: map['imageItems'] as List<ImageItem>,
      isLoading: map['isLoading'] as bool,
    );
  }

//</editor-fold>
}
