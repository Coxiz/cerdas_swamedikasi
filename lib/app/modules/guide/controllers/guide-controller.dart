import 'package:get/get.dart';

class GuideController extends GetxController {
  final List<GuideStep> steps = [
    GuideStep(
      title: 'Halaman Awal',
      description: 'Aplikasi android ini dimulai dengan tampilan depan sederhana yang terdiri dari 3 menu utama: Lakukan Swamedikasi, Petunjuk Penggunaan dan Tentang Aplikasi. Menu Lakukan Swamedikasi digunakan oleh pengguna umum (masyarakat) yang menggunakan aplikasi ini untuk melakukan swamedikasi.',
      icon: 'home',
    ),
    GuideStep(
      title: 'Daftar Penyakit',
      description: 'Jika menu Lakukan Swamedikasi dipilih dari layar utama, maka tampilan pertama yang muncul adalah daftar penyakit yang bisa dipilih. Pengguna silakan memilih penyakit yang diduga diderita atau mencari menggunakan tombol pencarian. Klik nama penyakit untuk masuk ke detail penyakit.',
      icon: 'format_list_bulleted',
    ),
    GuideStep(
      title: 'Detail Penyakit',
      description: 'Halaman detail penyakit berfungsi untuk memastikan bahwa penyakit itu yang diderita oleh pengguna. Ada daftar gejala yang bisa dipilih, dan pengguna harus mencentang gejala yang diderita untuk menyesuaikan dosis atau tindakan medikasi yang nanti akan disarankan. Jika gejala sudah dipilih, dapat dilanjutkan dengan menekan tombol Lanjutkan.',
      icon: 'medical_information',
    ),
    GuideStep(
      title: 'Saran Tindakan Swamedikasi',
      description: 'Halaman terakhir adalah halaman saran tindakan swamedikasi sesuai dengan penyakit dan gejala yang dipilih sebelumnya. Saran tindakan medis ini dapat dicopy untuk dikirim atau disimpan sebagai catatan menuju tindakan selanjutnya, misalnya untuk keperluan membeli obat ke apotek terdekat.',
      icon: 'recommend',
    ),
  ];
  
  void goBack() {
    Get.back();
  }
}

class GuideStep {
  final String title;
  final String description;
  final String icon;
  
  GuideStep({
    required this.title,
    required this.description,
    required this.icon,
  });
}
