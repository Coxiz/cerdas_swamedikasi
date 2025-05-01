import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _startSplashScreen();
  }

  // Method to handle splash screen timing and navigation
  void _startSplashScreen() async {
    // Simulate loading (3 seconds)
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to home screen
    isLoading.value = false;
    Get.offAllNamed(AppConstants.HOME);
  }
}
