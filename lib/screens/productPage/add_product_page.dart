import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagementsystem/api/add_product.dart';
import 'package:inventorymanagementsystem/bloc/client_bloc/client_bloc.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/models/product_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController articleNoController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final List categoryList = ["Male", "Female", "Kids","Adult","ALL"];
  final List colorList = ["Black", "Tan", "White", "Maroon", "Brown","Blue","Red"];
  final List companyList = [""];
  final List productList = ["Slippers","Shoes","Others"];
  String? selectedColor;
  String? selectedCategory;
  String? selectedCompany;
  String? selectedProduct;
  // bool checkBox1 = false;
  // bool checkBox2 = false;
  // bool checkBox3 = false;
  // bool checkBox4 = false;
  // bool checkBox5 = false;
  // bool checkBox6 = false;
  // bool checkBox7 = false;
  // bool checkBox8 = false;
  // bool checkBox9 = false;
  // bool checkBox10 = false;
  // bool checkBox11 = false;
  // bool checkBox12 = false;
  // bool checkBox13 = false;
  // bool checkBox14 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return StatefulBuilder(
      builder: (context, setState) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: whiteColor,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: height / 8 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ADD PRODUCTS',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        const Icon(
                          Icons.close,
                          color: secondaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
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
              height: 2,
              color: lightBackgroundColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 300,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: articleNoController,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 5, right: 15),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: backgroundColor,
                          hintText: 'Article No.',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: primaryColor.withOpacity(0.5))),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 300,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: productNameController,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 5, right: 15),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: backgroundColor,
                          hintText: 'Product Name',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: primaryColor.withOpacity(0.5))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 300,
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                          selectedColor ?? 'Color',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        items: List<int>.generate(
                            colorList.length, (int index) => index).map(
                          (val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                colorList[val],
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedColor = colorList[value!];
                          });
                        }),
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                          selectedCategory ?? 'Category',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        items: List<int>.generate(
                            categoryList.length, (int index) => index).map(
                          (val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                categoryList[val],
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = categoryList[value!];
                          });
                        }),
                  ),
                ],
              ),
            ),
           
            const SizedBox(height: 20),
            BlocBuilder<ClientBloc, ClientState>(
                builder: (context, state) {
              if (state is ClientInitial) {
              
                return Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
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
                              selectedCompany ?? 'Company',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(
                                state.clients.length, (int index) => index).map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    state.clients[val].clientName,
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCompany =  state.clients[value!].clientName;
                              });
                            }),
                      ),
                      Container(
                        height: 40,
                        width: 300,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
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
                              selectedProduct ?? 'Product',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(
                                productList.length, (int index) => index).map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    productList[val],
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedProduct = productList[value!];
                              });
                            }),
                      ),
                    ],
                  ),
                );
              }
              else{
                 
              
                return Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
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
                              selectedCompany ?? 'Company',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(
                                companyList.length, (int index) => index).map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    companyList[val],
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCompany = companyList[value!];
                              });
                            }),
                      ),
                      Container(
                        height: 40,
                        width: 300,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
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
                              selectedProduct ?? 'Product',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            items: List<int>.generate(
                                productList.length, (int index) => index).map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    productList[val],
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedProduct = productList[value!];
                              });
                            }),
                      ),
                    ],
                  ),
                );
              }
              
              }
            ),
              
            
            // const SizedBox(height: 20),
            // Container(
            //     padding: const EdgeInsets.only(left: 30),
            //     child: Text(
            //       "Available Sizes :   1     2     3     4      5     6     7 ",
            //       style: Theme.of(context).textTheme.bodyLarge,
            //     )),
            // Container(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: Row(children: [
            //     const Text(
            //       "Available Sizes : ",
            //       style: TextStyle(fontSize: 20, color: Colors.transparent),
            //     ),
            //     Checkbox(
            //         value: checkBox1,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox1 = !checkBox1;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox2,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox2 = !checkBox2;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox3,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox3 = !checkBox3;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox4,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox4 = !checkBox4;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox5,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox5 = !checkBox5;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox6,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox6 = !checkBox6;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox7,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox7 = !checkBox7;
            //           });
            //         }),
            //   ]),
            // ),
            // const SizedBox(height: 10),
            // Container(
            //     padding: const EdgeInsets.only(left: 30),
            //     child: Text(
            //       "Available Sizes :   8     9    10    11  12   13   14 ",
            //       style: Theme.of(context).textTheme.bodyLarge,
            //     )),
            // Container(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: Row(children: [
            //     const Text(
            //       "Available Sizes : ",
            //       style: TextStyle(fontSize: 20, color: Colors.transparent),
            //     ),
            //     Checkbox(
            //         value: checkBox8,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox8 = !checkBox8;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox9,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox9 = !checkBox9;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox10,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox10 = !checkBox10;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox11,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox11 = !checkBox11;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox12,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox12 = !checkBox12;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox13,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox13 = !checkBox13;
            //           });
            //         }),
            //     Checkbox(
            //         value: checkBox14,
            //         onChanged: (_) {
            //           setState(() {
            //             checkBox14 = !checkBox14;
            //           });
            //         }),
            //   ]),
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.photo,
                              color: secondaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Photo',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 20,
                        top: 5,
                        child: Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                 
                const SizedBox(
                  height: 0,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 2,
              color: lightBackgroundColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      if (articleNoController.text != null ||
                      
                          selectedCompany!= null ) {
                        ProductModel productModel = ProductModel(
                            clientName: selectedCompany!,
                            productName: productNameController.text,
                            articleNumber: articleNoController.text,
                          
                            color: selectedColor,
                            productCategory: selectedCategory,
                            productType: selectedProduct);
                        createProduct(productModel);
                        Navigator.pop(context);
                      } else {
                        // ignore: avoid_print
                        print("Empty Fields");
                      }
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.done,
                            color: secondaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Save',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
