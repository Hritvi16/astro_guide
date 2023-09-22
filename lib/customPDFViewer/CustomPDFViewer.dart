import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/customPDFViewer/CustomPDFViewerController.dart';

class CustomPDFViewer extends StatelessWidget {
  CustomPDFViewer({ Key? key }) : super(key: key);

  final CustomPDFViewerController customPDFViewerController =  Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomPDFViewerController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.colorButton,
              title: Text(
                customPDFViewerController.url.substring(customPDFViewerController.url.lastIndexOf("/") + 1),
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              elevation: 0,
            ),
            body: customPDFViewerController.load ?
            customPDFViewerController.file!=null ?
            PDFView(
              filePath: customPDFViewerController.file!.path,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              pageSnap: false,
              defaultPage: customPDFViewerController.currentPage!,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation:
              false, // if set to true the link is handled in flutter
              onRender: (_pages) {
                // setState(() {
                customPDFViewerController.pages = _pages;
                customPDFViewerController.isReady = true;
                customPDFViewerController.update();
                // });
              },
              onError: (error) {
                // setState(() {
                //   errorMessage = error.toString();
                // });
                print(error.toString());
              },
              onPageError: (page, error) {
                // setState(() {
                //   errorMessage = '$page: ${error.toString()}';
                // });
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                customPDFViewerController.controller.complete(pdfViewController);
              },
              onLinkHandler: (String? uri) {
                print('goto uri: $uri');
              },
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
                // setState(() {
                customPDFViewerController.currentPage = page;
                customPDFViewerController.update();
                // });
              },
            )
                : Container(
              child: Text(
                  "Request Permission"
              ),
            )
                : Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: MyColors.colorPrimary,
              ),
            )
        );
      },
    );
  }
}
