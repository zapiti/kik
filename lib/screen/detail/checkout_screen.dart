import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kik/model/checkbox_state.dart';
import 'package:kik/model/field_order.dart';
import 'package:kik/model/cleaner_field.dart';
import 'package:kik/screen/main/main_screen.dart';
import 'package:kik/theme.dart';
import 'package:kik/utils/dummy_data.dart';

import '../../utils/image_utils.dart';

class CheckoutScreen extends StatefulWidget {
  CleanerField field;

  CheckoutScreen({required this.field});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime _dateTime = DateTime.now();
  final dateFormat = DateFormat("EEEE, dd MMM yyyy");
  var availableBookTime = [
    CheckBoxState(title: "00.00"),
  ];
  int _totalBill = 0;
  bool _enableCreateOrderBtn = false;
  List<String> timeList = timeToBook;
  var currentTime = "00.00";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });

    for (var time in timeList) {
      if (time == widget.field.openTime) {
        currentTime = time;
        print("$currentTime e $time");
      }
    }

    availableBookTime.removeAt(0);
    for (int i = timeList.indexOf(currentTime); i < 24; i++) {
      if (currentTime == widget.field.closeTime) {
        break;
      } else {
        availableBookTime
            .add(CheckBoxState(title: "${timeList[i]} - ${timeList[i + 1]}"));
        currentTime = timeList[i + 1];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: colorWhite,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Text("Agendamento"),
            backgroundColor: colorWhite,
            centerTitle: true,
            foregroundColor: primaryColor500,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Nome",
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor100, width: 2),
                        color: lightBlue100,
                        borderRadius: BorderRadius.circular(borderRadiusSize)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageUtils.pin,
                          width: 24,
                          height: 24,
                          color: primaryColor500,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(widget.field.name,
                            style: normalTextStyle.copyWith(
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Selecione a data",
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor100, width: 2),
                          color: lightBlue100,
                          borderRadius:
                              BorderRadius.circular(borderRadiusSize)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.date_range_rounded,
                            color: primaryColor500,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            _dateTime == null
                                ? "date not selected.."
                                : dateFormat.format(_dateTime).toString(),
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Selecione o Horario",
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...availableBookTime.map(buildSingleCheckBox).toList(),
                ],
              ),
            ])),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: lightBlue300,
            offset: Offset(0, 0),
            blurRadius: 10,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Total:",
                  style: descTextStyle,
                ),
                Text(
                  "R\$ $_totalBill",
                  style: priceTextStyle,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusSize))),
                  onPressed: !_enableCreateOrderBtn
                      ? null
                      : () {
                          List<String> selectedTime = [];
                          for (int i = 0; i < availableBookTime.length; i++) {
                            if (availableBookTime[i].value) {
                              selectedTime.add(availableBookTime[i].title);
                            }
                          }
                          dummyUserOrderList.add(FieldOrder(
                              field: widget.field,
                              user: sampleUser,
                              selectedDate:
                                  dateFormat.format(_dateTime).toString(),
                              selectedTime: selectedTime));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MainScreen(currentScreen: 1)),
                              (route) => false);
                          _showSnackBar(
                              context, "Agendamento feito com sucesso");
                        },
                  child: Text(
                    "Agendar",
                    style: buttonTextStyle,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectDate() async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 6))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: (bool? value) {
        setState(() {
          checkbox.value = value!;
        });
        int totalSelectedTime = 0;
        for (int i = 0; i < availableBookTime.length; i++) {
          if (availableBookTime[i].value == true) {
            totalSelectedTime++;
          }
        }
        setState(() {
          _totalBill = widget.field.price * totalSelectedTime;
          if (totalSelectedTime > 0) {
            _enableCreateOrderBtn = true;
          } else {
            _enableCreateOrderBtn = false;
          }
        });
      },
    );
  }
}
