import 'package:kik/model/cleaner_category.dart';
import 'package:kik/model/field_facility.dart';

class CleanerField {
  String id;
  String name;
  CleanerCategory category;

  String address;
  String phoneNumber;
  String openDay;
  String openTime;
  String closeTime;
  String imageAsset;
  int price;


  CleanerField(
      {required this.id,
      required this.name,
      required this.category,

      required this.address,
      required this.phoneNumber,
      required this.openDay,
      required this.openTime,
      required this.closeTime,
      required this.imageAsset,
      required this.price,});
}
