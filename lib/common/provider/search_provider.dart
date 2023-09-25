import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final searchNotifierProvider = AsyncNotifierProvider.autoDispose
    .family<SearchNotifier, List<String>, String>(SearchNotifier.new);

class SearchNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<String>, String> {
  late final SharedPreferences _prefs;
  late final String _prefsKey;

  @override
  FutureOr<List<String>> build(String arg) async {
    _prefsKey = arg;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getStringList(arg) ?? [];
  }

  addHistory(String keyword) async {
    if (state.value!.contains(keyword)) return;
    final pState = [
      keyword,
      ...?state.value,
    ];
    final history = _prefs.getStringList(_prefsKey) ?? [];
    final pHistory = [keyword, ...history];
    _prefs.setStringList(_prefsKey, pHistory);
    state = AsyncData(pState);
  }

  removeHistory(String keyword) async {
    final pState = state.value!.where((element) => element != keyword).toList();
    final history = _prefs.getStringList(_prefsKey) ?? [];
    history.remove(keyword);
    _prefs.setStringList(_prefsKey, history);
    state = AsyncData(pState);
  }

  removeAllHistory() async {
    _prefs.setStringList(_prefsKey, []);
    state = const AsyncData([]);
  }
}
