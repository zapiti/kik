import 'package:flutter/material.dart';
import 'package:kik/screen/main/transaction/history_screen.dart';
import 'package:kik/screen/main/transaction/order_screen.dart';
import 'package:kik/theme.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: kTextTabBarHeight,
        title: Text(
          "Transaction",
          style: titleTextStyle,
        ),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelStyle: tabBarTextStyle,
          labelColor: primaryColor500,
          unselectedLabelColor: darkBlue300,
          indicatorColor: primaryColor500,
          tabs: const [
            Tab(
              text: "Agendamentos",
            ),
            Tab(
              text: "Historico",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderScreen(),
          HistoryScreen(),
        ],
      ),
    );
  }
}
