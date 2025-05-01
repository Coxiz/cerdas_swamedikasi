import 'package:get/get.dart';
import '../data/services/data_service.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Initialize DataService as a permanent dependency if not already done
    if (!Get.isRegistered<DataService>()) {
      Get.put<DataService>(await DataService().init(), permanent: true);
    }
  }
}
