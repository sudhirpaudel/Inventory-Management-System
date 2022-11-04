import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
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
                    'ADD CUSTOMER',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                          'Company Type',
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
                 
                ],
              ),
            ),
           
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
            )
          ],
        );
      },
    );
  }
}
