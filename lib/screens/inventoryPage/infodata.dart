import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

inventoryInfo(BuildContext context, width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
            child: Text(
          'SN',
          style: Theme.of(context).textTheme.bodySmall,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Product No.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Article No.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Color',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Location',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Quantity',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 8,
        child: Center(
          child: Text(
            'Sizes',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        width: width / 24,
      )
    ],
  );
}

inventoryData(BuildContext context, width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child:  Center(
            child: Text(
          '1',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          'L1119b',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          '1119',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          'Brown',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          'Female',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          'Pokhara',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          '32',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 8,
        child:  Center(
            child: Text(
          '4   5   6   7  8',
         style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 24,
        child: const Center(
            child: Icon(
          Icons.arrow_drop_down,
          color: primaryColor,
        )),
      )
    ],
  );
}
