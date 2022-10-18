import 'package:flutter/material.dart';
import 'package:riverpod_demo/home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
            color: Colors.blue,
            child: const Text('Go to next page'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
      ),
    );
  }
}
