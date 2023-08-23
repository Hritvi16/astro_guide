import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = Get.arguments;
    return SizedBox(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return image[index].contains("http") ? PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(image[index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: image),
            ) :
            PhotoViewGalleryPageOptions(
              imageProvider: FileImage(File(image[index])),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: image),
            );
          },
          itemCount: image.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / (event.expectedTotalBytes??0),
              ),
            ),
          ),
        )
    );
  }
}


// class PhotoView extends StatelessWidget {
//   const PhotoView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String image = Get.arguments;
//     return SizedBox(
//         width: MediaQuery.of(context).size.width * 1,
//         height: MediaQuery.of(context).size.height * 1,
//         // child: Image.network(
//         //   image,
//         // ),
//         child: PhotoViewGallery.builder(
//           scrollPhysics: const BouncingScrollPhysics(),
//           builder: (BuildContext context, int index) {
//             return image.contains("http") ? PhotoViewGalleryPageOptions(
//               imageProvider: NetworkImage(image),
//               initialScale: PhotoViewComputedScale.contained * 0.8,
//               heroAttributes: PhotoViewHeroAttributes(tag: image),
//             ) :
//             PhotoViewGalleryPageOptions(
//               imageProvider: FileImage(File(image)),
//               initialScale: PhotoViewComputedScale.contained * 0.8,
//               heroAttributes: PhotoViewHeroAttributes(tag: image),
//             );
//           },
//           itemCount: 1,
//           loadingBuilder: (context, event) => Center(
//             child: Container(
//               width: 20.0,
//               height: 20.0,
//               child: CircularProgressIndicator(
//                 value: event == null
//                     ? 0
//                     : event.cumulativeBytesLoaded / (event.expectedTotalBytes??0),
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

