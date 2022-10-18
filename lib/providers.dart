import 'package:riverpod/riverpod.dart';

// State Provider
final stateProvider = StateProvider.autoDispose<int>((ref) => 0);

// Future Provider
final futureProvider = FutureProvider.autoDispose<String>(((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Lance';
}));

// Stream Provider
final streamProvider = StreamProvider.autoDispose<int>(((ref) {
  return Stream.periodic(const Duration(seconds: 2), (int num) {
    return num + 1;
  });
}));
