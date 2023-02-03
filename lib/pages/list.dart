import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:yoyaku_test/values_test.dart';
import 'package:intl/intl.dart';

import 'package:yoyaku_test/main.dart';
import '/utils/states.dart';
import '/utils/styles.dart';
import '/utils/consts.dart';
import 'package:yoyaku_test/api.dart';

Future<List<Reserve>?> _readServer() async {
  VarataRestAPI api = new VarataRestAPI();

  List<Reserve> _resv_list = await api.getMyReserve('ABCDEFGHIJKLMNOPQRSTUVWZYZ0123456789abcdefg') as List<Reserve>;

  return _resv_list;
}


Future _pickDate(BuildContext context) async {
  //DatePickerの初期値
  final initialDate = DateTime.now();
  //DatePickerを表示し、選択されたら変数に格納する
  final newDate = await showDatePicker(
      context: context,
      //初期値を設定
      initialDate: initialDate,
      //選択できる日付の上限
      firstDate: DateTime(DateTime
          .now()
          .year - 2),
      lastDate: DateTime(DateTime
          .now()
          .year + 2),

      selectableDayPredicate: (DateTime date) {
        //print(date.compareTo(initialDate));
        bool auth_flg;
        int after;
        auth_flg = true;
        if (auth_flg) {
          after = date.compareTo(initialDate.add(Duration(days: 14)));
        } else {
          after = date.compareTo(initialDate.add(Duration(days: 7)));
        }
        int before = date.compareTo(initialDate.add(Duration(days: -1)));
        if (after == 1 || before == -1) {
          return false;
        }
        return true;
      },
      locale: Locale('ja')
  );
  return newDate;
}

class List_Reserve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StatesProvider statesProvider =
    Provider.of<StatesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(statesProvider.area + statesProvider.nowBuilding + statesProvider.nowRoom),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15.0),
            ElevatedButton(
                onPressed: (){showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Aの動作の確認'),
                      );
                    });},
                child: Text('今すぐ予約')
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
                onPressed: (){
                  _pickDate(context).then((value) =>statesProvider.setNewday(value));
                  },
                child: Text('別の日の予約をする')
            ),
            ElevatedButton(
                onPressed: (){
                  _readServer().then((value) => debugPrint(value.toString()));
                },
                child: Text('予約リストを取得')
            ),
            const SizedBox(height: 15.0),
            Text(DateFormat('yyyy年MM月dd日').format(statesProvider.carenderNow).toString() + 'の予約状況'),
            const SizedBox(height: 15.0),
            for (int i = 0; i < TIMES.length; i++)
            Container(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                    ),
                    padding: EdgeInsets.all(1),
                    margin: EdgeInsets.all(1),
                    child: Text(TIMES.elementAt(i),
                    style: TextStyle(fontSize: 10),),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                    ),
                    onTap: () {showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(TIMES.elementAt(i)),
                          );
                        });
                      },
                  )

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
