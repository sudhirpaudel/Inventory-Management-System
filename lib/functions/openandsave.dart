
import 'dart:html';

import 'package:flutter/foundation.dart';
void savePdf(Uint8List pdfData) {
  final blob = Blob([pdfData], 'application/pdf');
  final url = Url.createObjectUrlFromBlob(blob);
  final link = document.createElement('a') as AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'document.pdf';
  document.body!.children.add(link);
  link.click();
  document.body!.children.remove(link);
  Url.revokeObjectUrl(url);
}


void openPdf(Uint8List pdfData) {
  final blob = Blob([pdfData], 'application/pdf');
  final url = Url.createObjectUrlFromBlob(blob);
  final iframe = IFrameElement()
    ..src = url
    ..style.display = 'block'
    ..width = '100%'
    ..height = '600px';
  document.body!.children.add(iframe);
}