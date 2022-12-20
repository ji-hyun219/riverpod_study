import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  // statefulwidget 바꾸면 ConsumerStatefulWidget
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ListenProviderScreenState createState() => ListenProviderScreenState();
}

class ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin {
  // state 앞에 consumer 붙이기 -> ConsumerState
  // buildcontext 이외에 두번째 파라미터를 받지 않음
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read<int>(listenProvider), // initialIndex 에 ref.read(listenProvider) 넣어주기 (값 기억)
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      // <int> : 값 반환 타입 정의
      print('run');
      if (previous != next) {
        tabController.animateTo(
          next,
          duration: const Duration(seconds: 1),
        );
      }
    });

    return DefaultLayout(
      title: 'ListenProvider',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        // 스크롤에 의해서 움직이지 못하도록 NeverScrollabelScrollPhysics
        controller: tabController,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('TAB : ${index + 1}', textAlign: TextAlign.center),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state - 1);
                      },
                      child: const Text('뒤로'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const _NextScreen(),
                          ),
                        );
                      },
                      child: const Text('다음페이지'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state + 1);
                      },
                      child: const Text('다음'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: 'NextScreen',
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state - 1);
                },
                child: const Text('뒤로'),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state + 1);
                },
                child: const Text('다음'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
