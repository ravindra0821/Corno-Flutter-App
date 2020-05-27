import 'package:flutter/material.dart';
import 'package:flutterlearningapp/home_screen.dart';

import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Loyaltie',
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.grey,

      primaryColorBrightness: Brightness.light,
      accentColorBrightness: Brightness.light,
    ),
    // home: TutorialScreen(),
    // home: DashBoardScreen(),
    //home: ProfileScreen(),
    home: HomePageScreen(),
    // home: PaymentScreen(),
    // home: UserDashBoardScreen(),
    // home: UserFilterScreen(),
    // home: TransactionClaimedRewardDetailScreen(),
  ));
}



