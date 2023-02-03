import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class StatesProvider with ChangeNotifier {
  int counter = 0;
  String area = "";
  String buildingToyosu ="";
  String buildingOhmiya ="";
  String roomToyosu ="";
  String roomOhmiya ="";

  String nowBuilding = "";
  String nowRoom = "";

  DateTime carenderNow = DateTime.now();



  //状態を変化させる処理（ボタンを押した時に実行される処理）
  void incrementCounter() {
    counter++;
    notifyListeners();
  }
  void setArea(String value){
    area = value;
    buildingToyosu ="";
    buildingOhmiya ="";
    roomToyosu ="";
    roomOhmiya ="";
    nowBuilding = "";
    notifyListeners();
  }
  void setBuildingToyosu(String value){
    buildingToyosu = value;
    nowBuilding = value;
    notifyListeners();
  }

  void setBuildingOhmiya(String value){
    buildingOhmiya = value;
    nowBuilding = value;
    notifyListeners();
  }

  void setRoomToyosu(String value){
    roomToyosu = value;
    nowRoom = value;
    notifyListeners();
  }

  void setRoomOhmiya(String value){
    roomOhmiya = value;
    nowRoom = value;
    notifyListeners();
  }

  void setNewday(DateTime value){
    carenderNow = value;
    notifyListeners();
  }
}
