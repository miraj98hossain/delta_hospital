import 'dart:typed_data';

import 'package:delta_hospital/app/widgets/pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewerView extends StatefulWidget {
  const PdfViewerView({
    super.key,
    required this.pdfData,
    required this.title,
  });
  final Uint8List pdfData;
  final String title;

  @override
  State<PdfViewerView> createState() => _PdfViewerViewState();
}

class _PdfViewerViewState extends State<PdfViewerView> {
  @override
  Widget build(BuildContext context) {
    return PdfViewWidget(
      title: widget.title,
      pdfData: widget.pdfData,
    );
  }
}
