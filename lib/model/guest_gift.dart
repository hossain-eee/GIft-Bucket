import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'guest_gift.g.dart';
@HiveType(typeId: 0)
enum Gender {
  @HiveField(0)
   male, 
   @HiveField(1)
   female }
@HiveType(typeId: 1)
enum GiftType { 
  @HiveField(0)
  money, 
  @HiveField(1)
  gift, 
  @HiveField(2)
  combo }

final categoryIcons = {
  GiftType.money: Icons.attach_money,
  GiftType.gift: Icons.card_giftcard,
  GiftType.combo: Icons.gif_box_outlined,
};
@HiveType(typeId: 2)
class GuestGift extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  Gender gender;
  @HiveField(2)
  int amount;
  @HiveField(3)
  int noOfGift;
  @HiveField(4)
  GiftType giftType;

  GuestGift(
      {required this.name,
      required this.gender,
      required this.amount,
      required this.noOfGift})
      : giftType = GiftType.combo;
  GuestGift.onlyGift(this.name, this.gender, this.noOfGift)
      : amount = 0,
        giftType = GiftType.gift;
  GuestGift.onlyMoeny(this.name, this.gender, this.amount)
      : noOfGift = 0,
        giftType = GiftType.money;
}

//another class
class GuestGiftBucket {
 List< GuestGift> categoryGuest;
  GiftType giftType;
  GuestGiftBucket({required this.categoryGuest, required this.giftType});

  GuestGiftBucket.categoryGuest(List<GuestGift> categorGuestList, this.giftType)
      : categoryGuest = categorGuestList
            .where((element) => element.giftType == giftType)
            .toList();
}
