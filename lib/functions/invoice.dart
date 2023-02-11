import 'dart:io';
import 'package:inventorymanagementsystem/functions/generate_invoice.dart';
import 'package:inventorymanagementsystem/models/show_transaction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(ShowTransaction transaction) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(transaction),
        SizedBox(height: 0.6 * PdfPageFormat.cm),
        buildTitle(),
        SizedBox(height: 0.2 * PdfPageFormat.cm),
        buildCompanyDetails(),
        Divider(),
        buildInvoice(transaction.products),
        Divider()
      ],
      footer: (context) =>
          buildFooter(transaction.transaction.client.clientName),
    ));
    print("file saved");
    print('..');
    return PdfApi.saveDocument(name: 'myinvoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(ShowTransaction transaction) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.7 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress('Fitmonk Inc Private Limited'),
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: 'Global IME Fitmonk Inc pvt.ltd A/C NO: 11701010005203',
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      );

//   static Widget buildCustomerAddress(Customer customer) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
//           Text(customer.address),
//         ],
//       );

//   static Widget buildInvoiceInfo(InvoiceInfo info) {
//     final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
//     final titles = <String>[
//       'Invoice Number:',
//       'Invoice Date:',
//       'Payment Terms:',
//       'Due Date:'
//     ];
//     final data = <String>[
//       info.number,
//       Utils.formatDate(info.date),
//       paymentTerms,
//       Utils.formatDate(info.dueDate),
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: List.generate(titles.length, (index) {
//         final title = titles[index];
//         final value = data[index];

//         return buildText(title: title, value: value, width: 200);
//       }),
//     );
//   }

  static Widget buildSupplierAddress(String supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text('Pokhara 27 ,BuddhaTole ,Kaski',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text('VAT No. 610333831',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
        ],
      );

  static Widget buildTitle() => SizedBox(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'VAT BILL',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 1 * PdfPageFormat.mm),
                Text(
                  "INVOICE",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 0.2 * PdfPageFormat.cm),
              ],
            ),
            SizedBox()
          ]));

  static Widget buildInvoice(List<ProductElement> productEl) {
    int i = 0;

    final headers = ['SN', 'Article NO.', 'Quantity', 'Unit Price', 'Total'];
    final data = productEl.map((item) {
      final total = item.product.productPrice * item.product.numberOfProducts;
      i = i + 1;
      return [
        i,
        '${item.product}',
        '${item.product.numberOfProducts}',
        'Rs. ${item.product.productPrice}',
        'Rs. ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
      },
    );
  }

  // static Widget buildTotal(Invoice invoice) {
  //   final netTotal = invoice.items
  //       .map((item) => item.unitPrice * item.quantity)
  //       .reduce((item1, item2) => item1 + item2);
  //   final vatPercent = invoice.items.first.vat;
  //   final vat = netTotal * vatPercent;
  //   final total = netTotal + vat;

  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: Row(
  //       children: [
  //         Spacer(flex: 6),
  //         Expanded(
  //           flex: 4,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               buildText(
  //                 title: 'Net total',
  //                 value: Utils.formatPrice(netTotal),
  //                 unite: true,
  //               ),
  //               buildText(
  //                 title: 'Vat ${vatPercent * 100} %',
  //                 value: Utils.formatPrice(vat),
  //                 unite: true,
  //               ),
  //               Divider(),
  //               buildText(
  //                 title: 'Total amount due',
  //                 titleStyle: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 value: Utils.formatPrice(total),
  //                 unite: true,
  //               ),
  //               SizedBox(height: 2 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //               SizedBox(height: 0.5 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Widget buildFooter(String invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Company', value: 'Fitmonk INC'),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Distributor of', value: 'BBest Polymers'),
          SizedBox(height: 1 * PdfPageFormat.mm),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

//   static buildText({
//     required String title,
//     required String value,
//     double width = double.infinity,
//     TextStyle? titleStyle,
//     bool unite = false,
//   }) {
//     final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

//     return Container(
//       width: width,
//       child: Row(
//         children: [
//           Expanded(child: Text(title, style: style)),
//           Text(value, style: unite ? style : null),
//         ],
//       ),
//     );
//   }
// }

  static Widget buildCompanyDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' Buyers Name')),
          Text("  :   "),
          Text('Rupim Fancy')
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' Address')),
          Text("  :   "),
          Text('Birauta 17')
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' PAN/VAT')),
          Text("  :   "),
          Text('23467889')
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' Manager')),
          Text("  :   "),
          Text('Mr Rupim')
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' Phone')),
          Text("  :   "),
          Text('9856033445')
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
      ],
    ),
     Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text(' Date')),
          Text("  :   "),
          Text('2072/12/12')
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          SizedBox(width: 3 * PdfPageFormat.cm, child: Text('Invoice No.')),
          Text("  :   "),
          Text('17')
        ]),
        
      ],
    )
    ]);
    
  }
}
