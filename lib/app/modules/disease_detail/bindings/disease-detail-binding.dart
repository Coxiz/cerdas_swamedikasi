import 'package:cerdas_swamedikasi/app/modules/disease_detail/controllers/disease-detail-controller.dart';
import 'package:get/get.dart';

class DiseaseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseDetailController>(
      () => DiseaseDetailController(),
    );
  }
}
