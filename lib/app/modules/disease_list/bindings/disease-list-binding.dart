import 'package:cerdas_swamedikasi/app/modules/disease_list/controllers/disease-list-controller.dart';
import 'package:get/get.dart';

class DiseaseListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseListController>(
      () => DiseaseListController(),
    );
  }
}
