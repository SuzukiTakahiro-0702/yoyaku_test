import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'utils/states.dart';
import 'utils/styles.dart';
import 'utils/consts.dart';

import 'pages/reserve.dart';
import 'pages/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<StatesProvider>(
            create: (context) => StatesProvider(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
          ],
          locale: const Locale('ja'),
          supportedLocales: [
            const Locale('ja'),
          ],
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(),
            '/reserve': (context) => Reserve(),
            '/list': (context) => List_Reserve(),
          },
          title: 'GOYOYAKU',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  String aaa = 'aaa';
  @override
  Widget build(BuildContext context) {
    final StatesProvider statesProvider =
        Provider.of<StatesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('GOYOYAKU'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15.0),
            const Text(
              'Area',
            ),
            SizedBox(
              width: 400,
              child: DropdownButton(
                isExpanded: true,
                items:
                    Consts.area.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyles.title),
                  );
                }).toList(),
                value: statesProvider.area,
                onChanged: (String? value) {
                  debugPrint(value);
                  statesProvider.setArea(value!);
                },
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Building',
            ),
            statesProvider.area == '豊洲キャンパス(TOYOSU)'
                ? Container(
                    width: 400,
                    child: DropdownButton(
                      isExpanded: true,
                      items: Consts.buildingToyosu
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyles.title),
                        );
                      }).toList(),
                      value: statesProvider.buildingToyosu,
                      onChanged: (String? value) {
                        debugPrint(value);
                        statesProvider.setBuildingToyosu(value!);
                      },
                    ),
                  )
                : SizedBox(
                    width: 400,
                    child: DropdownButton(
                        isExpanded: true,
                        items: Consts.buildingOhmiya
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyles.title),
                          );
                        }).toList(),
                        value: statesProvider.buildingOhmiya,
                        onChanged: (String? value) {
                          debugPrint(value);
                          statesProvider.setBuildingOhmiya(value!);
                        }),
                  ),
            const SizedBox(height: 15.0),
            const Text(
              'Room',
            ),
            Container(
              child: () {
                switch (statesProvider.nowBuilding) {
                  case '豊洲 教室棟(KYOSHITSU BUILDING)':
                  case '豊洲 交流棟(KOURYU BUILDING)':
                  case '豊洲 本部棟(HONBU BUILDING)':
                    return SizedBox(
                      width: 400,
                      child: DropdownButton(
                          isExpanded: true,
                          items: Consts.roomToyosu
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.title),
                            );
                          }).toList(),
                          value: statesProvider.roomToyosu,
                          onChanged: (String? value) {
                            debugPrint(value);
                            statesProvider.setRoomToyosu(value!);
                          }),
                    );
                  case '大宮 1号棟(1 BUILDING)':
                  case '大宮 2号棟(2 BUILDING)':
                  case '大宮 3号棟(3 BUILDING)':
                    return SizedBox(
                      width: 400,
                      child: DropdownButton(
                          isExpanded: true,
                          items: Consts.roomOhmiya
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.title),
                            );
                          }).toList(),
                          value: statesProvider.roomOhmiya,
                          onChanged: (String? value) {
                            debugPrint(value);
                            statesProvider.setRoomOhmiya(value!);
                          }),
                    );
                  default:
                    return SizedBox(
                      width: 400,
                      child: DropdownButton(
                          isExpanded: true,
                          items: Consts.roomToyosu
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.title),
                            );
                          }).toList(),
                          //value: statesProvider.roomToyosu,
                          onChanged: (String? value) {
                            debugPrint(value);
                            statesProvider.setRoomToyosu(value!);
                          }),
                    );
                }
              }(),
            ),
            const SizedBox(height: 15.0),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flutter_dash),
                    const Text(
                      ' 予約状況を表示する',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4682b4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                  debugPrint('aa');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
