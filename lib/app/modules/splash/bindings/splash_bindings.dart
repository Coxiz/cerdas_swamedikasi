import 'package:cerdas_swamedikasi/app/modules/splash/controllers/splash_controllers.dart';
import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize DataService if not already done
    if (!Get.isRegistered<DataService>()) {
      Get.put(DataService().init(), permanent: true);
    }

    Get.put<SplashController>(
      SplashController(),
    );
  }
}
