import 'package:flutter/material.dart';

class SelectProvider extends ChangeNotifier {
  List<String> titles = ['Sun', 'Moon', 'Star', 'Sun', 'Moon', 'Star'];
  List<String> titles2 = [];


  FixedExtentScrollController thismonth = FixedExtentScrollController();
  FixedExtentScrollController thisyear = FixedExtentScrollController();

  bool show = false;
  setDisplay(bool disp){
    show = disp;
    notifyListeners();
  }


  void Select(String value) {
    //titles.insert(index, 'Planet');

    titles2.add(value);
    print(titles2);
    int index = titles.indexOf(value);
    titles.removeAt(index);

    notifyListeners();
  }

  void unSelect(String val) {
    titles.add(val);
    print(titles2);
    int index2 = titles2.indexOf(val);
    titles2.removeAt(index2);

    notifyListeners();
  }

  //void onItemTapped(int selectedIndex){

    //notifyListeners();
  //}




}
