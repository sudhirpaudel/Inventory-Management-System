import 'dart:io';


import 'package:inventorymanagementsystem/functions/openandsave.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    savePdf(bytes);
    openPdf(bytes);
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
