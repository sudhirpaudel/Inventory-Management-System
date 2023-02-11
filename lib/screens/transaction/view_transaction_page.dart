import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/api/single_transaction.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/functions/generate_invoice.dart';
import 'package:inventorymanagementsystem/functions/invoice.dart';
import 'package:inventorymanagementsystem/models/show_transaction.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class ViewTransactionPage extends StatefulWidget {
  const ViewTransactionPage({super.key});

  @override
  State<ViewTransactionPage> createState() => _ViewTransactionPageState();
}

class _ViewTransactionPageState extends State<ViewTransactionPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (context, setState) {
      return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: whiteColor,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: height / 8 - 40,
              width: width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TRANSACTION',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () async {
                      ShowTransaction transaction =
                          await getSingleTransactions(21);
                      final pdfFile = await PdfInvoiceApi.generate(transaction);
                      
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
          ]);
    });
  }
}
