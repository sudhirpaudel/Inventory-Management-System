import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/models/transaction_model.dart';
import 'package:inventorymanagementsystem/screens/transaction/view_transaction_page.dart';

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
            'TotalProducts',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Total no.of products',
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

purchaseData(
    BuildContext context, width, OnlyTransactionModel transaction, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
          child: Text(
            index.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.id.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.client.clientName.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.client.panNumber.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            "${DateTime.parse(transaction.transactionDate).year.toString()}/${DateTime.parse(transaction.transactionDate).month.toString()}/${DateTime.parse(transaction.transactionDate).day.toString()}",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.totalAmount.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.numberOfProducts.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            transaction.totalNumberOfProducts.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      Row(
         children: [
           SizedBox(
            
            height: 50,
            child: Center(
              child: IconButton(
                onPressed: () {
                   showDialog(
                            context: context,
                            builder: (_) => const ViewTransactionPage(
                                ),);
                },
                icon: const Icon(
                  Icons.pageview,
                  color: primaryColor,
                ),
              ),
            ),
      ),
       SizedBox(
            
            height: 50,
            child: Center(
              child: IconButton(
                onPressed: () {
                   showDialog(
                            context: context,
                            builder: (_) => const ViewTransactionPage(
                                ),);
                },
                icon: const Icon(
                  Icons.edit_note_outlined,
                  color: primaryColor,
                ),
              ),
            ),
      ),
       SizedBox(
            
            height: 50,
            child: Center(
              child: IconButton(
                onPressed: () {
                   showDialog(
                            context: context,
                            builder: (_) => const ViewTransactionPage(
                                ),);
                },
                icon: const Icon(
                  Icons.delete,
                  color: primaryColor,
                ),
              ),
            ),
      ),
         ],
       ),
    ],
  );
}
