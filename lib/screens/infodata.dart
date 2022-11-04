import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

inventoryInfo() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      SizedBox(
        height: 50,
        width: 70,
        child: Center(
            child: Text(
          'SN',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Product No.',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Article No.',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Color',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Category',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Location',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Quantity',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Sizes',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        width: 40,
      )
    ],
  );
}

inventoryData() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      SizedBox(
        height: 50,
        width: 70,
        child: Center(
            child: Text(
          '1',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'L1119b',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          '1119',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Brown',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Female',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          'Pokhara',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          '32',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 120,
        child: Center(
            child: Text(
          '4 5 6 7 8',
          style: TextStyle(color: primaryColor, fontSize: 18),
        )),
      ),
      SizedBox(
        height: 50,
        width: 40,
        child: Center(
            child: Icon(
          Icons.arrow_drop_down,
          color: primaryColor,
        )),
      )
    ],
  );
}
