import 'package:flutter/material.dart';
import 'package:pr_petappmania/utills/route_utills.dart';
import 'package:pr_petappmania/utills/view/screens/cart_page.dart';
import 'package:pr_petappmania/utills/view/screens/detail_page.dart';
import 'package:pr_petappmania/utills/view/screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
