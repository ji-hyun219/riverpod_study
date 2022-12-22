// didUpdateProvider
// 모든 하위에 있는 프로바이더들이 업데이트됬을 때 호출

// Provierbase - 어떤 프로바이더가 업데이트인지
// container 는 신경 안써도 됨

// didAddProvider
// 프로바이더를 추가하면 호출됨
// 화면 들어가면 호출됨

// didDisposeProvier
// 예를 들어 AutoDisposeProvider 의 경우 화면 삭제되면 프로바이더가 삭제된다고 했다
// 이때 호출됨

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // Provider가 새로 생성됐을때
  @override
  void didAddProvider(
    // 생성된 Provider
    ProviderBase provider,
    // Provider 상태값
    Object? value,
    // Provider를 담고있는 Container (Flutter 사용시 신경 X)
    ProviderContainer container,
  ) {
    print('[Provider Added] provider : $provider / value : $value / container : $BoxFit.contain');
  }

  // Provider가 삭제됐을때
  @override
  void didDisposeProvider(
    // 삭제된 Provider
    ProviderBase provider,
    // Provider를 담고있는 Container (Flutter 사용시 신경 X)
    ProviderContainer containers,
  ) {
    print('[Provider Disposed] provider : $provider / containers : $containers');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print(
      '[Provider Updated] provider : $provider / previousValue : $previousValue / newValue : $newValue / container : $container',
    );
  }
}
