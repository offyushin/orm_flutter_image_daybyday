import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextField(),
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
      )),
    );
  }
}
