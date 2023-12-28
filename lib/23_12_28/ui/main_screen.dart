import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/23_12_28/data/model/image_item.dart';
import 'package:flutter_image_search_my_app/23_12_28/ui/widget/imge_item_widget.dart';
import 'package:icons_plus/icons_plus.dart';

import '../data/repository/image_item_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchText = TextEditingController();

  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: searchText,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: const BorderSide(
                    width: 4,
                    color: Colors.green,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(
                    width: 5,
                    color: Colors.green,
                  ),
                ),
                hintText: '검색하세요',
                suffixIcon: IconButton(
                  icon: const Icon(
                    MingCute.search_2_fill,
                    color: Colors.green,
                  ),
                  onPressed: () => setState(() {}),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder<List<ImageItem>>(
                future: PixabayImageItemRepository().getImage(searchText.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final imageItems = snapshot.data!;
                  return Expanded(
                    child: GridView.builder(
                      itemCount: imageItems.length,
                      itemBuilder: (context, index) {
                        final imageItem = imageItems[index];
                        return ImageItemWidget(imageItem: imageItem);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                    ),
                  );
                })
          ],
        ),
      )),
    );
  }
}
