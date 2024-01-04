import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/ui/main_event.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/ui/main_view_model.dart';
import 'package:flutter_image_search_my_app/24_01_04_copy/ui/widget/image_item_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchText = TextEditingController();

  StreamSubscription<MainEvent>? subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      subscription = context.read<MainViewModel>().evnetController.listen((event) {
        switch (event) {
          case ShowSnackBar():
            final snackBar = SnackBar(
              content: Text(event.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowDialog():
        }
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: '검색',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      await viewModel.searchImage(searchText.text);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: state.imageItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                        itemBuilder: (context, index) {
                          final imageItem = state.imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
