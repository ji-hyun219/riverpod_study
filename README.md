# riverpod_study

Flutter 상태관리 중 하나인 riverpod 에 대해서 학습해봅니다

&nbsp;

### 🧐 12월 18일 학습내용

#### Riverpod 학습

```
메인에다가 ProviderScope 추가해줘야 함
statelessWidget 자리에 ConsumerWidget 을 넣어줌
그리고 buildContext 외에 WidgetRef 를 하나 더 생성.
이렇게 하면 stateProvider 에 접근할 수 있다
```

- `ref.read`, `ref.listen`, `ref.watch` 이 세가지가 중요하다

- `watch` : 무언가 값이 변경되었을 때 빌드를 또 실행하고 싶은 경우 (특정 provider 를 바라보고 있다가 변경되면 빌드를 실행)

- 빌드 UI 에 반영하는건 `watch`

- 버튼을 무언가 눌렀을 때 실행하는 경우가 `read`

```dart
ref.read(numberProvider.notifier).update((state) => );
```

여기서 `state` 는 지금 현재 상태이다

- 원래 페이지 이동할 때 인자값을 넘겨줘서 똑같은 값을 공유할 수 있게 하는데 riverpod 는 똑같이 watch 만 하고 있으면 데이터를 공유할 수 있다!!!

- 데이터의 근원은 하나이다 (중요)

- `ref.read` 값 업데이트 방법:

1. update 메서드를 이용한다
2. .state 를 사용해서 직접 상태값을 대입해서 바꿔줄 수 있다

&nbsp;

### 🧐 12월 19일 학습내용

#### StateNotiferProvider

```
stste_notifier_provider
class 를 사용한다
```

- state_notifier_provider.dart 에 정리해놓았음

#### FutureProvider

- 여태까지 동기 작업을 하였음. 이제 비동기 작업을 한다고 가정하면 FutureProvider 를 사용
- 근데 많이 사용하지 않는다. (이런게 있다는 것을 알아두기)

```dart
final state = ref.watch(multiplesFutureProvider);

// state.when
// state.map
```

- `when`, `map` 메서드가 존재
- `when`: `data` (로딩이 끝나서 데이터가 있을 때 실행하는 것), `error` (에러일때 실행), `loading`(로딩될 때 실행) 세가지가 다 함수이다

#### StreamProvider

- stream 이니까 async\*

#### Modifier

- Family Modifier, AutoDispose Modifier 가 있다

#### Family Modifier

- FutureProvider 와 비슷한데 family 라는 속성이 있다

```dart
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) =>  index * data); // data 는 int 로 받아온다
})

// screen
final state = ref.watch(familyModifierProvider(3)); // 3 을 넣어준다
```

- family 를 하면 FutureProvider 와 다르게 두번째 인자를 받게 된다 -> data
