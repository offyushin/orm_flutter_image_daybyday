import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.green,
                ),
              ),
                  hintText: '검색하세요',
                  suffixIcon: Icon(
                      MingCute.search_2_fill,
                  color: Colors.green,),
            )),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Text('dddddddddddddddddddddd');
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
