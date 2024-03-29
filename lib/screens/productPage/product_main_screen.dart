import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagementsystem/bloc/products_bloc/products_bloc.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/screens/productPage/add_product_page.dart';
import 'package:inventorymanagementsystem/screens/productPage/product_info.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
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
                Text(
                  'PRODUCTS',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const AddProductPage());
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(children: [
                      const Icon(
                        Icons.add,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ADD NEW',
                        style: Theme.of(context).textTheme.bodyMedium,
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 230,
                  child: TextField(
                    maxLines: 1,
                    style: const TextStyle(fontSize: 18),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(left: 20, top: 5, right: 15),
                        suffixIcon: Icon(Icons.search,
                            color: Theme.of(context).iconTheme.color),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: backgroundColor,
                        hintText: 'Article No.',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: primaryColor.withOpacity(0.5))),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: DropdownButton(
                            underline: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
                            isExpanded: true,
                            iconEnabledColor: primaryColor,
                            iconDisabledColor: primaryColor,
                            iconSize: 30,
                            hint: Text(
                              'Category',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(12, (int index) => index)
                                .map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val + 1,
                                  child: Text("${val + 1}"),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {});
                            }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: DropdownButton(
                            underline: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
                            isExpanded: true,
                            iconEnabledColor: primaryColor,
                            iconDisabledColor: primaryColor,
                            iconSize: 30,
                            hint: Text(
                              'Color',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(12, (int index) => index)
                                .map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val + 1,
                                  child: Text("${val + 1}"),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {});
                            }),
                      ),
                      const SizedBox(
                        width: 10,
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
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 7),
            child: productInfo(context, width),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: lightBackgroundColor,
          ),
          SizedBox(
            height: 650,
            width: double.infinity,
            child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
              if (state is ProductsInitial) {
                return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, i) {
                      int index = i + 1;
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 7),
                            child: productData(
                                context, width, state.products[index - 1],index),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: lightBackgroundColor,
                          ),
                        ],
                      );
                    });
              } else {
                return const SizedBox(
                  child: Text('no products'),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
