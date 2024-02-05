import 'package:flutter/material.dart';
import 'package:wedding_gift/application/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:wedding_gift/model/guest_gift.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  //register adapter class for model class and enum
  Hive.registerAdapter(GuestGiftAdapter()); // model class
  Hive.registerAdapter(GenderAdapter()); // gender enum
  Hive.registerAdapter(GiftTypeAdapter()); // gift type enum
  await Hive.openBox<GuestGift>('guests');

  runApp(const WeddingGift());
}
