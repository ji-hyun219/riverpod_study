import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
