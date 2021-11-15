import 'package:flutter/cupertino.dart';
import 'package:lifesum/model/api_get_model.dart';
import 'package:provider/provider.dart';

class ApiProvider with ChangeNotifier {
  List<ApiGetModel> apiList = [];
  int state = 0;

  void setData (   List<ApiGetModel> apiList , int state   ){
    this.apiList = apiList;
    this.state = state;
    notifyListeners();
  }
}