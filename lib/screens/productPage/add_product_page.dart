import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
                          'Color',
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
                          'Version',
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
                          'Category',
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
                          'Company',
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
                          'Product',
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
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Available Sizes :   1     2     3     4      5     6     7 ",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(children: [
                const Text(
                  "Available Sizes : ",
                  style: TextStyle(fontSize: 20, color: Colors.transparent),
                ),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Available Sizes :   8     9    10    11  12   13   14 ",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(children: [
                const Text(
                  "Available Sizes : ",
                  style: TextStyle(fontSize: 20, color: Colors.transparent),
                ),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
                Checkbox(value: false, onChanged: (_) {}),
              ]),
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
