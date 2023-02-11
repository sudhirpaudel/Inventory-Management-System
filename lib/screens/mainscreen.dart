import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/bloc/products_bloc/products_bloc.dart';
import 'package:inventorymanagementsystem/screens/customersPage/customes_main_screen.dart';
import 'package:inventorymanagementsystem/screens/homePage/home_main_screen.dart';
import 'package:inventorymanagementsystem/screens/inventoryPage/inventory_main_screen.dart';
import 'package:inventorymanagementsystem/screens/productPage/product_main_screen.dart';
import 'package:inventorymanagementsystem/screens/purchasePage/purchase_main_screen.dart';
import 'package:inventorymanagementsystem/screens/salePage/sales_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/client_bloc/client_bloc.dart';
import '../config/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int statePage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> page = const [
      HomePage(),
      SalesMainPage(),
      PurchaseMainPage(),
      ProductMainScreen(),
      CustomerMainPage(),
      InventoryMainPage(),
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Row(
          children: [
            Container(
              height: height,
              width: width / 6,
              color: primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 8 - 15,
                    // child: const TimeContainer(),
                    // child: Center(
                    //   child: Text(
                    //     'FITMONK Inc.',
                    //     style: Theme.of(context).textTheme.titleLarge,
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'HOME',
                      Icons.home,
                      0,
                      statePage,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'SALES',
                      Icons.shopping_cart,
                      1,
                      statePage,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 2;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'PURCHASE',
                      Icons.money,
                      2,
                      statePage,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 3;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'PRODUCTS',
                      Icons.production_quantity_limits,
                      3,
                      statePage,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 4;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'CUSTOMERS',
                      Icons.people,
                      4,
                      statePage,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        statePage = 5;
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: nameBox(
                      context,
                      'INVENTORY',
                      Icons.inventory,
                      5,
                      statePage,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: height,
                width: width * 5 / 6,
                color: backgroundColor,
                padding: const EdgeInsets.all(30),
                child: page[statePage]),
          ],
        ),
      );
    
  }
}

nameBox(BuildContext context, String name, iconName, int page, int statePage) {
  bool isClicked = page == statePage;
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 40),
        height: 70,
        child: Row(
          children: [
            Icon(
              iconName,
              color: secondaryColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
      isClicked
          ? Container(
              margin: const EdgeInsets.only(left: 10),
              height: 70,
              width: 1920 / 6,
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
