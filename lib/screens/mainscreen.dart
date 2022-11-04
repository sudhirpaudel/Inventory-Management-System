import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/screens/infodata.dart';

import '../config/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(height);
    print(width);
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: height,
            width: width / 6,
            color: primaryColor,
            child: Column(
              children: [
                Container(
                  height: height / 8 - 15,
                  child: const Center(
                      child: Text(
                    'FITMONK Inc.',
                    style: TextStyle(
                      color: backgroundColor,
                      fontSize: 38,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
                const SizedBox(height: 10,),
                TextButton(
                    onPressed: () {}, child: nameBox('Home', Icons.home, false)),
                TextButton(
                    onPressed: () {},
                    child: nameBox('Sales', Icons.shopping_cart, false)),
                TextButton(
                    onPressed: () {},
                    child: nameBox('Purchase', Icons.money, false)),
                TextButton(
                    onPressed: () {},
                    child: nameBox(
                        'Products', Icons.production_quantity_limits, false)),
                TextButton(
                    onPressed: () {},
                    child: nameBox('Customers', Icons.people, false)),
                TextButton(
                    onPressed: () {},
                    child: nameBox('Inventory', Icons.inventory, true)),
              ],
            ),
          ),
          Container(
            height: height,
            width: width * 5 / 6,
            color: backgroundColor,
            padding: const EdgeInsets.all(30),
            child: Container(
              height: height,
              width: width * 5 / 6,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: height / 8 - 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'INVENTORY',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(children: const [
                              Icon(
                                Icons.add,
                                color: secondaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'ADD NEW',
                                style: TextStyle(color: secondaryColor),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 2,
                    color: lightBackgroundColor,
                  ),
                  Container(
                    height: 54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              color: backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                SizedBox(
                                  width: 180,
                                ),
                                Icon(
                                  Icons.search,
                                  color: primaryColor,
                                ),
                              ]),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(children: const [
                                  Text(
                                    'ArticalNO.',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(children: const [
                                  Text(
                                    'Category',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(children: const [
                                  Text(
                                    'Location',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 2,
                    color: lightBackgroundColor,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 7),
                    child: inventoryInfo(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: lightBackgroundColor,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 7),
                    child: inventoryData(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: lightBackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

nameBox(String name, iconName, bool isClicked) {
  return Stack(children: [
    Container(
      padding: const EdgeInsets.only(left: 30),
      height: 70,
      child: Row(children: [
        Icon(
          iconName,
          color: secondaryColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          name,
          style: const TextStyle(color: secondaryColor),
        )
      ]),
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
  ]);
}
