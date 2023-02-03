import 'package:flutter/material.dart';

//curl -vvv -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ABCDEFGHIJKLMNOPQRSTUVWZYZ0123456789abcdefg" --insecure  https://varata.sic.shibaura-it.ac.jp/varata/api/building
//で取得できちゃう。この定数は不要になりそう

//staticつければインスタンス化せずに呼び出し可能。
class Consts{
  //Area
  static  List<String> area = <String>['','豊洲キャンパス(TOYOSU)','大宮キャンパス(OHMIYA)'];
  static const OHMIYA_CAMPUS = '大宮キャンパス(OHMIYA)';
  static const TOYOSU_CAMPUS = '豊洲キャンパス(TOYOSU)';

  //Building
  static  List<String> buildingToyosu = <String>['','豊洲 教室棟(KYOSHITSU BUILDING)','豊洲 交流棟(KOURYU BUILDING)','豊洲 本部棟(HONBU BUILDING)'];
  static const T_KYOSHITSU_TOU = '豊洲 教室棟(KYOSHITSU BUILDING)';
  static const T_KOURYU_TOU = '豊洲 交流棟(KOURYU BUILDING)';
  static const T_HONBU_TOU = '豊洲 本部棟(HONBU BUILDING)';

  static  List<String> buildingOhmiya = <String>['','大宮 1号棟(1 BUILDING)','大宮 2号棟(2 BUILDING)','大宮 3号棟(3 BUILDING)'];
  static const O_ONE_TOU = '大宮 1号棟(1 BUILDING)';
  static const O_TWO_TOU = '大宮 2号棟(2 BUILDING)';
  static const O_THREE_TOU = '大宮 3号棟(3 BUILDING)';

  //room
  static  List<String> roomToyosu = <String>['','豊洲 101教室(101 room)','豊洲 102教室(102 room)','豊洲 103教室(103 room)','豊洲 201教室(201 room)','豊洲 202教室(202 room)'];
  static const T_101 = '豊洲 101教室(101 room)';
  static const T_102 = '豊洲 102教室(102 room)';
  static const T_103 = '豊洲 103教室(103 room)';
  static const T_201 = '豊洲 201教室(201 room)';
  static const T_202 = '豊洲 202教室(202 room)';
  static const T_203 = '豊洲 203教室(203 room)';

  static  List<String> roomOhmiya = <String>['','大宮 101教室(101 room)','大宮 102教室(102 room)','大宮 103教室(103 room)','大宮 201教室(201 room)','大宮 202教室(202 room)'];
  static const O_101 = '大宮 101教室(101 room)';
  static const O_102 = '大宮 102教室(102 room)';
  static const O_103 = '大宮 103教室(103 room)';
  static const O_201 = '大宮 201教室(201 room)';
  static const O_202 = '大宮 202教室(202 room)';
  static const O_203 = '大宮 203教室(203 room)';

}