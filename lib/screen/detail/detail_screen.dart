import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kik/model/cleaner_field.dart';
import 'package:kik/screen/detail/checkout_screen.dart';
import 'package:kik/theme.dart';
import 'package:kik/widget/facility_card.dart';

import '../../utils/image_utils.dart';

class DetailScreen extends StatelessWidget {
 final CleanerField field;

  DetailScreen({required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(context, field),
          SliverPadding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageUtils.pin,
                      width: 24,
                      height: 24,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        field.address,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        "Valor ${field.price} / Hora",
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Contato:",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        field.phoneNumber,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Avaliações:",
                      style: subTitleTextStyle,
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text("Avaliações"))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      field.openDay,
                      style: descTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "${field.openTime} - ${field.closeTime}",
                      style: descTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
              ]),
            ),
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
          ),
        ]),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusSize))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckoutScreen(
                  field: field,
                );
              }));
            },
            child: const Text("Agendar agora")),
      ),
    );
  }

  Widget customSliverAppBar(context, field) {
    return SliverAppBar(
      shadowColor: primaryColor500.withOpacity(.2),
      backgroundColor: colorWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.4),
        statusBarIconBrightness: Brightness.light,
      ),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: kToolbarHeight,
          decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadiusSize))),
          child: Center(
            child: Text(
              field.name,
              style: titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        background: Image.asset(
          field.imageAsset,
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: colorWhite,
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 26,
              icon: const Icon(
                Icons.arrow_back,
                color: darkBlue500,
              )),
        ),
      ),
      actions: [

      ],
      expandedHeight: 300,
    );
  }
}
