import 'package:get/get.dart';

import '../providers/slidershow_provider.dart';

class SliderShowController extends GetxController {

  var listBanner = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataError = false.obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    getBanner();
    super.onInit();
  }

  void getBanner() {
    try {
      isDataProcessing(true);
      SlidershowProvider().getBanners().then((res) {
        listBanner.clear();
        isDataProcessing(false);
        listBanner.addAll(res);
        isDataError(false);
      },
      onError: (err) {
        isDataProcessing(false);
        isDataError(true);
      }
      );

    } catch(e) {
      isDataProcessing(false);
      isDataError(true);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}