import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';

purchaseInfo(BuildContext context, width) {
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
            'Purchase Id.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Purchased From',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Their PAN/VAT',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Date',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Amount',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Payment Method',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Payment Status',
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

purchaseData(BuildContext context, width) {
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
          'BB2022B1',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          'BBest Polymers',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          '457677889',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          '2079/5/11',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
     
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          '2,33,222.34',
         style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          'Cash',
         style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child:  Center(
            child: Text(
          'Completed',
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
