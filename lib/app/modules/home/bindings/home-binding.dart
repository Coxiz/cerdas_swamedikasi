import 'package:cerdas_swamedikasi/app/modules/home/controllers/home-controller.dart';
import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Register the data service if not already registered
    if (!Get.isRegistered<DataService>()) {
      Get.put(DataService().init(), permanent: true);
    }

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
