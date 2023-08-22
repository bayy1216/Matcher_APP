import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider = StateNotifierProvider<BottomNavStateNotifier,int>((ref) => BottomNavStateNotifier());


class BottomNavStateNotifier extends StateNotifier<int>{
  BottomNavStateNotifier() : super(0);

  final List<int> _bottomHistory = [0];

  int get prev => _bottomHistory.length>1?_bottomHistory[_bottomHistory.length-2]:0;

  void changePage(int value){
    state= value;
    if(!_bottomHistory.contains(value)){
      _bottomHistory.add(value);
    }
    else{
      _bottomHistory.remove(value);
      _bottomHistory.add(value);
    }
    log('bottom_nav : $_bottomHistory');
  }

  Future<bool> willPopAction() async {
    if (_bottomHistory.length>1){
      _bottomHistory.removeLast();
      state = _bottomHistory.last;
      log('bottom_nav : $_bottomHistory');
      return false;
    }
    return true;
  }
}