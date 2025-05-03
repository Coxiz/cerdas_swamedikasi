import 'package:cerdas_swamedikasi/app/modules/guide/controllers/guide-controller.dart';
import 'package:get/get.dart';

class GuideController extends GetxController {
  final List<GuideStep> steps = [
    GuideStep(
      title: 'Halaman Awal',
      description:
          'Aplikasi CERDIK dimulai dengan tampilan utama yang menampilkan tiga menu: "Lakukan Swamedikasi", "Petunjuk Penggunaan", dan "Tentang Aplikasi". Untuk memulai proses swamedikasi, pilih menu "Lakukan Swamedikasi".',
      icon: 'home',
    ),
    GuideStep(
      title: 'Memilih Penyakit',
      description:
          'Setelah memilih "Lakukan Swamedikasi", Anda akan melihat daftar penyakit yang dapat ditangani dengan swamedikasi. Gunakan kolom pencarian di bagian atas untuk menemukan penyakit tertentu atau scroll untuk menelusuri daftar. Pilih penyakit yang sesuai dengan kondisi Anda dengan menekan pada namanya.',
      icon: 'format_list_bulleted',
    ),
    GuideStep(
      title: 'Konfirmasi Gejala',
      description:
          'Pada halaman detail penyakit, Anda akan melihat penjelasan singkat tentang penyakit tersebut dan daftar gejala yang mungkin dialami. Centang minimal dua gejala yang Anda alami. Jika gejala yang ditandai sebagai kritis dipilih, Anda dapat langsung melanjutkan ke rekomendasi. Tekan tombol "Lihat Hasil" untuk melanjutkan.',
      icon: 'medical_information',
    ),
    GuideStep(
      title: 'Rekomendasi Pengobatan',
      description:
          'Halaman rekomendasi akan menampilkan saran pengobatan berdasarkan gejala yang Anda pilih. Jika gejala kritis terdeteksi, Anda akan melihat peringatan untuk segera konsultasi ke dokter. Anda dapat menyalin rekomendasi dengan menekan tombol "Salin Rekomendasi" untuk referensi saat membeli obat di apotek atau untuk dibagikan kepada keluarga.',
      icon: 'recommend',
    ),
    GuideStep(
      title: 'Kembali ke Beranda',
      description:
          'Setelah melihat rekomendasi pengobatan, Anda dapat kembali ke halaman beranda dengan menekan tombol "Kembali ke Beranda". Dari sana, Anda dapat memulai proses swamedikasi baru untuk penyakit lain atau mengakses menu lainnya.',
      icon: 'home',
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
