import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/23_12_27/data/model/image_item.dart';
import 'package:flutter_image_search_my_app/23_12_27/data/repository/image_item_repository.dart';
import 'package:flutter_image_search_my_app/23_12_27/ui/widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  final repository = DummyImageItemRepository();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    setState(() {
      isLoading = true;
    });

    imageItems = await repository.getImageItems(query);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: '검색',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                    onPressed: () =>
                        searchImage(searchTextEditingController.text),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        itemCount: imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
