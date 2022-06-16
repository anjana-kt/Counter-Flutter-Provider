import 'package:flutter/widgets.dart';

class Count extends ChangeNotifier{
  int count=0;

  void add(){
    count++;
    notifyListeners();
  }

}