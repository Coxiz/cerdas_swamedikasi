import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/modules/about/bindings/about-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/about/views/about-view.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_detail/bindings/disease-detail-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_detail/views/disease-detail-view.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_list/bindings/disease-list-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/disease_list/views/disease-list-view.dart';
import 'package:cerdas_swamedikasi/app/modules/guide/bindings/guide-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/guide/views/guide-view.dart';
import 'package:cerdas_swamedikasi/app/modules/home/bindings/home-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/home/views/home-view.dart';
import 'package:cerdas_swamedikasi/app/modules/recommendation/bindings/recommendation-binding.dart';
import 'package:cerdas_swamedikasi/app/modules/recommendation/views/recommendation-view.dart';
import 'package:cerdas_swamedikasi/app/modules/splash/bindings/splash_bindings.dart';
import 'package:cerdas_swamedikasi/app/modules/splash/views/splash_views.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppConstants.SPLASH; // Changed to splash route

  static final routes = [
    GetPage(
      name: AppConstants.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppConstants.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppConstants.DISEASE_LIST,
      page: () => const DiseaseListView(),
      binding: DiseaseListBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppConstants.DISEASE_DETAIL,
      page: () => const DiseaseDetailView(),
      binding: DiseaseDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppConstants.RECOMMENDATION,
      page: () => const RecommendationView(),
      binding: RecommendationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppConstants.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppConstants.GUIDE,
      page: () => const GuideView(),
      binding: GuideBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
