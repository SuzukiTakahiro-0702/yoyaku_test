import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interval_time_picker/interval_time_picker.dart';

import '/utils/states.dart';
import '/utils/styles.dart';
import '/utils/consts.dart';

TimeOfDay? selectedTime;
Future _pickTime(BuildContext context) async {
  final initialTime = TimeOfDay(hour: 10, minute: 0);

//TimePickerの表示
  final newTime =
  await showTimePicker(context: context, initialTime: initialTime);

//   if (newTime != null) {
// //選択した時刻を最初に用意した変数に格納
//     setState(() => selectedTime = newTime);
//   } else {
//     return;
//   }
}




class Reserve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StatesProvider statesProvider =
    Provider.of<StatesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('GOYOYAKUers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15.0),
            const Text(
              'Area',
            ),
            TextButton(
                onPressed: () {
                  //_pickTime(context);
                  //https://pub.dev/packages/interval_time_picker
                  showIntervalTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 10,minute: 00),
                    interval: 10,
                    visibleStep: VisibleStep.tenths,
                    errorInvalidText: "10分単位で選択して下さい。",
                    minuteLabelText: 'sss'
                  );
                  debugPrint(TimeOfDay.fromDateTime(DateTime.now()).toString());
                },
                child: Text('TextButtonに表示する文字')),
            Text(
                statesProvider.area,
            ),
            Text(
              statesProvider.nowBuilding,
            ),Text(
              statesProvider.nowRoom,
            ),

          ],
        ),
      ),
    );
  }
}
