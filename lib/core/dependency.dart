import 'package:get/get.dart';
import 'package:internet_checker/network_ckecker/internet_controller.dart';

class InternetCheckDependencyInjection {
  static void init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
