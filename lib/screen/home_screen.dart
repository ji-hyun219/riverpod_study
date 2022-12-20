import 'package:flutter/material.dart';
import 'package:riverpod_study/layout/default_layout.dart';
import 'package:riverpod_study/screen/auto_dispose_modifier_screen.dart';
import 'package:riverpod_study/screen/family_provider_screen.dart';
import 'package:riverpod_study/screen/future_provider_screen.dart';
import 'package:riverpod_study/screen/listen_provider_screen.dart';
import 'package:riverpod_study/screen/state_notifier_provider_screen.dart';
import 'package:riverpod_study/screen/state_provider_screen.dart';

import 'stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'HomeScreen',
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StateProviderScreen(),
                  ));
                },
                child: const Text('StateProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StateNotifierProviderScreen(),
                  ));
                },
                child: const Text('StateNotifierScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FutureProviderScreen(),
                  ));
                },
                child: const Text('FutureProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StreamProviderScreen(),
                  ));
                },
                child: const Text('StreamProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FamilyProviderScreen(),
                  ));
                },
                child: const Text('FamilyProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AutoDisposeScreen(),
                  ));
                },
                child: const Text('AutoDisposeScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ListenProviderScreen(),
                  ));
                },
                child: const Text('ListenProviderScreen'))
          ],
        ));
  }
}
