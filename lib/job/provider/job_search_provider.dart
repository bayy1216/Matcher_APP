import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final jobSearchNotifierProvider = AsyncNotifierProvider<JobSearchNotifier,List<String>>(JobSearchNotifier.new);

class JobSearchNotifier extends AsyncNotifier<List<String>>{
  late final SharedPreferences _prefs;
  @override
  Future<List<String>> build() async{
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getStringList('jobSearchHistory') ?? [];
  }
  
  addHistory(String keyword) async{
    if(state.value!.contains(keyword)) return;
    final pState = [
      keyword,
      ...?state.value,
    ];
    final history = _prefs.getStringList('jobSearchHistory') ?? [];
    final pHistory = [keyword, ...history];
    _prefs.setStringList('jobSearchHistory', pHistory);
    state = AsyncData(pState);
  }
  removeHistory(String keyword) async{
    final pState = state.value!.where((element) => element != keyword).toList();
    final history = _prefs.getStringList('jobSearchHistory') ?? [];
    history.remove(keyword);
    _prefs.setStringList('jobSearchHistory', history);
    state = AsyncData(pState);
  }
  removeAllHistory() async{
    _prefs.setStringList('jobSearchHistory', []);
    state = const AsyncData([]);
  }
}