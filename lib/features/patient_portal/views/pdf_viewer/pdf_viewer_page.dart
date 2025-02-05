import 'dart:typed_data';

import 'package:delta_hospital/features/patient_portal/views/pdf_viewer/pdf_viewer_view.dart';
import 'package:flutter/material.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({
    super.key,
    required this.pdfData,
    required this.title,
  });
  static String routeName = 'pdf-viewer';
  static String routePath = 'pdf-viewer';
  final Uint8List pdfData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PdfViewerView(
      title: title,
      pdfData: pdfData,
    );
  }
}
