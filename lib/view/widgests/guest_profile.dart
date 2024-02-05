import 'package:flutter/material.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key, required this.guestGift});
  final GuestGift guestGift;
  //method for gift type
  String giftType() {
    String gift = '';
    switch (guestGift.giftType) {
      case GiftType.money:
        gift = 'Money';
        break;
      case GiftType.gift:
        gift = 'Gift';
        break;
    
      default:
        gift = 'Combo'; // both money and gift
        break;
    }
    return gift;
  }

  String genderType() {
    String gender = '';
    switch (guestGift.gender) {
      case Gender.male:
        gender = 'Male';
        break;
      default:
        gender = 'Female';
    }
    return gender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Name : ${guestGift.name}"),
        const SizedBox(
          height: 7,
        ),
        Text("Gender : ${genderType()}"),
        const SizedBox(
          height: 7,
        ),
        Text('Gift Type : ${giftType()}'),
        const SizedBox(
          height: 7,
        ),
        guestGift.giftType == GiftType.money
            ? Text("Amount : ${guestGift.amount}")
            : guestGift.giftType == GiftType.gift
                ? Text("No of Gift : ${guestGift.noOfGift}")
                : Column(
                    children: [
                      Text("Amount : ${guestGift.amount}"),
                      const SizedBox(
                        height: 7,
                      ),
                      Text("No of Gift : ${guestGift.noOfGift}")
                    ],
                  ),
      ],
    );
  }
}
