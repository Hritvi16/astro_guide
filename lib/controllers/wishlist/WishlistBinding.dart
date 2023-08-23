import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/wishlist/WishlistController.dart';

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());

    Get.lazyPut<SpecRepository>(() => SpecRepository(Get.find()));
    Get.lazyPut<SpecProvider>(() => SpecProvider(Get.find()));

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
