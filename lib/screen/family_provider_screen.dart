import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../riverpod/family_provider.dart';

class FamilyProviderScreen extends ConsumerWidget {
  const FamilyProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> numbers = ref.watch(familyModifierProvider(5));

    return DefaultLayout(
      title: 'Family Provider',
      body: Center(
        child: numbers.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
