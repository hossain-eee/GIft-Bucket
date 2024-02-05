import 'package:hive/hive.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class Boxes {
  static Box<GuestGift> getHiveBoxInstance() => Hive.box<GuestGift>('guests');
}
