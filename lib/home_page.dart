import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(stateProvider); // Instance of State Provider

    final future = ref.watch(futureProvider); // Instance of Future Provider

    final stream = ref.watch(streamProvider); // Instance of Stream Provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('State Provider'),
            Text(
              // Displaying the State of the State Provider
              counter.toString(),
            ),
            const Divider(),
            const Text('Future Provider'),
            future.when(
              // Access the data in Future Provider
              data: (data) {
                return Text(data.toString());
              },
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: (() {
                return const CircularProgressIndicator();
              }),
            ),
            const Divider(),
            const Text('Stream Provider'),
            stream.when(
              // Access the data in Stream Provider
              data: (data) {
                return Text(data.toString());
              },
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: (() {
                return const CircularProgressIndicator();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          // Changing the state of State Provider
          ref.read(stateProvider.notifier).state++;
        }),
      ),
    );
  }
}
