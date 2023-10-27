import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/prefs_history_repository.dart';

final searchNotifierProvider = AsyncNotifierProvider.autoDispose
    .family<SearchNotifier, List<String>, String>(SearchNotifier.new);

class SearchNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<String>, String> {
  late final PrefsHistoryRepository _repository;
  late final String _prefsKey;

  @override
  FutureOr<List<String>> build(String arg) async {
    _prefsKey = arg;
    _repository = PrefsHistoryRepository(
      prefsKey: _prefsKey,
      prefs: await SharedPreferences.getInstance(),
    );
    return _repository.getHistory();
  }

  addHistory(String keyword) async {
    if (state.value!.contains(keyword)) return;
    final pState = [
      keyword,
      ...?state.value,
    ];
    _repository.setHistory(history: pState);
    state = AsyncData(pState);
  }

  removeHistory(String keyword) async {
    final pState = state.value!.where((element) => element != keyword).toList();
    _repository.setHistory(history: pState);
    state = AsyncData(pState);
  }

  removeAllHistory() async {
    _repository.setHistory(history: []);
    state = const AsyncData([]);
  }
}
