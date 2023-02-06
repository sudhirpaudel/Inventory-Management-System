import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagementsystem/bloc/client/client_bloc.dart';
import 'package:inventorymanagementsystem/bloc/products_bloc/products_bloc.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class AddPurchasePage extends StatefulWidget {
  const AddPurchasePage({super.key});

  @override
  State<AddPurchasePage> createState() => _AddPurchasePageState();
}

class _AddPurchasePageState extends State<AddPurchasePage> {
  bool isCompanyVerified = true;
  bool isProductVerified = false;
  bool isVATneeded = false;
  bool withVAT = true;
  bool isSizeNeeded = false;
  String? noOfProducts;
  String? selectedCompany;
  String? selectedProduct;

  List<TextEditingController> nameControllers =
      List.generate(12, (l) => TextEditingController());
  List<TextEditingController> quantityControllers =
      List.generate(12, (j) => TextEditingController());
  List<TextEditingController> amountControllers =
      List.generate(12, (k) => TextEditingController());

  List<List<TextEditingController>> sizeControllers = List.generate(
      12, (k) => List.generate(14, (k) => TextEditingController(text: '0')));
  List<String> productsId = List.generate(12, (i) => 'ProductName');
  List<double> totalEach = List.generate(12, (i) => 0.0);
  List<int> totalEachSize = List.generate(12, (i) => 0);
  double totalMain = 0.0;
  double totalTaxable = 0.0;
  double vatAmountTotal = 0.0;
  double grandTotal = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              width: isSizeNeeded ? width * 0.6 : width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ADD PURCHASE',
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
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Verified Customer : ",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Checkbox(
                    value: isCompanyVerified,
                    onChanged: (_) {
                      setState(() {
                        isCompanyVerified = !isCompanyVerified;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  !isCompanyVerified
                      ? SizedBox(
                          height: 40,
                          width: 300,
                          child: TextField(
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
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor.withOpacity(0.5))),
                          ),
                        )
                      : SizedBox(
                          child: Row(
                            children: [
                              BlocBuilder<ClientBloc, ClientState>(
                                builder: (context, state) {
                                  if (state is ClientInitial) {
                                    return Container(
                                      height: 40,
                                      width: 300,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
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
                                          selectedCompany ?? 'Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        items: List<int>.generate(
                                            state.clients.length,
                                            (int index) => index).map(
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
                                          setState(
                                            () {
                                              selectedCompany = state
                                                  .clients[value!].clientName;
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  !isCompanyVerified
                      ? SizedBox(
                          height: 40,
                          width: 300,
                          child: TextField(
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
                                hintText: 'PAN number',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor.withOpacity(0.5))),
                          ),
                        )
                      : const SizedBox(
                          height: 40,
                          width: 300,
                        )
                ],
              ),
            ),
            !isCompanyVerified
                ? Column(
                    children: [
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
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'District',
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
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'Location',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: primaryColor.withOpacity(0.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 300,
                              child: TextField(
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'Manage Name',
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
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'Telephone No.',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: primaryColor.withOpacity(0.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 300,
                              child: TextField(
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'Phone Number',
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
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    fillColor: backgroundColor,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: primaryColor.withOpacity(0.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                    'Company Type',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  items: List<int>.generate(
                                      12, (int index) => index).map(
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 20,
                  ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
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
                              'Add Bill Photo',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 20,
                        top: 8,
                        child: Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
                              Icons.calendar_view_week_rounded,
                              color: secondaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Date',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 20,
                        top: 8,
                        child: Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Verified Product : ",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Checkbox(
                    value: isProductVerified,
                    onChanged: (_) {
                      setState(() {
                        isProductVerified = !isProductVerified;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
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
                          noOfProducts ?? 'No. of Products',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        items: List<int>.generate(12, (int index) => index).map(
                          (val) {
                            return DropdownMenuItem(
                              value: val + 1,
                              child: Text("${val + 1}"),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            noOfProducts = value.toString();
                          });
                        }),
                  ),
                ),
                const SizedBox()
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Text(
                        "VAT needed : ",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Checkbox(
                        value: isVATneeded,
                        onChanged: (_) {
                          setState(() {
                            isVATneeded = !isVATneeded;
                            totalMain = totalEach.sum;
                            totalTaxable = totalMain;
                            vatAmountTotal = double.parse(
                                (totalMain * 0.13).toStringAsFixed(2));
                            grandTotal = isVATneeded
                                ? withVAT
                                    ? totalMain
                                    : totalTaxable + vatAmountTotal
                                : totalMain;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                isVATneeded
                    ? Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              "Amt. With VAT : ",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Checkbox(
                              value: withVAT,
                              onChanged: (_) {
                                setState(() {
                                  withVAT = !withVAT;
                                  totalMain = totalEach.sum;
                                  totalTaxable = totalMain;
                                  vatAmountTotal = double.parse(
                                      (totalMain * 0.13).toStringAsFixed(2));
                                  grandTotal = isVATneeded
                                      ? withVAT
                                          ? totalMain
                                          : totalTaxable + vatAmountTotal
                                      : totalMain;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                isVATneeded
                    ? Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              "Amt. Without VAT: ",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Checkbox(
                              value: !withVAT,
                              onChanged: (_) {
                                setState(() {
                                  withVAT = !withVAT;

                                  totalMain = totalEach.sum;
                                  totalTaxable = totalMain;
                                  vatAmountTotal = double.parse(
                                      (totalMain * 0.13).toStringAsFixed(2));
                                  grandTotal = isVATneeded
                                      ? withVAT
                                          ? totalMain
                                          : totalTaxable + vatAmountTotal
                                      : totalMain;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Table(
                columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(3),
                      },
                border: TableBorder.all(
                    color: primaryColor.withOpacity(0.5),
                    width:
                        1), // Allows to add a border decoration around your table
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        isProductVerified ? 'ProductId' : 'ProductName',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Amount',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Total',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ]),
                  for (var i = 0; i < int.parse(noOfProducts ?? '1'); i++)
                    TableRow(
                      children: [
                        isProductVerified
                            ? BlocBuilder<ProductsBloc, ProductsState>(
                                builder: (context, state) {
                                  if (state is ProductsInitial) {
                                    return Container(
                                        height: 40,
                                        width: 300,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                              productsId[i],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            items: List<int>.generate(
                                                state.products.length,
                                                (int index) => index).map(
                                              (val) {
                                                return DropdownMenuItem(
                                                  value: val,
                                                  child: Text(
                                                    state.products[val]
                                                        .productName,
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                productsId[i] = state
                                                    .products[value!]
                                                    .productName;
                                              });
                                            }));
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              )
                            : SizedBox(
                                height: 30,
                                child: TextField(
                                  maxLines: 1,
                                  controller: nameControllers[i],
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                  style: const TextStyle(fontSize: 18),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      filled: false,
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, top: 5, right: 15),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0))),
                                      hintText: 'Name',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color:
                                              primaryColor.withOpacity(0.5))),
                                ),
                              ),
                        SizedBox(
                          height: 30,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: quantityControllers[i],
                            onChanged: (text) {
                              setState(() {
                                totalEach[i] = double.parse((int.parse(
                                            quantityControllers[i].text) *
                                        double.parse(amountControllers[i].text))
                                    .toStringAsFixed(2));
                                totalMain = totalEach.sum;
                                totalTaxable = totalMain;
                                vatAmountTotal = double.parse(
                                    (totalMain * 0.13).toStringAsFixed(2));
                                grandTotal = isVATneeded
                                    ? withVAT
                                        ? totalMain
                                        : totalTaxable + vatAmountTotal
                                    : totalMain;
                              });
                            },
                            style: const TextStyle(fontSize: 18),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              filled: false,
                              contentPadding:
                                  EdgeInsets.only(left: 20, top: 5, right: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: amountControllers[i],
                            onChanged: (text) {
                              setState(() {
                                totalEach[i] = double.parse((int.parse(
                                            quantityControllers[i].text) *
                                        double.parse(amountControllers[i].text))
                                    .toStringAsFixed(2));
                                totalMain = totalEach.sum;
                                totalTaxable = totalMain;
                                vatAmountTotal = double.parse(
                                    (totalMain * 0.13).toStringAsFixed(2));
                                grandTotal = isVATneeded
                                    ? withVAT
                                        ? totalMain
                                        : totalTaxable + vatAmountTotal
                                    : totalMain;
                              });
                            },
                            style: const TextStyle(fontSize: 18),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              filled: false,
                              contentPadding:
                                  EdgeInsets.only(left: 20, top: 5, right: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              totalEach[i].toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Table(
                 columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(3),
                      },
                border: TableBorder.all(
                    color: primaryColor.withOpacity(0.5),
                    width:
                        1), // Allows to add a border decoration around your table
                children: [
                  TableRow(
                    children: [
                      const Text(''),
                      const Text(''),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Total',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            totalMain.toString(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text(''),
                      const Text(''),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Discount',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: TextField(
                          maxLines: 1,
                          style: TextStyle(fontSize: 18),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: false,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 5, right: 15),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!withVAT && isVATneeded)
                    TableRow(
                      children: [
                        const Text(''),
                        const Text(''),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            'TotalTaxableAmt.',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              totalTaxable.toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!withVAT && isVATneeded)
                    TableRow(
                      children: [
                        const Text(''),
                        const Text(''),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            'VAT Amt.(13%)',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              vatAmountTotal.toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  TableRow(
                    children: [
                      const Text(''),
                      const Text(''),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Grand Total',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            grandTotal.toString(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Size Data Needed : ",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Checkbox(
                    value: isSizeNeeded,
                    onChanged: (_) {
                      setState(() {
                        isSizeNeeded = !isSizeNeeded;
                      });
                    },
                  ),
                ],
              ),
            ),
            isSizeNeeded
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(4),
                        15: FlexColumnWidth(2),
                      },
                      border: TableBorder.all(
                          color: primaryColor.withOpacity(0.5),
                          width:
                              1), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              isProductVerified ? 'ProductId' : 'ProductName',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          for (var j = 0; j < 14; j++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                (j + 1).toString(),
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              'Total',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ]),
                        for (var i = 0; i < int.parse(noOfProducts ?? '1'); i++)
                          TableRow(
                            children: [
                              isProductVerified
                                  ? SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          productsId[i].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          nameControllers[i].text.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ),
                              for (var k = 0; k < 14; k++)
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    controller: sizeControllers[i][k],
                                    onChanged: (text) {
                                      setState(() {
                                        var total = 0;
                                        for (var sum = 0; sum < 14; sum++) {
                                          total = total +
                                              int.parse(
                                                  sizeControllers[i][sum].text);
                                        }
                                        totalEachSize[i] = total;
                                      });
                                    },
                                    style: const TextStyle(fontSize: 18),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                      filled: false,
                                      contentPadding: EdgeInsets.only(
                                          left: 5, top: 5, right: 5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0))),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    totalEachSize[i].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  )
                : const SizedBox(),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Remarks',
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: 280,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLines: 10,
                style: const TextStyle(fontSize: 18),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: backgroundColor,
                    hintText: 'wirte remarks',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: primaryColor.withOpacity(0.5))),
              ),
            ),

            // Save Button
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
                      Navigator.pop(context);
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
            ),
          ],
        );
      },
    );
  }
}
