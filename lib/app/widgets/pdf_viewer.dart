import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pdfrx/pdfrx.dart';

class PdfViewWidget extends StatefulWidget {
  const PdfViewWidget({
    super.key,
    required this.pdfData,
    required this.title,
  });

  final Uint8List pdfData;
  final String title;

  @override
  State<PdfViewWidget> createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  late PdfViewerController controller;
  @override
  void initState() {
    controller = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PdfViewer.data(
            widget.pdfData,
            sourceName: widget.title,
            controller: controller,
            params: PdfViewerParams(
              backgroundColor: appTheme.primary,
              maxScale: 8,
              viewerOverlayBuilder: (context, size, isDragable) => [
                // Show vertical scroll thumb on the right; it has page number on it
                PdfViewerScrollThumb(
                  controller: controller,
                  orientation: ScrollbarOrientation.right,
                  thumbSize: const Size(40, 25),
                  thumbBuilder: (context, thumbSize, pageNumber, controller) =>
                      Container(
                    decoration: BoxDecoration(
                      color: appTheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        pageNumber.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Just a simple horizontal scroll thumb on the bottom
                PdfViewerScrollThumb(
                  controller: controller,
                  orientation: ScrollbarOrientation.bottom,
                  thumbSize: const Size(80, 10),
                  thumbBuilder: (context, thumbSize, pageNumber, controller) =>
                      Container(
                    decoration: BoxDecoration(
                      color: appTheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
              loadingBannerBuilder: (context, bytesDownloaded, totalBytes) =>
                  Center(
                child: CircularProgressIndicator(
                  value:
                      totalBytes != null ? bytesDownloaded / totalBytes : null,
                  backgroundColor: appTheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        height: 60,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () async {
                // await downloadPrescription();
              },
              icon: const Icon(Icons.download),
            ),
            IconButton(
              onPressed: () async {
                // var result = await Share.shareXFiles([
                //   XFile.fromData(
                //     data!,
                //     name:
                //         "${widget.prescription.consultationId ?? "" ""}.pdf",
                //     mimeType: "application/pdf",
                //   ),
                // ]);

                // switch (result.status) {
                //   case ShareResultStatus.success:
                //     CustomSnackBars.showSnackBar(
                //         context, "Shared successfully");
                //   case ShareResultStatus.dismissed:
                //     CustomSnackBars.showSnackBar(
                //       context,
                //       "Cancelled",
                //       isWarning: true,
                //     );
                //   case ShareResultStatus.unavailable:
                //     CustomSnackBars.showSnackBar(
                //       context,
                //       "Sharing not available",
                //       isError: true,
                //     );
                // }
              },
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {
                controller.zoomUp();
              },
              icon: const Icon(Icons.zoom_in),
            ),
            IconButton(
              onPressed: () {
                controller.zoomDown();
              },
              icon: const Icon(Icons.zoom_out),
            ),
          ],
        ),
      ),
    );
  }
}
