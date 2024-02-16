import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:astro_guide/models/wallet/WalletHistoryModel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class InvoiceController extends GetxController {
  InvoiceController();

  final storage = GetStorage();


  late int id;
  late WalletHistoryModel transaction;
  late bool load;
  File? file;
  Completer<PDFViewController> controller = Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  // late int pcs, cut, mts, rate, amount, taxable;
  late ByteData fontData;
  late Font light, regular, medium, semiBold, bold;
  late String type;

  late List<List<List<Map<String, int>>>> items;


  @override
  void onInit() {
    super.onInit();
    transaction = Get.arguments;
    // id = Get.arguments;
    items = [];
    load = false;
    start();
  }

  Future<void> start() async {
    fontData = await rootBundle.load('assets/fonts/OpenSans-Light.ttf');
    light = Font.ttf(fontData.buffer.asByteData());
    fontData = await rootBundle.load('assets/fonts/OpenSans-Regular.ttf');
    regular = Font.ttf(fontData.buffer.asByteData());
    fontData = await rootBundle.load('assets/fonts/OpenSans-Medium.ttf');
    medium = Font.ttf(fontData.buffer.asByteData());
    fontData = await rootBundle.load('assets/fonts/OpenSans-SemiBold.ttf');
    semiBold = Font.ttf(fontData.buffer.asByteData());
    fontData = await rootBundle.load('assets/fonts/OpenSans-Bold.ttf');
    bold = Font.ttf(fontData.buffer.asByteData());
    update();
    processPDF();
    // getCSByID();
  }

  processPDF() async {
    if (await Essential.pdfRequestPermission().isGranted) {
    // if (await Essential.requestPermission()) {
      load = false;
      controller = Completer<PDFViewController>();
      update();
      final Uint8List pdfBytes = await generatePDF();
      final directory = await getTemporaryDirectory();

      // Create a new temporary file with a unique name
      String name = "Invoice_${DateFormat("dd-MMM-yyyy").format(DateTime.parse(transaction.created_at))}_${DateFormat("dd-MMM-yyyy").format(DateTime.now())}";
      file = File('${directory?.path}/${name}.pdf');

      await file!.writeAsBytes(pdfBytes);
    }
    load = true;

    update();
  }

  Future<Uint8List> generatePDF() async {
    final Document doc = Document(pageMode: PdfPageMode.fullscreen);

    int cnt = 0;
    late Uint8List bytes;
    final ByteData image = await rootBundle.load('assets/app_icon/icon1.png');
    bytes = (image).buffer.asUint8List();

    doc.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a3,
        // pageFormat: PdfPageFormat(width, height),
        margin: const EdgeInsets.all(20),
        build: (Context context) {
          return [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      children: [
                        getHeader(bytes),
                        SizedBox(
                          height: 30
                        ),
                        getSubHeader(),
                        SizedBox(
                          height: 10
                        ),
                        getItems(),
                        SizedBox(
                            height: 20
                        ),
                        getOtherDetails(),
                      ]
                  ),
                ]
            )
          ];
        },
      ),
    );

    return doc.save();
  }

  Widget getHeader(Uint8List bytes) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 2),
      child: Row(
        children: [
          Image(
            MemoryImage(bytes),
            width: 50,
            height: 50
          ),
          Flexible(
            child: getHeading()
          ),
          SizedBox(
            height: 50,
            width: 50
          ),
        ]
      ),
    );
  }

  Widget getSubHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 2),
            child: getUserInfo(),
          )
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 2),
            child: getTransactionInfo(),
          )
        ),
      ]
    );
  }

  Widget getUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Customer Address",
              style: TextStyle(
                  fontSize: 16,
                  font: medium
              )
          ),
          SizedBox(
              height: 2
          ),
          Text(
              "Hritvi Gajiwala",
              style: TextStyle(
                  fontSize: 14,
                  font: regular
              )
          ),
          SizedBox(
              height: 2
          ),
          Text(
              "Surat, Gujarat",
              style: TextStyle(
                  fontSize: 14,
                  font: regular
              )
          ),
          SizedBox(
              height: 2
          ),
          Text(
            "Place of Supply",
            style: TextStyle(
                fontSize: 16,
                font: medium
            )
          ),
          SizedBox(
              height: 2
          ),
          Text(
              "GJ",
              style: TextStyle(
                  fontSize: 14,
                  font: regular
              )
          ),
        ]
    );
  }

  Widget getTransactionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitleInfo("Transaction ID", transaction.transaction_id??""),
          getTitleInfo("Order ID", transaction.order_id??""),
          getTitleInfo("Invoice No.", transaction.invoice_id??""),
          getTitleInfo("Invoice Date", Essential.getDate(transaction.created_at)),
        ]
    );
  }


  Widget getTitleInfo(String title, String info) {
    return RichText(
      text: TextSpan(
        text: title+": ",
        style: TextStyle(
          fontSize: 16,
          font: medium
        ),
        children: [
          TextSpan(
            text: info,
            style: TextStyle(
              font: regular
            )
          )
        ]
      )
    );
  }

  Widget getHeading() {
    return Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "Invoice",
                    style: TextStyle(
                        fontSize: 20,
                        font: semiBold
                    )
                ),
                SizedBox(
                    height: 2
                ),
                Text(
                    "AstroGuide Pvt. Ltd.",
                    style: TextStyle(
                        fontSize: 16,
                        font: regular
                    )
                ),
                SizedBox(
                    height: 2
                ),
                Text(
                    "Supplier GST: 07GHTFF56GG7HHH, Website: www.astroguide.com",
                    style: TextStyle(
                        fontSize: 16,
                        font: regular
                    )
                ),
                SizedBox(
                    height: 2
                ),
                Text(
                    "Email: support@astroguide.com",
                    style: TextStyle(
                        fontSize: 16,
                        font: regular
                    )
                ),
                SizedBox(
                    height: 2
                ),
                Text(
                    "Address: 336, 3RD FLOOR AVADH ARENA, NEAR CROMA, VESU - 395018",
                    style: TextStyle(
                        fontSize: 16,
                        font: regular
                    )
                ),
              ]
          )
      )
    );
  }

  Widget getOtherDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Other Details",
              style: TextStyle(
                  fontSize: 14,
                  font: bold
              )
          ),
          SizedBox(
              height: 2
          ),
          getPairInfo("HSN/SAC", "993883"),
          getPairInfo("Whether tax is payable on this transaction", "NO"),
          getPairInfo("PAN Number", "J24ADDC6GGFF7"),
        ]
    );
  }

  Widget getPairInfo(String label, String info) {
    return Row(
        children: [
          getInfo(label),
          getInfo(info),
        ]
    );
  }

  Widget getItems() {
    return Column(
      children: [
        Table(
            columnWidths: {
              0: const FlexColumnWidth(2),
              1: const FlexColumnWidth(1),
              2: const FlexColumnWidth(1),
              3: const FlexColumnWidth(1),
              4: const FlexColumnWidth(2),
            },
            border:  TableBorder.all(color: PdfColors.black),
            children: [
              TableRow(
                children: [
                  getTitle("Description"),
                  getTitle("Total"),
                  getTitle("Offer Additional Amount"),
                  getTitle("Taxable Value"),
                  Column(
                      children: [
                        getTitle("GST"),
                        Table(
                            columnWidths: {
                              0: const FlexColumnWidth(1),
                              1: const FlexColumnWidth(1),
                            },
                            border:  TableBorder.all(color: PdfColors.black),
                            children: [
                              TableRow(
                                  children: [
                                    getTitle("Rate"),
                                    getTitle("Amount")
                                  ]
                              )
                            ]
                        ),
                      ]
                  ),
                ]
              )
            ]
        ),
        Table(
            columnWidths: {
              0: const FlexColumnWidth(2),
              1: const FlexColumnWidth(1),
              2: const FlexColumnWidth(1),
              3: const FlexColumnWidth(1),
              4: const FlexColumnWidth(1),
              5: const FlexColumnWidth(1),
            },
            border:  TableBorder.all(color: PdfColors.black),
            children: [
              TableRow(
                children: [
                  getInfo(transaction.description),
                  getInfo(transaction.amount.toStringAsFixed(2)),
                  getInfo((transaction.wallet_amount-transaction.amount).toStringAsFixed(2)),
                  getInfo("0.0"),
                  getInfo("18%"),
                  getInfo((transaction.amount*0.18).toStringAsFixed(2)),
                ]
              )
            ]
        ),
        Table(
            columnWidths: {
              0: const FlexColumnWidth(4),
              1: const FlexColumnWidth(1),
              2: const FlexColumnWidth(2),
            },
            border:  TableBorder.all(color: PdfColors.black),
            children: [
              TableRow(
                children: [
                  getTitle("Total", textAlign: TextAlign.right),
                  getTitle("0.0", textAlign: TextAlign.right),
                  getInfo((transaction.amount*0.18).toStringAsFixed(2), textAlign: TextAlign.right),
                ]
              )
            ]
        ),
        Table(
            columnWidths: {
              0: const FlexColumnWidth(4),
              1: const FlexColumnWidth(3),
            },
            border:  TableBorder.all(color: PdfColors.black),
            children: [
              TableRow(
                children: [
                  getTitle("Total GST", textAlign: TextAlign.right),
                  getInfo((transaction.amount*0.18).toStringAsFixed(2), textAlign: TextAlign.right),
                ]
              ),
              TableRow(
                children: [
                  getTitle("Total Amount", textAlign: TextAlign.right),
                  getInfo(((transaction.amount*0.18)+transaction.amount).toStringAsFixed(2), textAlign: TextAlign.right),
                ]
              ),
            ]
        )
      ]
    );
  }

  Widget getItems1() {
    return Table(
      columnWidths: {
        0: const FlexColumnWidth(4),
        1: const FlexColumnWidth(3),
      },
      border:  TableBorder.all(color: PdfColors.black),
      children: [
        TableRow(
          children: [
            Table(
              border:  TableBorder(verticalInside: BorderSide(color: PdfColors.black)),
              columnWidths: {
                0: const FlexColumnWidth(2),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    getTitle("Description"),
                    getTitle("Total"),
                    getTitle("Offer Additional Amount"),
                  ]
                )
              ],
            ),
            Table(
              border:  TableBorder(verticalInside: BorderSide(color: PdfColors.black)),
              columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(2),
              },
              children: [
                TableRow(
                    children: [
                      getTitle("Taxable Value"),
                      Column(
                          children: [
                            getTitle("GST"),
                            Table(
                                columnWidths: {
                                  0: const FlexColumnWidth(1),
                                  1: const FlexColumnWidth(1),
                                },
                                border:  TableBorder.all(color: PdfColors.black),
                                children: [
                                  TableRow(
                                      children: [
                                        getTitle("Rate"),
                                        getTitle("Amount")
                                      ]
                                  )
                                ]
                            ),
                          ]
                      ),
                    ]
                )
              ],
            )
          ]
        ),
        TableRow(
          children: [
            Table(
              border:  TableBorder(verticalInside: BorderSide(color: PdfColors.black)),
              columnWidths: {
                0: const FlexColumnWidth(2),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    getInfo(transaction.description),
                    getInfo(transaction.amount.toStringAsFixed(2)),
                    getInfo((transaction.wallet_amount-transaction.amount).toStringAsFixed(2)),
                  ]
                )
              ],
            ),
            Table(
              border:  TableBorder(verticalInside: BorderSide(color: PdfColors.black)),
              columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(2),
              },
              children: [
                TableRow(
                    children: [
                      getTitle("0"),
                      Table(
                          columnWidths: {
                            0: const FlexColumnWidth(1),
                            1: const FlexColumnWidth(1),
                          },
                          border:  TableBorder.all(color: PdfColors.black),
                          children: [
                            TableRow(
                                children: [
                                  getInfo("18%"),
                                  getInfo(transaction.amount.toStringAsFixed(2)),
                                ]
                            )
                          ]
                      ),
                    ]
                )
              ],
            )
          ]
        ),
      ]
    );
  }



  getCommonInfo(String info) {
    return Text(
        info,
        textAlign: TextAlign.left,
        style: TextStyle(
          font: bold,
          fontSize: 10,
        )
    );
  }

  Widget getTitle(String title, {TextAlign? textAlign}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text(
            title,
            style: TextStyle(
                fontSize: 12,
                font: bold
            ),
            textAlign: textAlign??TextAlign.center
        )
    );
  }

  Widget getInfo(String info, {TextAlign? textAlign}) {
    return Text(
        info,
        style: TextStyle(
          fontSize: 12,
          font: regular
        ),
      textAlign: textAlign??TextAlign.center
    );
  }

  Widget getItemInfo(Map<String, int> item, {bool? title}) {
    print(item);
    print(item.keys.first.substring(item.keys.first.indexOf("_")+1).replaceAll("_", " ").toUpperCase());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getDataInfo(item.keys.first.substring(item.keys.first.indexOf("_")+1).replaceAll("_", " ").toUpperCase(), title: true),
        getDataInfo(item.values.first.toString()),
      ]
    );
  }

  Widget getDataInfo(String info, {bool? title}) {
    return Text(
      info,
      style: TextStyle(
        fontSize: 14,
        font: title==true ? semiBold : regular
      )
    );
  }

  void shareFile() {
    XFile xFile =  XFile(file!.path);
    Essential.shareFile([xFile], "Invoice :  ${DateFormat("dd MMM, yyyy").format(DateTime.parse(transaction.created_at))} - ${DateTime.now()}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  int getMaxLength(List<List<Map<String, int>>> item) {
    int len = 0;
    for (var element in item) {
      if(element.length>len) {
        len = element.length;
      }
    }
    print("len");
    print(len);
    return len;
  }

  int getTotal(List<Map<String, int>> item) {
    int total = 0;
    item.forEach((element) {
      total += element.values.first;
    });
    return total;
  }
}
