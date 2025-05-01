import 'package:get/get.dart';

class AboutController extends GetxController {
  final String appVersion = '1.0.0';
  final String appDescription = 'Aplikasi Cerdas Swamedikasi adalah aplikasi yang dipergunakan untuk melakukan swamedikasi oleh pengguna aplikasi dengan memilih penyakit yang dideritanya. Aplikasi ini dibuat untuk membantu masyarakat agar bisa melakukan tindakan mandiri berdasarkan gejala-gejala yang dipilih.';
  final String developerInfo = 'Dikembangkan oleh Tim Pengembang Aplikasi Cerdas Swamedikasi';
  final String contactEmail = 'support@cerdasswamedikasi.com';
  
  void goBack() {
    Get.back();
  }
}
