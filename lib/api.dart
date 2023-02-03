import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'value.dart';

String han2zen(str) {
  Map<String, String> hanzenMap = {
    'A': 'Ａ',
    'B': 'Ｂ',
    'C': 'Ｃ',
    'D': 'Ｄ',
    'E': 'Ｅ',
    'F': 'Ｆ',
    'G': 'Ｇ',
    'H': 'Ｈ',
    'I': 'Ｉ',
    'J': 'Ｊ',
    'K': 'Ｋ',
    'L': 'Ｌ',
    'M': 'Ｍ',
    'N': 'Ｎ',
    'O': 'Ｏ',
    'P': 'Ｐ',
    'Q': 'Ｑ',
    'R': 'Ｒ',
    'S': 'Ｓ',
    'T': 'Ｔ',
    'U': 'Ｕ',
    'V': 'Ｖ',
    'W': 'Ｗ',
    'X': 'Ｘ',
    'Y': 'Ｙ',
    'Z': 'Ｚ',
    'a': 'ａ',
    'b': 'ｂ',
    'c': 'ｃ',
    'd': 'ｄ',
    'e': 'ｅ',
    'f': 'ｆ',
    'g': 'ｇ',
    'h': 'ｈ',
    'i': 'ｉ',
    'j': 'ｊ',
    'k': 'ｋ',
    'l': 'ｌ',
    'm': 'ｍ',
    'n': 'ｎ',
    'o': 'ｏ',
    'p': 'ｐ',
    'q': 'ｑ',
    'r': 'ｒ',
    's': 'ｓ',
    't': 'ｔ',
    'u': 'ｕ',
    'v': 'ｖ',
    'w': 'ｗ',
    'x': 'ｘ',
    'y': 'ｙ',
    'z': 'ｚ',
    '_': '＿',
    '-': 'ー',
    '=': '＝',
    'ｱ': 'ア',
    'ｲ': 'イ',
    'ｳ': 'ウ',
    'ｴ': 'エ',
    'ｵ': 'オ',
    'ｶ': 'カ',
    'ｷ': 'キ',
    'ｸ': 'ク',
    'ｹ': 'ケ',
    'ｺ': 'コ',
    'ｻ': 'サ',
    'ｼ': 'シ',
    'ｽ': 'ス',
    'ｾ': 'セ',
    'ｿ': 'ソ',
    'ﾀ': 'タ',
    'ﾁ': 'チ',
    'ﾂ': 'ツ',
    'ﾃ': 'テ',
    'ﾄ': 'ト',
    'ﾅ': 'ナ',
    'ﾆ': 'ニ',
    'ﾇ': 'ヌ',
    'ﾈ': 'ネ',
    'ﾉ': 'ノ',
    'ﾊ': 'ハ',
    'ﾋ': 'ヒ',
    'ﾌ': 'フ',
    'ﾍ': 'ヘ',
    'ﾎ': 'ホ',
    'ﾏ': 'マ',
    'ﾐ': 'ミ',
    'ﾑ': 'ム',
    'ﾒ': 'メ',
    'ﾓ': 'モ',
    'ﾔ': 'ヤ',
    'ﾕ': 'ユ',
    'ﾖ': 'ヨ',
    'ﾗ': 'ラ',
    'ﾘ': 'リ',
    'ﾙ': 'ル',
    'ﾚ': 'レ',
    'ﾛ': 'ロ',
    'ﾜ': 'ワ',
    'ｦ': 'ヲ',
    'ﾝ': 'ン',
    'ｶﾞ': 'ガ',
    'ｷﾞ': 'ギ',
    'ｸﾞ': 'グ',
    'ｹﾞ': 'ゲ',
    'ｺﾞ': 'ゴ',
    'ｻﾞ': 'ザ',
    'ｼﾞ': 'ジ',
    'ｽﾞ': 'ズ',
    'ｾﾞ': 'ゼ',
    'ｿﾞ': 'ゾ',
    'ﾀﾞ': 'ダ',
    'ﾁﾞ': 'ヂ',
    'ﾂﾞ': 'ヅ',
    'ﾃﾞ': 'デ',
    'ﾄﾞ': 'ド',
    'ﾊﾞ': 'バ',
    'ﾋﾞ': 'ビ',
    'ﾌﾞ': 'ブ',
    'ﾍﾞ': 'ベ',
    'ﾎﾞ': 'ボ',
    'ﾊﾟ': 'パ',
    'ﾋﾟ': 'ピ',
    'ﾌﾟ': 'プ',
    'ﾍﾟ': 'ペ',
    'ﾎﾟ': 'ポ',
    'ｳﾞ': 'ヴ',
    'ﾜﾞ': 'ヷ',
    'ｦﾞ': 'ヺ',
    'ｧ': 'ァ',
    'ｨ': 'ィ',
    'ｩ': 'ゥ',
    'ｪ': 'ェ',
    'ｫ': 'ォ',
    'ｬ': 'ャ',
    'ｭ': 'ュ',
    'ｮ': 'ョ',
    'ｯ': 'ッ',
    '｡': '。',
    '､': '、',
    '｢': '「',
    '｣': '」',
    '･': '・'
  };

  str = str.replaceAllMapped(RegExp("."), (Match m) {
    return hanzenMap[m.group(0)!] ?? m.group(0)!;
  });

  return str;
}

class Campus {
  String ca_campus_cd = "";
  String ca_name_ja = "";
  String ca_name_en = "";

  Campus.fromJson(Map<String, dynamic> json)
      : ca_campus_cd = json['campusCd'],
        ca_name_ja = json['campusNameJa'],
        ca_name_en = json['campusNameEn'];

  Map<String, dynamic> toJson() => {
    'campusCd': ca_campus_cd,
    'campusNameJa': ca_name_ja,
    'campusNameEn': ca_name_en
  };
}

class Building {
  String bl_campus_cd = "";
  String bl_blding_cd = "";
  String bl_name_ja = "";
  String bl_name_en = "";
  int bl_order = 0;

  Building.fromJson(Map<String, dynamic> json)
      : bl_campus_cd = json['campusCd'],
        bl_blding_cd = json['buildingCd'],
        bl_name_ja = json['buildingNameJa'],
        bl_name_en = json['buildingNameEn'],
        bl_order = json['order'];

  Map<String, dynamic> toJson() => {
    'campusCd': bl_campus_cd,
    'buildingCd': bl_blding_cd,
    'buildingNameJa': bl_name_ja,
    'buildingNameEn': bl_name_en,
    'order': bl_order
  };
}

class RoomReserved {
  String rr_room_id = "";
  String rr_resv_id = "";
  String rr_start_date = "";
  String rr_end_date = "";

  RoomReserved.fromJson(Map<String, dynamic> json)
      : rr_resv_id = json['resvId'],
        rr_start_date = json['startDate'],
        rr_end_date = json['endDate'];

  Map<String, dynamic> toJson() => {
    'resvId': rr_resv_id,
    'startDate': rr_start_date,
    'endDate': rr_end_date
  };
}

class Room {
  String ro_room_id = "";
  String ro_campus_cd = "";
  String ro_blding_cd = "";
  String ro_room_cd = "";
  String ro_name_ja = "";
  String ro_name_en = "";
  int ro_seats_count = 0;
  int ro_exam_seats_count = 0;
  String ro_reserve_tgt = "";
  String ro_disp_div = "";
  String ro_user_div = "";
  String ro_sportfs_flg = "";
  String ro_acceptable = "";
  String ro_mgmt_dept = "";
  String ro_mgmt_email = "";
  String ro_remarks = "";
  String ro_campus_name_ja = "";
  String ro_campus_name_en = "";
  String ro_blding_name_ja = "";
  String ro_blding_name_en = "";
  bool ro_favorite = false;

  List<RoomReserved> ro_reserved_list = [];

  Room.fromJson(Map<String, dynamic> json)
      : ro_room_id = json['roomId'],
        ro_campus_cd = json['campusCd'],
        ro_blding_cd = json['buildingCd'],
        ro_room_cd = json['roomCd'],
        ro_name_ja = json['roomNameJa'],
        ro_name_en = json['roomNameEn'] {
    var resv_list = json['reservedList'] as List;
    ro_reserved_list = resv_list.map((i) => RoomReserved.fromJson(i)).toList();
  }
}

class DispRoomGroup {
  String rg_campus_cd = "";
  String rg_group = "";
  String rg_room_id = "";
  int rg_order = 999999;

  DispRoomGroup.fromJson(Map<String, dynamic> json)
      : rg_campus_cd = json['campusCd'],
        rg_group = json['group'],
        rg_room_id = json['roomId'],
        rg_order = json['order'];
}

class Reserve {
  String rv_resv_id = "";
  String rv_room_id = "";
  String rv_start_date = "";
  String rv_end_date = "";
  String rv_title = "";
  String rv_status = "";
  String rv_reg_date = "";

  Reserve.fromJson(Map<String, dynamic> json)
      : rv_resv_id = json['resvId'],
        rv_room_id = json['roomId'],
        rv_start_date = json['startDate'],
        rv_end_date = json['endDate'],
        rv_title = json['title'],
        rv_status = json['status'],
        rv_reg_date = json['regDate'];
}

String _token = "";

class VarataRestAPI {
  VarataRestAPI();

  Uri m_ep_login =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/login");
  Uri m_ep_favorite =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/favorite");
  Uri m_ep_campus =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/campus");
  Uri m_ep_blding =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/building");
  Uri m_ep_room =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/room");
  Uri m_ep_disproomgroup = Uri.parse(
      "https://varata.sic.shibaura-it.ac.jp/varata/api/disproomgroup");
  Uri m_ep_reserve =
  Uri.parse("https://varata.sic.shibaura-it.ac.jp/varata/api/reserve");

  Future<String?> login(String username, String password) async {
    var header = {
      "Content-Type": "application/json",
    };

    var body = {"user": username, "pass": password};

    var jsonBody = jsonEncode(body);

    late http.Response? response;

    try {
      response = await http.post(
        m_ep_login,
        headers: header,
        body: jsonBody,
      );
    } catch (e) {
      throw e;
    }

    if (response.statusCode != 200) {
      return null;
    }

    var respJson = jsonDecode(response.body);

    return respJson["token"];
  }

  Future<List<String>?> getServerFavorite(String token) async {
    List<String> result = [];

    http.Response? response;

    try {
      response = await http
          .get(m_ep_favorite, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return null;
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      print("Exception:" + e.toString());
      return result;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return result;
    }

    result = (jsonDecode(response.body) as List<dynamic>).cast<String>();

    result.forEach((room_id) {
      favorite_map[room_id] = true;
    });

    return result;
  }

  Future<bool> postServerFavorite(String token) async {
    var header = {"Content-Type": "application/json"};
    header["Authorization"] = "Bearer $token";

    late http.Response? response;

    String json = jsonEncode(favorite_list);

    print("Favorite JSON [" + json + "]");

    try {
      response = await http.post(
        m_ep_favorite,
        headers: header,
        body: json,
      );
    } catch (e) {
      return false;
    }

    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Campus>?> getServerCampus(String token) async {
    List<Campus> result = [];

    http.Response? response;

    try {
      response = await http
          .get(m_ep_campus, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return null;
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      print("Exception:" + e.toString());
      return result;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return result;
    }

    List<dynamic> json = jsonDecode(response.body);

    for (Map<String, dynamic> map in json) {
      try {
        result.add(new Campus.fromJson(map));
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    }

    result.forEach((ca) {
      ca_map[ca.ca_campus_cd] = ca;
    });

    return result;
  }

  Future<List<Building>?> getServerBuilding(String token) async {
    List<Building> result = [];

    http.Response? response;

    try {
      response = await http
          .get(m_ep_blding, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return null;
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      print("Exception:" + e.toString());
      return result;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return result;
    }

    List<dynamic> json = jsonDecode(response.body);

    for (Map<String, dynamic> map in json) {
      try {
        result.add(new Building.fromJson(map));
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    }

    result.forEach((bl) {
      bl_map[bl.bl_blding_cd] = bl;
    });

    return result;
  }

  Future<List<Room>?> getServerRoom(String token) async {
    List<Room> result = [];

    http.Response? response;

    try {
      response = await http
          .get(m_ep_room, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return null;
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      print("Exception:" + e.toString());
      return result;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return result;
    }

    List<dynamic> json = jsonDecode(response.body);

    for (Map<String, dynamic> map in json) {
      try {
        result.add(new Room.fromJson(map));
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    }

    result.forEach((ro) {
      if(favorite_map.containsKey(ro.ro_room_id)) {
        ro.ro_favorite = true;
      }

      roomid_map[ro.ro_room_id] = ro;

      var key = "他";
      var key_kaigi = "会";

      if (ro.ro_name_ja.isNotEmpty) {
        if (ro.ro_name_ja.length > 5 &&
            ro.ro_name_ja.substring(0, 5) == "豊洲12F") {
          key = "研";
        } else if (ro.ro_name_ja.length > 2) {
          String two = ro.ro_name_ja.substring(0, 2);

          if (two == "豊洲") {
            key = ro.ro_name_ja.substring(2, 3);
          } else if (two == "UA" || two == "SA" || two == "AP") {
            key = "建";
          } else if (two == "12") {
            key = "豊";
          } else if (two == "大宮") {
            key = ro.ro_name_ja.substring(2, 3);
          } else {
            key = ro.ro_name_ja.substring(0, 1);
          }
        }
      }
    });

    return result;
  }

  Future<bool> getServerDispRoomGroup(String token) async {
    http.Response? response;

    try {
      response = await http
          .get(m_ep_disproomgroup, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return false;
    } on TimeoutException catch (e) {
      return false;
    } catch (e) {
      print("Exception:" + e.toString());
      return false;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return false;
    }

    List<dynamic> json = jsonDecode(response.body);

    List<DispRoomGroup> rg_list = [];

    for (Map<String, dynamic> map in json) {
      try {
        rg_list.add(new DispRoomGroup.fromJson(map));
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    }

    rg_list.forEach((rg) {
      if (!ro_map.containsKey(rg.rg_campus_cd)) {
        final list = Map<String, List<Room>>();
        ro_map[rg.rg_campus_cd] = list;
      }

      if (!ro_map[rg.rg_campus_cd]!.containsKey(rg.rg_group)) {
        final list = <Room>[ roomid_map[rg.rg_room_id]!];
        ro_map[rg.rg_campus_cd]![rg.rg_group] = list;
      } else {
        ro_map[rg.rg_campus_cd]![rg.rg_group]!.add(roomid_map[rg.rg_room_id]!);
      }
    });

    return true;
  }

  Future<List<Reserve>?> getMyReserve(String token) async {
    List<Reserve> result = [];

    http.Response? response;

    try {
      response = await http
          .get(m_ep_reserve, headers: {"Authorization": "Bearer $token"});
    } on SocketException catch (e) {
      return null;
    } on TimeoutException catch (e) {
      return null;
    } catch (e) {
      print("Exception:" + e.toString());
      return result;
    }

    if (response.statusCode != 200) {
      print("Response Code:" + response.statusCode.toString());
      return result;
    }

    List<dynamic> json = jsonDecode(response.body);

    for (Map<String, dynamic> map in json) {
      try {
        result.add(new Reserve.fromJson(map));
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    }

    return result;
  }
}
