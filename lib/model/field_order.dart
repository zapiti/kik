
import 'package:kik/model/user.dart';

import 'cleaner_field.dart';

class FieldOrder {
  CleanerField field;
  User user;
  String selectedDate;
  List<String> selectedTime;
  bool paidStatus;

  FieldOrder(
      {required this.field,
      required this.user,
      required this.selectedDate,
      required this.selectedTime,
      this.paidStatus = false});
}
