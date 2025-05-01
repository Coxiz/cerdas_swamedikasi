import 'package:get/get.dart';
import '../../../data/services/data_service.dart';

class HomeController extends GetxController {
  final DataService _dataService = Get.find<DataService>();
  
  var isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Any initialization logic can go here
  }
  
  void goToDiseaseList() {
    Get.toNamed('/disease-list');
  }
  
  void goToAbout() {
    Get.toNamed('/about');
  }
  
  void goToGuide() {
    Get.toNamed('/guide');
  }
}
