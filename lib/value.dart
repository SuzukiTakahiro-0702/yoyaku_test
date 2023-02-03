import 'api.dart';

String token = "";
List<Campus> ca_list = [];
List<Building> bl_list = [];
List<Room> ro_list = [];

Map<String, Map<String, List<Room>?>> ro_map = Map<String, Map<String, List<Room>?>>();

Map<String, Campus> ca_map = Map<String, Campus>();
Map<String, Building> bl_map = Map<String, Building>();
Map<String, Room> roomid_map = Map<String, Room>();

List<Reserve> resv_list = [];
List<String> favorite_list = [];
Map<String, bool> favorite_map = Map<String, bool>();





