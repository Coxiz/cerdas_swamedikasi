import 'package:cerdas_swamedikasi/app/data/models/disease-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/recommendation-model.dart';
import 'package:cerdas_swamedikasi/app/data/models/symptom-model.dart';
import 'package:get/get.dart';

class DataService extends GetxService {
  // Mock data for diseases
  final List<Disease> _diseases = [
    Disease(
      id: '1',
      name: 'Demam',
      description:
          'Demam adalah kondisi kenaikan suhu tubuh di atas normal (> 37.5°C)',
      symptoms: ['1', '2', '3', '4'],
      medications: ['1', '2'],
    ),
    Disease(
      id: '2',
      name: 'Flu',
      description:
          'Flu atau influenza adalah penyakit yang disebabkan oleh virus yang menyerang sistem pernapasan',
      symptoms: ['1', '5', '6', '7', '8'],
      medications: ['2', '3', '4'],
    ),
    Disease(
      id: '3',
      name: 'Batuk',
      description:
          'Batuk adalah refleks tubuh untuk mengeluarkan sesuatu yang mengiritasi tenggorokan atau saluran napas',
      symptoms: ['7', '9', '10', '11'],
      medications: ['5', '6'],
    ),
    Disease(
      id: '4',
      name: 'Sakit Kepala',
      description:
          'Sakit kepala adalah rasa nyeri yang dirasakan di bagian kepala, biasanya terjadi di kedua sisi, depan, belakang kepala, atau di seluruh kepala',
      symptoms: ['12', '13', '14', '15'],
      medications: ['1', '7'],
    ),
    Disease(
      id: '5',
      name: 'Diare',
      description:
          'Diare adalah kondisi saat buang air besar menjadi lebih cair dan lebih sering dari biasanya',
      symptoms: ['16', '17', '18', '19'],
      medications: ['8', '9', '10'],
    ),
  ];

  // Mock data for symptoms
  final List<Symptom> _symptoms = [
    Symptom(
      id: '1',
      name: 'Demam (suhu tubuh > 37.5°C)',
      description: 'Kenaikan suhu tubuh di atas normal',
      severity: 2,
    ),
    Symptom(
      id: '2',
      name: 'Menggigil',
      description: 'Merasa dingin dan gemetar',
      severity: 2,
    ),
    Symptom(
      id: '3',
      name: 'Berkeringat',
      description: 'Mengeluarkan keringat lebih dari biasanya',
      severity: 1,
    ),
    Symptom(
      id: '4',
      name: 'Sakit kepala',
      description: 'Rasa nyeri di bagian kepala',
      severity: 2,
    ),
    Symptom(
      id: '5',
      name: 'Hidung tersumbat',
      description: 'Kesulitan bernapas melalui hidung karena tersumbat',
      severity: 1,
    ),
    Symptom(
      id: '6',
      name: 'Nyeri otot dan sendi',
      description: 'Rasa nyeri pada otot dan persendian',
      severity: 2,
    ),
    Symptom(
      id: '7',
      name: 'Sakit tenggorokan',
      description: 'Rasa nyeri dan gatal di tenggorokan',
      severity: 2,
    ),
    Symptom(
      id: '8',
      name: 'Kelelahan',
      description: 'Rasa lelah yang berlebihan',
      severity: 1,
    ),
    Symptom(
      id: '9',
      name: 'Batuk kering',
      description: 'Batuk tanpa lendir',
      severity: 1,
    ),
    Symptom(
      id: '10',
      name: 'Batuk berdahak',
      description: 'Batuk dengan keluarnya lendir',
      severity: 2,
    ),
    Symptom(
      id: '11',
      name: 'Sesak napas',
      description: 'Kesulitan bernapas atau napas pendek',
      severity: 3,
    ),
    Symptom(
      id: '12',
      name: 'Sakit kepala berdenyut',
      description: 'Rasa nyeri berdenyut di kepala',
      severity: 2,
    ),
    Symptom(
      id: '13',
      name: 'Pusing',
      description: 'Merasa kepala berputar atau tidak stabil',
      severity: 2,
    ),
    Symptom(
      id: '14',
      name: 'Sensitif terhadap cahaya',
      description: 'Merasa tidak nyaman dengan cahaya terang',
      severity: 2,
    ),
    Symptom(
      id: '15',
      name: 'Mual',
      description: 'Perasaan ingin muntah',
      severity: 2,
    ),
    Symptom(
      id: '16',
      name: 'Diare',
      description: 'BAB cair dan sering',
      severity: 2,
    ),
    Symptom(
      id: '17',
      name: 'Sakit perut',
      description: 'Rasa nyeri pada bagian perut',
      severity: 2,
    ),
    Symptom(
      id: '18',
      name: 'Kram perut',
      description: 'Rasa kram atau kejang pada bagian perut',
      severity: 2,
    ),
    Symptom(
      id: '19',
      name: 'Dehidrasi',
      description: 'Kekurangan cairan tubuh',
      severity: 3,
    ),
  ];

  // Mock data for recommendations
  final List<Recommendation> _recommendations = [
    Recommendation(
      id: '1',
      diseaseId: '1', // Demam
      title: 'Rekomendasi untuk Demam',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi demam:',
      medications: [
        MedicationItem(
          id: '1',
          name: 'Paracetamol',
          dosage: '500 mg',
          frequency: '3-4 kali sehari',
          duration: 'Selama masih demam, maksimal 3 hari',
          sideEffects: ['Mual', 'Ruam kulit (jarang)'],
          precautions: [
            'Jangan melebihi dosis yang dianjurkan',
            'Hentikan jika terjadi reaksi alergi'
          ],
        ),
        MedicationItem(
          id: '2',
          name: 'Ibuprofen',
          dosage: '400 mg',
          frequency: '3 kali sehari setelah makan',
          duration: 'Selama masih demam, maksimal 3 hari',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk anak di bawah 12 tahun'
          ],
        ),
      ],
      additionalAdvice: [
        'Istirahat yang cukup',
        'Minum banyak cairan',
        'Kompres dingin pada dahi, ketiak, dan lipatan paha',
        'Gunakan pakaian yang tipis dan menyerap keringat',
      ],
      warnings: [
        'Segera hubungi dokter jika demam di atas 39°C',
        'Segera hubungi dokter jika demam disertai ruam, kaku leher, atau kesulitan bernapas',
        'Segera hubungi dokter jika demam berlangsung lebih dari 3 hari',
      ],
      needsMedicalAttention: false,
    ),
    Recommendation(
      id: '2',
      diseaseId: '2', // Flu
      title: 'Rekomendasi untuk Flu',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi flu:',
      medications: [
        MedicationItem(
          id: '2',
          name: 'Ibuprofen',
          dosage: '400 mg',
          frequency: '3 kali sehari setelah makan',
          duration: '3-5 hari',
          sideEffects: ['Sakit perut', 'Mual', 'Sakit kepala'],
          precautions: [
            'Jangan diminum dengan perut kosong',
            'Tidak untuk anak di bawah 12 tahun'
          ],
        ),
        MedicationItem(
          id: '3',
          name: 'Pseudoefedrin',
          dosage: '60 mg',
          frequency: '3-4 kali sehari',
          duration: '3-5 hari',
          sideEffects: ['Mulut kering', 'Susah tidur', 'Palpitasi'],
          precautions: [
            'Tidak untuk penderita hipertensi dan penyakit jantung',
            'Tidak untuk ibu hamil dan menyusui'
          ],
        ),
        MedicationItem(
          id: '4',
          name: 'Vitamin C',
          dosage: '500 mg',
          frequency: '1-2 kali sehari',
          duration: '5-7 hari',
          sideEffects: [
            'Mual (jika diminum dengan perut kosong)',
            'Diare (dosis tinggi)'
          ],
          precautions: ['Minum setelah makan', 'Hentikan jika terjadi diare'],
        ),
      ],
      additionalAdvice: [
        'Istirahat yang cukup',
        'Minum banyak cairan hangat',
        'Hindari merokok dan asap rokok',
        'Cuci tangan secara teratur',
        'Gunakan masker jika keluar rumah untuk mencegah penularan',
      ],
      warnings: [
        'Segera hubungi dokter jika gejala memburuk setelah 5 hari',
        'Segera hubungi dokter jika demam tinggi disertai sesak napas',
        'Segera hubungi dokter jika batuk berdarah',
      ],
      needsMedicalAttention: false,
    ),
    Recommendation(
      id: '3',
      diseaseId: '3', // Batuk
      title: 'Rekomendasi untuk Batuk',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi batuk:',
      medications: [
        MedicationItem(
          id: '5',
          name: 'Sirup Ekspektoran',
          dosage: '10 ml',
          frequency: '3 kali sehari setelah makan',
          duration: '3-5 hari',
          sideEffects: ['Mual', 'Mengantuk'],
          precautions: [
            'Tidak untuk anak di bawah 2 tahun',
            'Hentikan jika terjadi ruam kulit'
          ],
        ),
        MedicationItem(
          id: '6',
          name: 'Obat Batuk Antitusif',
          dosage: '10 ml',
          frequency: '3 kali sehari',
          duration: '3-5 hari',
          sideEffects: ['Mengantuk', 'Mulut kering'],
          precautions: [
            'Tidak untuk batuk berdahak',
            'Jangan dikonsumsi bersamaan dengan obat penenang'
          ],
        ),
      ],
      additionalAdvice: [
        'Minum banyak air hangat',
        'Hindari merokok dan asap rokok',
        'Istirahatlah yang cukup',
        'Gunakan pelembab udara jika udara terlalu kering',
        'Konsumsi madu (tidak untuk anak di bawah 1 tahun) untuk meredakan iritasi tenggorokan',
      ],
      warnings: [
        'Segera hubungi dokter jika batuk disertai sesak napas',
        'Segera hubungi dokter jika batuk berdarah',
        'Segera hubungi dokter jika batuk berlangsung lebih dari 2 minggu',
      ],
      needsMedicalAttention: false,
    ),
    Recommendation(
      id: '4',
      diseaseId: '4', // Sakit Kepala
      title: 'Rekomendasi untuk Sakit Kepala',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi sakit kepala:',
      medications: [
        MedicationItem(
          id: '1',
          name: 'Paracetamol',
          dosage: '500 mg',
          frequency: '3-4 kali sehari',
          duration: 'Maksimal 3 hari',
          sideEffects: ['Mual', 'Ruam kulit (jarang)'],
          precautions: [
            'Jangan melebihi dosis yang dianjurkan',
            'Hentikan jika terjadi reaksi alergi'
          ],
        ),
        MedicationItem(
          id: '7',
          name: 'Aspirin',
          dosage: '500 mg',
          frequency: '1-2 kali sehari',
          duration: 'Maksimal 3 hari',
          sideEffects: ['Sakit perut', 'Mual', 'Mudah berdarah'],
          precautions: [
            'Tidak untuk anak di bawah 16 tahun',
            'Tidak untuk penderita tukak lambung dan asma'
          ],
        ),
      ],
      additionalAdvice: [
        'Istirahat di ruangan yang tenang dan redup',
        'Kompres dingin atau hangat pada dahi',
        'Pijat lembut pada pelipis',
        'Hindari pemicu sakit kepala (stres, kurang tidur, alkohol)',
        'Kurangi waktu di depan layar elektronik',
      ],
      warnings: [
        'Segera hubungi dokter jika sakit kepala sangat hebat dan tiba-tiba',
        'Segera hubungi dokter jika sakit kepala disertai mual, muntah, atau gangguan penglihatan',
        'Segera hubungi dokter jika sakit kepala muncul setelah cedera kepala',
      ],
      needsMedicalAttention: false,
    ),
    Recommendation(
      id: '5',
      diseaseId: '5', // Diare
      title: 'Rekomendasi untuk Diare',
      description:
          'Berikut adalah langkah-langkah pengobatan untuk mengatasi diare:',
      medications: [
        MedicationItem(
          id: '8',
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
        MedicationItem(
          id: '9',
          name: 'Loperamid',
          dosage: '2 mg',
          frequency:
              'Awalnya 2 tablet, kemudian 1 tablet setiap selesai BAB cair',
          duration: 'Maksimal 2 hari',
          sideEffects: ['Mulut kering', 'Mengantuk', 'Konstipasi'],
          precautions: [
            'Tidak untuk anak di bawah 12 tahun',
            'Tidak untuk diare berdarah atau berlendir'
          ],
        ),
        MedicationItem(
          id: '10',
          name: 'Probiotik',
          dosage: '1 kapsul',
          frequency: '2 kali sehari',
          duration: '5-7 hari',
          sideEffects: ['Kembung (jarang)'],
          precautions: ['Simpan sesuai petunjuk pada kemasan'],
        ),
      ],
      additionalAdvice: [
        'Minum banyak cairan untuk mencegah dehidrasi',
        'Hindari makanan berlemak, pedas, dan mengandung laktosa',
        'Konsumsi makanan lunak seperti bubur, pisang, dan roti',
        'Jaga kebersihan, cuci tangan dengan sabun',
        'Istirahat yang cukup',
      ],
      warnings: [
        'Segera hubungi dokter jika diare disertai demam tinggi',
        'Segera hubungi dokter jika terdapat darah atau lendir pada tinja',
        'Segera hubungi dokter jika diare berlangsung lebih dari 2 hari',
        'Segera hubungi dokter jika terjadi tanda-tanda dehidrasi berat (sangat haus, pusing, sedikit BAK)',
      ],
      needsMedicalAttention: false,
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

  // Initialize service
  Future<DataService> init() async {
    // Any initialization logic can go here
    return this;
  }
}
