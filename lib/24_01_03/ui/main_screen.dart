import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_03/data/model/image_item.dart';
import 'package:flutter_image_search_my_app/24_01_03/ui/widget/image_item_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: '검색',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final imageItem = ImageItem(
                        imageUrl: 'https://cdn.pixabay.com/photo/2023/12/06/08/41/mountain-8433234_1280.jpg',
                        tags: 'mountain',
                      );
                      return ImageItemWidget(imageItem: imageItem);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
