import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/recommendation-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/symptom-model.dart';
import 'package:get/get.dart';

class DataService extends GetxService {
  // Mock data for diseases
  final List<Disease> _diseases = [
    Disease(
      id: '1',
      name: 'Diare',
      description:
          'Diare adalah kondisi di mana feses yang dikeluarkan encer atau berair dengan frekuensi lebih sering daripada biasanya.',
      symptoms: ['1', '2', '3', '4'],
      medications: ['1', '2', '3'],
    ),
    Disease(
      id: '2',
      name: 'Demam',
      description:
          'Kondisi dimana suhu tubuh melebihi normal (37.8°C), menimbulkan rasa tidak nyaman dan acapkali berhubungan dengan kondisi patologik serius.',
      symptoms: ['5', '6', '7', '8'],
      medications: ['4', '5', '6', '7', '8'],
    ),
    Disease(
      id: '3',
      name: 'Batuk',
      description:
          'Batuk adalah respon refleks protektif tubuh yang disebabkan ketika saluran napas terhalang. Tujuannya adalah untuk membersihkan jalan napas sehingga pernapasan dapat berlanjut normal.',
      symptoms: ['9', '10', '11'],
      medications: ['9', '10'],
    ),
    Disease(
      id: '4',
      name: 'Pilek/Influenza',
      description:
          'Suatu kondisi penyakit di pernapasan yang disebabkan oleh virus yang ditandai demam, sakit kepala, hidung tersumbat, dan disertai dengan sakit tenggorokan.',
      symptoms: ['12', '13', '14'],
      medications: ['11', '12', '13'],
    ),
    Disease(
      id: '5',
      name: 'Luka Bakar',
      description:
          'Luka bakar adalah kehilangan jaringan yang disebabkan kontak dengan sumber panas seperti air, api, bahan kimia, listrik, dan radiasi.',
      symptoms: ['15', '16', '17', '18'],
      medications: ['14', '15'],
    ),
    Disease(
      id: '6',
      name: 'Maag',
      description:
          'Sekumpulan gejala nyeri, perasaan tidak enak pada perut bagian atas yang menetap, atau berulang disertai dengan gejala lainnya seperti rasa penuh saat makan, cepat kenyang, kembung, bersendawa, nafsu makan menurun, mual, muntah, dan dada terasa panas.',
      symptoms: ['19', '20', '21', '22'],
      medications: ['16'],
    ),
    Disease(
      id: '7',
      name: 'Biang Keringat',
      description:
          'Miliaria atau adanya ruam kecil dengan warna kemerahan yang menyebabkan gatal dan perih pada kulit.',
      symptoms: ['23', '24', '25', '26'],
      medications: ['17', '18'],
    ),
    Disease(
      id: '8',
      name: 'Jerawat',
      description:
          'Jerawat merupakan keadaan kulit tidak normal ketika produksi minyak berlebih dan pori-pori tersumbat sehingga timbul bintik kemerahan pada kulit.',
      symptoms: ['27', '28', '29'],
      medications: ['19', '20'],
    ),
    Disease(
      id: '9',
      name: 'Mual dan Muntah',
      description:
          'Mual (nausea) adalah sensasi atau perasaan yang tidak menyenangkan dan sering merupakan gejala awal dari muntah. Sedangkan muntah (vomiting) adalah kejadian yang terkoordinasi namun tidak di bawah kontrol dari aktivitas gastrointestinal dan respiratori dimana isi lambung keluar secara paksa melalui mulut.',
      symptoms: ['30', '31', '32'],
      medications: ['21', '22', '23', '24', '25'],
    ),
    Disease(
      id: '10',
      name: 'Kandidiasis Vulvovaginal',
      description:
          'Inflamasi pada vulva dan vagina akibat infeksi jamur Candida albicans, yang paling sering terjadi pada wanita usia reproduksi.',
      symptoms: ['33', '34', '35'],
      medications: ['26'],
    ),
    Disease(
      id: '11',
      name: 'Dysmenorrhoea',
      description:
          'Nyeri haid atau dismenore adalah nyeri atau kram di perut bagian bawah, yang muncul sebelum atau sewaktu menstruasi.',
      symptoms: ['36', '37', '38'],
      medications: ['4', '5'],
    ),
    Disease(
      id: '12',
      name: 'Mata Kering',
      description:
          'Dry Eye (mata kering) adalah kelainan multifaktorial dari tear film yang menimbulkan gejala berupa rasa tidak nyaman (nyeri, mengganjal, dan mudah iritasi), gangguan penglihatan dan ketidakstabilan lapisan air mata dengan potensi kerusakan di permukaan mata (kornea).',
      symptoms: ['39', '40', '41'],
      medications: ['27'],
    ),
    Disease(
      id: '13',
      name: 'Sariawan',
      description:
          'Muncul lesi putih atau merah yang bulat atau oval di dalam mulut atau di bibir.',
      symptoms: ['42', '43', '44'],
      medications: ['28'],
    ),
  ];

  // Mock data for symptoms
  final List<Symptom> _symptoms = [
    // Gejala Diare
    Symptom(
      id: '1',
      name: 'Keram perut, mual (bisa disertai muntah), konsistensi feses cair',
      description: 'Kondisi umum pada diare ringan',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '2',
      name: 'Frekuensi BAB ≥3 kali sehari',
      description: 'Buang air besar lebih sering dari biasanya',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '3',
      name:
          'Perasaan lemas, tampak pucat, bibir tampak kering, frekuensi buang air kecil berkurang',
      description: 'Tanda awal dehidrasi',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '4',
      name: 'Keram perut, mual, BAB lebih dari 3 kali dan lemas',
      description: 'Tanda diare yang membutuhkan perhatian medis',
      severity: 3,
      isCritical: true,
    ),

    // Gejala Demam
    Symptom(
      id: '5',
      name: 'Suhu tubuh di atas normal (>37.8°C) kurang dari 3 hari',
      description: 'Demam ringan dengan durasi singkat',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '6',
      name: 'Dapat disertai sakit kepala dan lemas',
      description: 'Gejala umum yang menyertai demam',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '7',
      name:
          'Demam dirasakan setelah terjatuh/luka, atau ada gejala lain yang mengganggu aktivitas',
      description: 'Demam yang mungkin berhubungan dengan infeksi',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '8',
      name:
          'Pada anak usia <6 bulan suhu mencapai 38.5°C, dan >6 bulan suhu mencapai 40°C',
      description: 'Demam tinggi pada anak yang memerlukan penanganan segera',
      severity: 3,
      isCritical: true,
    ),

    // Gejala Batuk
    Symptom(
      id: '9',
      name: 'Batuk cukup mengganggu dengan tenggorokan gatal',
      description: 'Batuk ringan yang mengganggu kenyamanan',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '10',
      name:
          'Sputum/lendir dahak berwarna hijau/putih susu dengan batuk dialami lebih dari 3 hari',
      description: 'Tanda kemungkinan infeksi bakteri',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '11',
      name: 'Tidak mengkonsumsi obat lain sebelumnya seperti obat hipertensi',
      description: 'Tidak ada riwayat pengobatan yang berpotensi berinteraksi',
      severity: 1,
      isCritical: false,
    ),

    // Gejala Pilek/Influenza
    Symptom(
      id: '12',
      name: 'Pilek yang dialami terjadi 1-2 hari',
      description: 'Pilek ringan dengan durasi singkat',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '13',
      name: 'Disertai demam/menggigil',
      description: 'Gejala umum pada influenza',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '14',
      name: 'Pilek disertai batuk berdahak yang sangat mengganggu aktivitas',
      description: 'Tanda infeksi yang mungkin memerlukan penanganan medis',
      severity: 3,
      isCritical: true,
    ),

    // Gejala Luka Bakar
    Symptom(
      id: '15',
      name: 'Luka bakar tampak merah dan terasa sakit',
      description: 'Luka bakar derajat pertama',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '16',
      name: 'Belum ada konsumsi obat sebelumnya',
      description: 'Belum ada upaya pengobatan',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '17',
      name:
          'Ada demam menggigil dan luka sudah diobati sendiri namun belum ada perubahan',
      description: 'Tanda kemungkinan infeksi',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '18',
      name: 'Kulit menjadi merah muda dan tampak hampir terbuka kulitnya',
      description: 'Luka bakar derajat dua',
      severity: 3,
      isCritical: false,
    ),

    // Gejala Maag
    Symptom(
      id: '19',
      name: 'Perut mual tanpa muntah',
      description: 'Gejala ringan maag',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '20',
      name:
          'Muntah hebat dan enggan mengkonsumsi makan/minum baik pada kondisi hamil dan menyusui atau tidak',
      description: 'Tanda gangguan pencernaan serius',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '21',
      name: 'Mengganggu aktivitas',
      description:
          'Maag yang cukup berat hingga mengganggu aktivitas sehari-hari',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '22',
      name: 'Tidak mengkonsumsi obat anti nyeri/obat kardiovaskular',
      description:
          'Tidak ada riwayat pengobatan yang berpotensi memperburuk maag',
      severity: 1,
      isCritical: false,
    ),

    // Gejala Biang Keringat
    Symptom(
      id: '23',
      name: 'Tampak gatal dan mengganggu aktivitas',
      description: 'Gejala umum biang keringat',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '24',
      name: 'Tampak bintik putih dan kemerahan',
      description: 'Ciri khas biang keringat',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '25',
      name:
          'Disertai demam/menggigil sebelumnya baru munculnya bentol pada kulit',
      description: 'Tanda kemungkinan infeksi',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '26',
      name:
          'Bintil-bintil halus kemerahan terutama pada daerah-daerah lipatan tubuh seperti leher, lipat tangan, lipat siku',
      description: 'Lokasi tipikal biang keringat',
      severity: 2,
      isCritical: false,
    ),

    // Gejala Jerawat
    Symptom(
      id: '27',
      name:
          'Bintik merah menonjol dan sakit umumnya berisi nanah, biasa di bagian wajah',
      description: 'Papula dan pustula jerawat',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '28',
      name: 'Kulit yang sering berminyak',
      description: 'Kulit dengan produksi sebum berlebih',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '29',
      name: 'Jerawat yang timbul sudah lebih dari 2 bulan',
      description: 'Jerawat kronis yang perlu penanganan khusus',
      severity: 2,
      isCritical: true,
    ),

    // Gejala Mual dan Muntah
    Symptom(
      id: '30',
      name:
          'Mual dan muntah sangat umum terjadi pada kehamilan. Infeksi akut (gastroenteritis) sering menyebabkan muntah',
      description: 'Penyebab umum mual muntah',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '31',
      name:
          'Adanya cidera/terjatuh yang mengenai kepala sebelum merasakan mual/muntah',
      description: 'Tanda kemungkinan cedera kepala',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '32',
      name: 'Mual/muntah yang dirasakan sudah terjadi lebih dari 2 jam',
      description: 'Mual muntah yang berlangsung cukup lama',
      severity: 2,
      isCritical: false,
    ),

    // Gejala Kandidiasis Vulvovaginal
    Symptom(
      id: '33',
      name: 'Gatal yang berlebihan pada vagina',
      description: 'Gejala utama kandidiasis vulvovaginal',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '34',
      name: 'Pembengkakan pada vagina dan vulva',
      description: 'Tanda inflamasi pada area genital',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '35',
      name:
          'Rasa nyeri dan terbakar saat buang air kecil, keputihan yang menggumpal dan berwarna cokelat',
      description: 'Tanda infeksi yang memerlukan penanganan medis',
      severity: 3,
      isCritical: true,
    ),

    // Gejala Dysmenorrhoea
    Symptom(
      id: '36',
      name:
          'Nyeri hingga ke bagian punggung dan kaki dimulai pada hari pertama atau sehari sebelum menstruasi',
      description: 'Pola nyeri khas dismenore',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '37',
      name:
          'Berlangsung 12-24 jam, namun beberapa kasus dapat berlangsung 2-3 hari',
      description: 'Durasi nyeri menstruasi normal',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '38',
      name: 'Disertai demam dan pandangan kabur',
      description: 'Tanda kemungkinan kondisi serius',
      severity: 3,
      isCritical: true,
    ),

    // Gejala Mata Kering
    Symptom(
      id: '39',
      name: 'Rasa terbakar, perih dan kering pada mata',
      description: 'Gejala utama mata kering',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '40',
      name:
          'Penglihatan tidak tajam/fokus, mudah silau dan sensitif terhadap cahaya, mata berair secara berlebihan dengan rasa sakit gatal yang mengganggu aktivitas',
      description: 'Tanda mata kering yang cukup parah',
      severity: 3,
      isCritical: true,
    ),
    Symptom(
      id: '41',
      name: 'Mata tampak merah',
      description: 'Tanda iritasi atau inflamasi',
      severity: 2,
      isCritical: false,
    ),

    // Gejala Sariawan
    Symptom(
      id: '42',
      name: 'Terdapat sensasi terbakar atau gatal sebelum sariawan muncul',
      description: 'Gejala prodromal sariawan',
      severity: 1,
      isCritical: false,
    ),
    Symptom(
      id: '43',
      name:
          'Sariawan dapat membuat sulit untuk makan makanan tertentu, terutama yang pedas, asam, atau keras',
      description: 'Ketidaknyamanan saat makan',
      severity: 2,
      isCritical: false,
    ),
    Symptom(
      id: '44',
      name: 'Sariawan tampak membesar dan disertai demam menggigil',
      description: 'Tanda kemungkinan infeksi serius',
      severity: 3,
      isCritical: true,
    ),
  ];

  // Mock data for recommendations
  final List<Recommendation> _recommendations = [
    // Rekomendasi Diare
    Recommendation(
      id: '1',
      diseaseId: '1', // Diare
      title: 'Rekomendasi untuk Diare',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi diare:',
      medications: [
        MedicationItem(
          id: '1',
          name: 'Loperamid',
          dosage:
              '> 18 tahun maksimal 8 tablet/hari, anak > 8 tahun 1 tablet maksimal 4-6 tablet/hari',
          frequency: 'Awalnya 2 tablet, kemudian 1 tablet setelah BAB cair',
          duration: 'Maksimal 2 hari',
          sideEffects: ['Mulut kering', 'Mengantuk', 'Konstipasi'],
          precautions: [
            'Tidak untuk anak di bawah 12 tahun',
            'Tidak untuk diare berdarah atau berlendir'
          ],
        ),
        MedicationItem(
          id: '2',
          name: 'Zinc',
          dosage:
              'Dewasa 10 mg-20 mg/hari, anak-anak 6 bulan-5 tahun 20 mg/hari',
          frequency: '1 kali sehari',
          duration: 'Selama 10-14 hari',
          sideEffects: ['Mual', 'Rasa tidak enak di mulut'],
          precautions: ['Konsumsi makanan sesudah minum obat'],
        ),
        MedicationItem(
          id: '3',
          name: 'Oralit',
          dosage: '1 sachet dilarutkan dalam 200 ml air',
          frequency: 'Setiap kali BAB cair',
          duration: 'Sampai diare berhenti',
          sideEffects: ['Jarang terjadi'],
          precautions: [
            'Gunakan air bersih untuk melarutkan',
            'Simpan di tempat sejuk'
          ],
        ),
      ],
      additionalAdvice: [
        'Mencukupi larutan/cairan tubuh',
        'Konsumsi air putih minimal 8 gelas/hari',
        'Menghindari makanan seperti makanan berminyak dan pedas',
      ],
      warnings: [
        'Jika lebih dari 3 hari obat diberikan belum menunjukkan perubahan maka sebaiknya mendatangi fasilitas kesehatan untuk terapi lanjutan (antibiotik)',
        'Segera hubungi dokter jika terdapat darah atau lendir pada tinja',
        'Segera hubungi dokter jika terjadi tanda-tanda dehidrasi berat (sangat haus, pusing, sedikit BAK)',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Menunjukkan gejala dehidrasi dan diare akut, maka disarankan untuk mendatangi fasilitas kesehatan (Rumah sakit dan klinik)',
    ),

    // Rekomendasi Demam
    Recommendation(
      id: '2',
      diseaseId: '2', // Demam
      title: 'Rekomendasi untuk Demam',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi demam:',
      medications: [
        MedicationItem(
          id: '4',
          name: 'Parasetamol',
          dosage: '500 mg',
          frequency:
              '1-5 tahun: 1/4-1/2 tablet tiap 4-6 jam; 6-12 tahun: 1/2-1 tablet tiap 4-6 jam; 13 tahun-dewasa: 1-2 tablet tiap 4-6 jam',
          duration: 'Selama masih demam, maksimal 3 hari',
          sideEffects: ['Mual', 'Ruam kulit (jarang)'],
          precautions: [
            'Jangan melebihi dosis yang dianjurkan',
            'Hentikan jika terjadi reaksi alergi'
          ],
        ),
        MedicationItem(
          id: '5',
          name: 'Ibuprofen',
          dosage: '400 mg',
          frequency: 'Dewasa: 2-4 x sehari 1-2 kaplet',
          duration: 'Selama masih demam, maksimal 3 hari',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk anak di bawah 12 tahun'
          ],
        ),
        MedicationItem(
          id: '6',
          name: 'Aspirin (Asetosal)',
          dosage: '300-900 mg',
          frequency: 'Setiap 4-6 jam',
          duration: 'Maksimal 4.000 mg per hari',
          sideEffects: ['Sakit perut', 'Mual', 'Mudah berdarah'],
          precautions: [
            'Tidak untuk anak di bawah 16 tahun',
            'Tidak untuk penderita tukak lambung dan asma'
          ],
        ),
        MedicationItem(
          id: '7',
          name: 'Naproxen Sodium',
          dosage: '750 mg (dosis awal)',
          frequency: 'Dilanjutkan dengan 250 mg tiap 8 jam',
          duration: 'Hingga nyeri mereda',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk penderita tukak lambung dan asma'
          ],
        ),
        MedicationItem(
          id: '8',
          name: 'Ketoprofen',
          dosage: '50 mg',
          frequency: '4 kali sehari; atau 75 mg 3 kali sehari',
          duration: 'Dosis maksimal 300 mg per hari',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk penderita tukak lambung dan asma'
          ],
        ),
      ],
      additionalAdvice: [
        'Jika anak/bayi tidak memberikan pakaian tebal/selimut',
        'Konsumsi air putih yang cukup',
        'Untuk anak kompres badan dengan kain basah',
      ],
      warnings: [
        'Segera hubungi dokter jika demam berlangsung lebih dari 3 hari',
        'Segera hubungi dokter jika disertai ruam, kaku leher, atau kesulitan bernapas',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Gejala menunjukkan demam karena infeksi/penyakit lain disarankan mendatangi fasilitas kesehatan; jika anak dibawah 1 tahun secepatnya untuk mendapatkan tindakan medis',
    ),

    // Rekomendasi Batuk
    Recommendation(
      id: '3',
      diseaseId: '3', // Batuk
      title: 'Rekomendasi untuk Batuk',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi batuk:',
      medications: [
        MedicationItem(
          id: '9',
          name: 'Obat Batuk Berdahak',
          dosage: 'Bervariasi sesuai jenis obat',
          frequency: 'Sesuai anjuran pada kemasan',
          duration: '3-5 hari',
          sideEffects: ['Mual', 'Mengantuk'],
          precautions: [
            'Pilihan: Guaifenesin (Dewasa: 2-4 tablet tiap 4 jam, maks. 24 tablet/hari. Anak 6-12 tahun: 6-12 tablet tiap 4 jam, maks. 12 tablet/hari)',
            'Pilihan: Bromheksin (Dewasa: 8-16 mg, 3x sehari. Anak 6-11 tahun: 4-8 mg, 3x sehari)',
            'Pilihan: Gliseril Guaiakolat (>12 tahun: 100-400 mg setiap 4 jam)'
          ],
        ),
        MedicationItem(
          id: '10',
          name: 'Obat Batuk Kering',
          dosage: 'Bervariasi sesuai jenis obat',
          frequency: 'Sesuai anjuran pada kemasan',
          duration: '3-5 hari',
          sideEffects: ['Mengantuk', 'Mulut kering'],
          precautions: [
            'Pilihan: Dekstrometorfan (Dewasa: 30 mg, 3-4x sehari, maks. 120 mg/hari. Anak 6-12 tahun: 15 mg, 3-4x sehari)',
            'Pilihan: Difenhidramin HCl (Dewasa: 25-50 mg, 3-4x sehari. Anak 6-12 tahun: 12,5-25 mg tiap 4-6 jam)'
          ],
        ),
      ],
      additionalAdvice: [
        'Mengurangi makanan pedas/berminyak',
        'Tidak beraktifitas berlebihan',
        'Mengenakan masker saat bepergian',
        'Selalu rajin mencuci tangan',
        'Humidifier, dan menjaga hidrasi tubuh',
      ],
      warnings: [
        'Segera hubungi dokter jika batuk disertai sesak napas',
        'Segera hubungi dokter jika batuk berdarah',
        'Segera hubungi dokter jika batuk berlangsung lebih dari 2 minggu',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Menunjukkan infeksi batuk yang memerlukan antibiotik atau tegak diagnosa lebih lanjut, diharapkan mendatangi fasilitas kesehatan untuk mendapatkan terapi',
    ),

    // Rekomendasi Pilek/Influenza
    Recommendation(
      id: '4',
      diseaseId: '4', // Pilek/Influenza
      title: 'Rekomendasi untuk Pilek/Influenza',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi pilek/influenza:',
      medications: [
        MedicationItem(
          id: '11',
          name: 'Fenilpropanolamin/Fenilefrin',
          dosage:
              'Fenilpropanolamin: 25 mg per oral per 4 jam; atau 75 mg sediaan lepas lambat per 12 jam\nFenilefrin: 10 mg setiap 4 jam',
          frequency: 'Sesuai dosis',
          duration: 'Maksimal 3-5 hari',
          sideEffects: ['Mulut kering', 'Jantung berdebar', 'Sakit kepala'],
          precautions: [
            'Fenilpropanolamin: Dosis maksimal 150 mg per hari',
            'Fenilefrin: Dosis maksimal 60 mg per hari',
          ],
        ),
        MedicationItem(
          id: '12',
          name: 'Pseudoefedrin',
          dosage: 'Dewasa dan anak >12 tahun: 30-60 mg tiap 4-6 jam',
          frequency: 'Sesuai dosis',
          duration: 'Dosis maksimal 240 mg per hari',
          sideEffects: ['Mulut kering', 'Sulit tidur', 'Palpitasi'],
          precautions: [
            'Anak 6-12 tahun: 30 mg tiap 6 jam, maksimal 120 mg per hari',
            'Anak 2-5 tahun: 15 mg tiap 6 jam, maksimal 60 mg per hari',
          ],
        ),
        MedicationItem(
          id: '13',
          name: 'Antihistamin CTM',
          dosage: 'Anak 6-11 tahun: 2 mg setiap 4-6 jam',
          frequency: 'Sesuai dosis',
          duration: 'Batas maksimal 12 mg per hari',
          sideEffects: ['Mengantuk', 'Mulut kering', 'Penglihatan kabur'],
          precautions: [
            'Usia di atas 12 tahun hingga dewasa: 4 mg setiap 4-6 jam',
            'Tidak dianjurkan untuk pengendara atau pekerja yang membutuhkan kewaspadaan',
          ],
        ),
      ],
      additionalAdvice: [
        'Penuhi asupan cairan, istirahat cukup, konsumsi makanan yang bernutrisi',
        'Jika perlu gunakan humidifier',
        'Menjaga agar tidak menularkan ke orang lain dengan mencuci tangan menggunakan sabun dan air mengalir',
        'Memakai masker ketika bepergian dan tidak berbagi peralatan pribadi di rumah seperti handuk',
      ],
      warnings: [
        'Segera hubungi dokter jika demam tinggi disertai sesak napas',
        'Segera hubungi dokter jika batuk berdarah',
        'Segera hubungi dokter jika gejala memburuk setelah 5 hari',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Merupakan batuk pilek yang memerlukan penanganan medis; jika batuk/dahak batuk sudah lebih dari 3 hari dengan dahak berubah warna hijau disarankan untuk mendatangi fasilitas kesehatan',
    ),

    // Rekomendasi Luka Bakar
    Recommendation(
      id: '5',
      diseaseId: '5', // Luka Bakar
      title: 'Rekomendasi untuk Luka Bakar',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi luka bakar:',
      medications: [
        MedicationItem(
          id: '14',
          name: 'Mafenid Asetat (Sulfamylon)',
          dosage: 'Oleskan tipis pada area luka',
          frequency: '1-2 kali sehari',
          duration: 'Sesuai perkembangan luka',
          sideEffects: ['Rasa terbakar sementara', 'Rasa nyeri'],
          precautions: [
            'Bersihkan luka sebelum aplikasi',
            'Jangan digunakan pada mata atau selaput lendir',
          ],
        ),
        MedicationItem(
          id: '15',
          name: 'Nitrofurazone (Furacin)',
          dosage: 'Oleskan tipis pada area luka',
          frequency: '1-2 kali sehari',
          duration: 'Sesuai perkembangan luka',
          sideEffects: ['Iritasi lokal', 'Reaksi kulit'],
          precautions: [
            'Bersihkan luka sebelum aplikasi',
            'Jangan digunakan pada area yang luas',
          ],
        ),
      ],
      additionalAdvice: [
        'Jangan mengoleskan odol, kecap, mentega pada daerah yang terkena luka bakar',
        'Jangan memecah bula/lepuhan. Memecah bula hanya akan membuat infeksi pada luka bakar',
        'Jika bula terlanjur pecah, bersihkan dan sementara tutup dengan kasa steril',
      ],
      warnings: [
        'Segera hubungi dokter jika luka bakar meliputi area yang luas',
        'Segera hubungi dokter jika luka bakar pada wajah, tangan, kaki, alat kelamin, atau persendian',
        'Segera hubungi dokter jika ada tanda infeksi seperti kemerahan meningkat, bengkak, atau nanah',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Menunjukkan luka bakar sudah menyebabkan infeksi dan disarankan ke fasilitas kesehatan untuk mendapatkan antibiotik',
    ),

    // Rekomendasi Maag
    Recommendation(
      id: '6',
      diseaseId: '6', // Maag
      title: 'Rekomendasi untuk Maag',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi maag:',
      medications: [
        MedicationItem(
          id: '16',
          name: 'Antasida dan Pengatur Asam Lambung',
          dosage: 'Bervariasi sesuai jenis obat',
          frequency: 'Sesuai jenis obat',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Mual', 'Konstipasi', 'Diare (tergantung jenis obat)'],
          precautions: [
            'Antasida: Dewasa dan anak ≥12 tahun: 2-4 tablet, 4x sehari 30 menit sebelum makan',
            'Famotidine: Dewasa: 40 mg, 1x sehari sebelum tidur, selama 4-8 minggu',
            'Ranitidine: Dewasa: 150 mg 2x sehari atau 300 mg 1x sehari sebelum tidur',
            'Omeprazole: Dewasa: 20 mg, 1x sehari selama 4 minggu',
            'Lansoprazole: Dewasa dan anak >12 tahun: 30 mg, 1x sehari selama 8-16 minggu',
          ],
        ),
      ],
      additionalAdvice: [
        'Menghindari sumber yang dapat memicu maag seperti makanan berminyak, pedas',
        'Sebaiknya tetap makan di jam yang sama setiap hari',
        'Hindari makan terlalu terburu-buru',
      ],
      warnings: [
        'Segera hubungi dokter jika mengalami muntah darah',
        'Segera hubungi dokter jika nyeri dada berat',
        'Segera hubungi dokter jika BAB berwarna hitam',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Menunjukkan penyakit pencernaan lain dan direkomendasikan untuk menghubungi fasilitas kesehatan',
    ),

    // Rekomendasi Biang Keringat
    Recommendation(
      id: '7',
      diseaseId: '7', // Biang Keringat
      title: 'Rekomendasi untuk Biang Keringat',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi biang keringat:',
      medications: [
        MedicationItem(
          id: '17',
          name: 'Bedak/Lotion Calamine',
          dosage: 'Secukupnya',
          frequency: '1-4 kali sehari',
          duration: 'Sampai gejala membaik',
          sideEffects: ['Iritasi lokal (jarang)'],
          precautions: [
            'Oleskan pada kulit yang bersih dan kering',
            'Hindari kontak dengan mata',
          ],
        ),
        MedicationItem(
          id: '18',
          name: 'Produk Topikal Lainnya',
          dosage: 'Secukupnya',
          frequency: 'Sesuai petunjuk pada kemasan',
          duration: 'Sampai gejala membaik',
          sideEffects: ['Iritasi lokal (jarang)'],
          precautions: [
            'Lotion Menthol: Oleskan 3-4 kali sehari',
            'Salicyl Talk: Taburkan pada kulit yang gatal sesuai kebutuhan',
            'Bedak Minos: Taburkan pada kulit bersih dan kering beberapa kali sehari',
            'Caladin Krim/Bedak: Oleskan/taburkan setelah mandi',
          ],
        ),
      ],
      additionalAdvice: [
        'Oleskan pada pagi dan sore hari setelah mandi',
        'Selalu rutin mengganti handuk setiap 3-4 hari sekali',
        'Menghindari menggaruk berlebihan',
        'Menggunakan pakaian yang longgar berwarna cerah dan tipis untuk melancarkan sirkulasi udara',
        'Pada anak-anak sering mengganti popok dan menggunakan sabun antiseptik ringan',
      ],
      warnings: [
        'Segera hubungi dokter jika timbul ruam yang meluas',
        'Segera hubungi dokter jika disertai demam',
        'Segera hubungi dokter jika gatal sangat hebat dan tidak membaik dengan pengobatan',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Menunjukkan infeksi lain selain biang keringat direkomendasikan mendatangi fasilitas kesehatan untuk mendapatkan pengobatan lebih lanjut',
    ),

    // Rekomendasi Jerawat
    Recommendation(
      id: '8',
      diseaseId: '8', // Jerawat
      title: 'Rekomendasi untuk Jerawat',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi jerawat:',
      medications: [
        MedicationItem(
          id: '19',
          name: 'Benzoyl Peroxide',
          dosage: 'Sesuai kemasan',
          frequency: '1-2 kali sehari',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Kulit kering', 'Kulit mengelupas', 'Kemerahan'],
          precautions: [
            'Krim dan losion: Oleskan 1-2 kali sehari pada seluruh area',
            'Sabun cuci muka: Gunakan 1-2 kali sehari',
            'Gel: Umumnya untuk perawatan spot dengan konsentrasi lebih tinggi',
          ],
        ),
        MedicationItem(
          id: '20',
          name: 'Sulfur',
          dosage: 'Sesuai kemasan',
          frequency: 'Sesuai petunjuk',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Kulit kering', 'Iritasi'],
          precautions: [
            'Oleskan krim atau salep secara merata pada area kulit yang bermasalah',
            'Pastikan kulit dalam kondisi bersih sebelum penggunaan',
          ],
        ),
      ],
      additionalAdvice: [
        'Membersihkan wajah secara teratur dengan menggunakan antiseptic cleanser',
        'Menghindari sinar ultraviolet sehingga disarankan untuk menggunakan sunscreen yang mengandung SPF dengan basis alcohol dan oil free',
        'Menghindari penggunaan kosmetik yang dapat menimbulkan iritasi/jerawat',
      ],
      warnings: [
        'Jangan memencet jerawat karena dapat menyebabkan infeksi dan bekas',
        'Segera hubungi dokter jika terjadi reaksi alergi terhadap produk',
        'Jika tidak ada perbaikan setelah 8 minggu, konsultasikan ke dokter',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Jerawat memerlukan tindakan medis dan diagnosa lebih lanjut sehingga disarankan menghubungi dokter terdekat',
    ),

    // Rekomendasi Mual dan Muntah
    Recommendation(
      id: '9',
      diseaseId: '9', // Mual dan Muntah
      title: 'Rekomendasi untuk Mual dan Muntah',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi mual dan muntah:',
      medications: [
        MedicationItem(
          id: '21',
          name: 'Meclizine',
          dosage: 'Dewasa: 25-50 mg',
          frequency:
              '1 jam sebelum perjalanan, dapat diulang setiap 24 jam jika diperlukan',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Mengantuk', 'Mulut kering', 'Penglihatan kabur'],
          precautions: [
            'Untuk mabuk perjalanan: 25-50 mg 1 jam sebelum perjalanan',
            'Untuk vertigo: 25-100 mg per hari dalam dosis terbagi',
          ],
        ),
        MedicationItem(
          id: '22',
          name: 'Cyclizine',
          dosage: '50 mg',
          frequency:
              '30 menit sebelum keberangkatan, dapat diulang setiap 4-6 jam',
          duration: 'Tidak melebihi 200 mg/24 jam',
          sideEffects: ['Mengantuk', 'Mulut kering'],
          precautions: [
            'Tidak dianjurkan untuk pengendara',
            'Tidak untuk anak di bawah 6 tahun',
          ],
        ),
        MedicationItem(
          id: '23',
          name: 'Dimenhydrinate',
          dosage: 'Bervariasi sesuai usia',
          frequency: 'Sesuai dosis',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Mengantuk', 'Mulut kering', 'Penglihatan kabur'],
          precautions: [
            'Dewasa: 50-100 mg setiap 4-6 jam, maks. 400 mg/hari',
            'Anak 6-12 tahun: 25-50 mg setiap 6-8 jam, maks. 150 mg/hari',
            'Anak 2-5 tahun: 12,5-25 mg setiap 6-8 jam, maks. 75 mg/hari',
          ],
        ),
        MedicationItem(
          id: '24',
          name: 'Diphenhydramine',
          dosage: 'Bervariasi sesuai usia',
          frequency: 'Sesuai dosis',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Mengantuk', 'Mulut kering', 'Penglihatan kabur'],
          precautions: [
            'Dewasa: 25-50 mg, 3-4 kali sehari, maks. 300 mg/hari',
            'Anak 6-12 tahun: 12,5-25 mg tiap 4-6 jam',
            'Anak 2-5 tahun: 6,25 mg tiap 4-6 jam',
          ],
        ),
        MedicationItem(
          id: '25',
          name: 'Doxylamine',
          dosage: 'Bervariasi sesuai usia',
          frequency: 'Sesuai dosis',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Mengantuk', 'Mulut kering', 'Penglihatan kabur'],
          precautions: [
            'Dewasa: 7,5-12,5 mg setiap 4-6 jam, maks. 75 mg/hari',
            'Anak 6-11 tahun: 3,75-6,25 mg setiap 4-6 jam, maks. 37,5 mg/hari',
          ],
        ),
      ],
      additionalAdvice: [
        'Hindari aroma yang menyengat seperti asap rokok, bau makanan',
        'Hindari makan berlebihan dan minum beralkohol saat bepergian',
        'Konsumsi makanan dalam porsi kecil tapi sering',
        'Minum cairan yang cukup untuk mencegah dehidrasi',
      ],
      warnings: [
        'Segera hubungi dokter jika muntah darah',
        'Segera hubungi dokter jika muntah seperti ampas kopi',
        'Segera hubungi dokter jika mual muntah disertai dengan nyeri kepala hebat',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Mual muntah yang dirasakan diduga disebabkan karena cidera yang terjadi disarankan untuk melakukan pemeriksaan lebih lanjut',
    ),

    // Rekomendasi Kandidiasis Vulvovaginal
    Recommendation(
      id: '10',
      diseaseId: '10', // Kandidiasis Vulvovaginal
      title: 'Rekomendasi untuk Kandidiasis Vulvovaginal',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi kandidiasis vulvovaginal:',
      medications: [
        MedicationItem(
          id: '26',
          name: 'Antijamur Topikal',
          dosage: 'Sesuai petunjuk pada kemasan',
          frequency: 'Sesuai petunjuk',
          duration: '1-7 hari tergantung jenis obat',
          sideEffects: ['Iritasi lokal', 'Sensasi terbakar'],
          precautions: [
            'Tersedia pilihan: Butoconazole, Clotrimazole, Miconazole, atau Tioconazole',
            'Gunakan sesuai petunjuk pada kemasan',
            'Jangan digunakan bersamaan dengan tampon',
          ],
        ),
      ],
      additionalAdvice: [
        'Hindari menggunakan celana ketat/celana pendek yang dapat menyebabkan iritasi',
        'Menjaga kadar gula darah untuk pasien dengan riwayat diabetes',
        'Gunakan pakaian dalam berbahan katun',
        'Hindari douching (membilas vagina)',
      ],
      warnings: [
        'Segera hubungi dokter jika gejala tidak membaik setelah 7 hari pengobatan',
        'Segera hubungi dokter jika terjadi demam, nyeri perut, atau keputihan berbau busuk',
        'Jika ini adalah infeksi berulang (lebih dari 4 kali dalam setahun), konsultasikan dengan dokter',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Ada indikasi penyakit lain harap menghubungi dokter untuk melakukan konsultasi',
    ),

    // Rekomendasi Dysmenorrhoea
    Recommendation(
      id: '11',
      diseaseId: '11', // Dysmenorrhoea
      title: 'Rekomendasi untuk Dysmenorrhoea',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi dysmenorrhoea:',
      medications: [
        MedicationItem(
          id: '4',
          name: 'Parasetamol',
          dosage: '500 mg',
          frequency: '3-4 kali sehari',
          duration: 'Selama nyeri berlangsung',
          sideEffects: ['Mual', 'Ruam kulit (jarang)'],
          precautions: [
            'Jangan melebihi dosis yang dianjurkan',
            'Hentikan jika terjadi reaksi alergi',
          ],
        ),
        MedicationItem(
          id: '5',
          name: 'Ibuprofen',
          dosage: '400 mg',
          frequency: '2-4 kali sehari',
          duration: 'Selama nyeri berlangsung',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk pasien dengan tukak lambung',
          ],
        ),
      ],
      additionalAdvice: [
        'Mengompres perut bagian bawah adalah terapi non farmakologi yang paling umum',
        'Olahraga dan gaya hidup sehat (tidak merokok) dapat membantu mengurangi gejala dismenore',
        'Konsumsi makanan yang mengandung magnesium seperti kacang-kacangan dan sayuran hijau',
        'Hindari konsumsi kafein berlebihan yang dapat memperburuk kram',
      ],
      warnings: [
        'Segera hubungi dokter jika nyeri sangat hebat dan tidak merespon terhadap obat',
        'Segera hubungi dokter jika dismenore disertai dengan perdarahan berat',
        'Jika dismenore terjadi secara tiba-tiba pada usia lebih tua, konsultasikan dengan dokter',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Ada indikasi penyakit lain harap menghubungi dokter untuk melakukan konsultasi',
    ),

    // Rekomendasi Mata Kering
    Recommendation(
      id: '12',
      diseaseId: '12', // Mata Kering
      title: 'Rekomendasi untuk Mata Kering',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi mata kering:',
      medications: [
        MedicationItem(
          id: '27',
          name: 'Larutan Artificial Tears',
          dosage: '1-2 tetes',
          frequency: 'Sesuai kebutuhan, biasanya 4-6 kali sehari',
          duration: 'Sesuai kebutuhan',
          sideEffects: ['Penglihatan kabur sementara setelah tetes'],
          precautions: [
            'Gunakan sesuai petunjuk pada kemasan',
            'Jangan menyentuh ujung botol tetes ke mata',
            'Jika menggunakan lensa kontak, tunggu 15 menit setelah menggunakan tetes mata',
          ],
        ),
      ],
      additionalAdvice: [
        'Hindari area yang meningkatkan evaporasi cairan film, seperti tempat yang berdebu',
        'Hindari sering mengucek mata',
        'Gunakan humidifier dalam ruangan',
        'Hindari menatap layar komputer terlalu lama',
        'Penggunaan kacamata di area outdoor dan berangin mungkin dapat membantu',
      ],
      warnings: [
        'Segera hubungi dokter jika ada nyeri mata yang parah',
        'Segera hubungi dokter jika ada perubahan penglihatan yang signifikan',
        'Segera hubungi dokter jika mata sangat merah atau ada keluarnya cairan',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Ada indikasi penyakit lain harap menghubungi dokter untuk melakukan konsultasi; ada indikasi infeksi karena disertai demam menggigil harap menghubungi dokter untuk melakukan konsultasi',
    ),

    // Rekomendasi Sariawan
    Recommendation(
      id: '13',
      diseaseId: '13', // Sariawan
      title: 'Rekomendasi untuk Sariawan',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi sariawan:',
      medications: [
        MedicationItem(
          id: '28',
          name: 'Obat Sariawan',
          dosage: 'Sesuai petunjuk',
          frequency: 'Sesuai petunjuk',
          duration: 'Sampai sariawan sembuh',
          sideEffects: ['Rasa tidak enak di mulut'],
          precautions: [
            'Tersedia beberapa jenis obat: debriding/cleansing agent, anestetik topikal, pelindung oral topikal, obat kumur, analgesik sistemik',
            'Gunakan sesuai petunjuk pada kemasan',
          ],
        ),
      ],
      additionalAdvice: [
        'Jika pasien terindikasi kekurangan nutrisi (zat besi, vitamin B9, B12) rekomendasikan untuk konsumsi makanan yang mengandung nutrisi tersebut',
        'Makanan pedas dan sejenisnya yang dapat memperparah sariawan sebaiknya dihindari',
        'Mengompres es pada lesi selama 10 menit dapat membantu mengurangi rasa sakit',
        'Hindari makanan asam dan keras yang dapat mengiritasi sariawan',
      ],
      warnings: [
        'Segera hubungi dokter jika sariawan tidak sembuh dalam 2 minggu',
        'Segera hubungi dokter jika sariawan sangat besar atau sangat menyakitkan',
        'Segera hubungi dokter jika sariawan disertai demam',
      ],
      needsMedicalAttention: false,
      criticalMessage:
          'Ada indikasi infeksi serius karena sariawan disertai demam, harap menghubungi dokter untuk mendapatkan perawatan segera',
    ),
  ];

  // Get Methods
  List<Disease> getDiseases() => _diseases;
  List<Symptom> getSymptoms() => _symptoms;
  List<Recommendation> getRecommendations() => _recommendations;

  // Find Disease by ID
  Disease? findDiseaseById(String id) {
    try {
      return _diseases.firstWhere((disease) => disease.id == id);
    } catch (e) {
      return null;
    }
  }

  // Find Symptom by ID
  Symptom? findSymptomById(String id) {
    try {
      return _symptoms.firstWhere((symptom) => symptom.id == id);
    } catch (e) {
      return null;
    }
  }

  // Find Recommendation by Disease ID
  Recommendation? findRecommendationByDiseaseId(String diseaseId) {
    try {
      return _recommendations.firstWhere(
          (recommendation) => recommendation.diseaseId == diseaseId);
    } catch (e) {
      return null;
    }
  }

  // Filter Diseases by Name
  List<Disease> filterDiseasesByName(String query) {
    if (query.isEmpty) return _diseases;

    return _diseases
        .where((disease) =>
            disease.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Get Symptoms for a Disease
  List<Symptom> getSymptomsForDisease(Disease disease) {
    return disease.symptoms
        .map((symptomId) => findSymptomById(symptomId))
        .where((symptom) => symptom != null)
        .cast<Symptom>()
        .toList();
  }

  // Check if any critical symptom is selected
  bool hasCriticalSymptoms(List<String> selectedSymptomIds) {
    for (String id in selectedSymptomIds) {
      Symptom? symptom = findSymptomById(id);
      if (symptom != null && symptom.isCritical) {
        return true;
      }
    }
    return false;
  }

  // Determine if we should show critical message instead of normal recommendations
  // Based on the logic from project-logic.js
  bool shouldShowCriticalMessage(
      String diseaseId, List<String> selectedSymptomIds) {
    Disease? disease = findDiseaseById(diseaseId);
    if (disease == null) return false;

    // Check if all symptoms are selected
    bool allSymptomsSelected =
        disease.symptoms.length == selectedSymptomIds.length;

    // Check if any critical symptom is selected
    bool anyCriticalSelected = hasCriticalSymptoms(selectedSymptomIds);

    // If all symptoms are selected OR any critical symptom is selected, show critical message
    return allSymptomsSelected || anyCriticalSelected;
  }

  // Initialize service
  Future<DataService> init() async {
    // Any initialization logic can go here
    return this;
  }
}
