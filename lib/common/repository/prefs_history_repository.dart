import 'package:shared_preferences/shared_preferences.dart';

class PrefsHistoryRepository{
  final SharedPreferences _prefs;
  final String _prefsKey;
  PrefsHistoryRepository({
    required SharedPreferences prefs,
    required String prefsKey,
  }) : _prefsKey = prefsKey, _prefs = prefs;

  List<String> getHistory() {
    return _prefs.getStringList(_prefsKey) ?? [];
  }

  setHistory({required List<String> history}){
    _prefs.setStringList(_prefsKey, history);
  }

}