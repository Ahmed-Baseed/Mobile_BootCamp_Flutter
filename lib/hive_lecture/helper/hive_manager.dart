import 'package:hive/hive.dart';

class HiveManager {
  late Box box;
  HiveManager(String boxName) {
    box = Hive.box(boxName);
  }
  fetch(){
   return box.values;
  }
  store(HiveObject object) {
    box.add(object);
  }
}
