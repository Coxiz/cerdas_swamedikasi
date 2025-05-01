import 'package:cerdas_swamedikasi/app/modules/guide/controllers/guide-controller.dart';
import 'package:get/get.dart';

class GuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuideController>(
      () => GuideController(),
    );
  }
}
