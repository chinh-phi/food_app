import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/providers/home_menu_api.dart';
import 'package:food_app_247/app/modules/home/providers/suggestion_res_provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/home_menu_model.dart';
import '../models/res_branch_model.dart';
import '../providers/home_provider.dart';
import '../views/suggestion/res_branch_card.dart';

class HomeController extends GetxController {
  var latitude = ''.obs;
  var longitude = ''.obs;
  var address = ''.obs;
  late StreamSubscription<Position> streamSubscription;
  var listMenu = <HomeMenuModel>[].obs;
  var isDataProcessing = false.obs;
  var listSuggestion = List<dynamic>.empty(growable: true).obs;
  var listBranch = List<dynamic>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
    isDataProcessing(true);
    await getLocation();
    await getData();
    isDataProcessing(false);
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          latitude.value = 'Latitude : ${position.latitude}';
          longitude.value = 'Longitude : ${position.longitude}';
          getAddressFromLatLang(position);
        });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.thoroughfare},${place.subLocality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
    await HomeProvider.setAddress(position, address.value);
  }

  getData() async {
    try {
      var resSuggestion = await SuggestionResProvider.getSuggestion();
      var resMenu = await HomeMenuApi.getMenuGrid();
      if(resSuggestion.isNotEmpty) {
        listSuggestion.addAll(resSuggestion);
      }
      if(resMenu.isNotEmpty) {
        listMenu.addAll(resMenu);
      }
    } catch (exception) {
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void clickMerchant(id) {
    Get.toNamed('/merchant-detail/:$id');
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  showModalBottomSheet(context, listBranch) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) =>CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Sữa Chua Trân Châu Hạ Long', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              centerTitle: true,
              pinned: true,
              leading: Container(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () { Get.back(); },
                ),
              ],
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: const Color(0xFFe8e8e8),
                    height: 2.0,
                  )
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 5, childAspectRatio: 3.1),
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                var value = ResBranchModel.fromJson(listBranch[index]);
                return ResBranchCard(item: value);
              }, childCount: listBranch.length),
            )
          ],
        ),
        enableDrag: false,
        duration: const Duration(milliseconds: 500)
    );
  }
}