import 'package:flutter/cupertino.dart';

class MyModel extends ChangeNotifier {
  //                                               <--- MyModel
  int someValue = 0;

  void doSomething() {
    ++someValue;
    print(someValue);
    notifyListeners();
  }
}
