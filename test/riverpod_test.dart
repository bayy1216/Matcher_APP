import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final noteListStateProvider = StateNotifierProvider<PostingStateNotifier, PostingList>((ref) => PostingStateNotifier());

class Listener extends Mock {
  void call(PostingList? previous, PostingList value);
}

///flutter test test/riverpod_test.dart
void main() {
  group('노트 앱 Provider 기능 테스트', () {

    test('처음 생성시 노트 목록은 비어있다.', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<PostingList>(
        noteListStateProvider,
        listener,
        fireImmediately: true,
      );

      verify(listener(null, PostingList(postings: []))).called(1);
      verifyNoMoreInteractions(listener);
    });

    test('노트 삭제시 노트 목록에서 제거된다.', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<PostingList>(
        noteListStateProvider,
        listener,
        fireImmediately: true,
      );

      verify(listener(null, PostingList(notes: []))).called(1);
      verifyNoMoreInteractions(listener);

      container
          .read(noteListStateProvider.notifier)
          .createNote(title: title, body: body);

      verify(listener(PostingList(notes: []),
          PostingList(postings: [Posting(id: 0, title: title, body: body)]))).called(1);
      verifyNoMoreInteractions(listener);

      container.read(noteListStateProvider.notifier).deleteNote(0);

      verify(listener(PostingList(postings: [Posting(id: 0, title: title, body: body)]),
          PostingList(postings: []))).called(1);
      verifyNoMoreInteractions(listener);
    });

  });
}