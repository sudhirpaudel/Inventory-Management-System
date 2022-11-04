import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

class AddSalesPage extends StatefulWidget {
  const AddSalesPage({super.key});

  @override
  State<AddSalesPage> createState() => _AddSalesPageState();
}

class _AddSalesPageState extends State<AddSalesPage> {
  bool isCompanyVerified = true;
  bool isProductVerified = false;
  bool isVATneeded = false;
  bool withVAT = true;
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
                    'ADD SALES',
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
                                      'Name',
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
                      : Container(
                          height: 40,
                          width: 300,
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          decoration: const BoxDecoration(
                              color: backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'PAN number',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: primaryColor.withOpacity(0.5),
                            ),
                          ),
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
                                    hintText: 'Name',
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
                                    hintText: 'PAN number',
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
                          'No. of Products',
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
                          setState(() {});
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
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Table(
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
                    TableRow(children: [
                      isProductVerified
                          ? SizedBox(
                              height: 30,
                              child: DropdownButton(
                                  underline: Container(
                                    height: 1,
                                    color: Colors.transparent,
                                  ),
                                  isExpanded: true,
                                  iconEnabledColor: primaryColor,
                                  iconDisabledColor: primaryColor,
                                  iconSize: 30,
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      'Product Id',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
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
                            )
                          : SizedBox(
                              height: 30,
                              child: TextField(
                                maxLines: 1,
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
                                        color: primaryColor.withOpacity(0.5))),
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
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            '0.0',
                            style: Theme.of(context).textTheme.displayLarge,
                          ))),
                    ]),
                  ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Table(
                  border: TableBorder.all(
                      color: primaryColor.withOpacity(0.5),
                      width:
                          1), // Allows to add a border decoration around your table
                  children: [
                    TableRow(children: [
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
                            '0.0',
                            style: Theme.of(context).textTheme.displayLarge,
                          ))),
                    ]),
                    TableRow(children: [
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
                    ]),
                    if (!withVAT)
                      TableRow(children: [
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
                              '0.0',
                              style: Theme.of(context).textTheme.displayLarge,
                            ))),
                      ]),
                    if (!withVAT)
                      TableRow(children: [
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
                              '0.0',
                              style: Theme.of(context).textTheme.displayLarge,
                            ))),
                      ]),
                    TableRow(children: [
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
                            '0.0',
                            style: Theme.of(context).textTheme.displayLarge,
                          ))),
                    ]),
                  ]),
            ),
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
