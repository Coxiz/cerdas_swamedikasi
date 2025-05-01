import 'package:cerdas_swamedikasi/app/modules/recommendation/controllers/recommendation-controller.dart';
import 'package:get/get.dart';

class RecommendationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendationController>(
      () => RecommendationController(),
    );
  }
}
