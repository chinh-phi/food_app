import 'package:food_app_247/app/modules/register/api/register_api.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var registerProgress = false.obs;

  var message = "";

  Future<String> register({String? username, String? password, String? name}) async {
    message = "";
    try {
      registerProgress(true);
      String loginResp = await RegisterApi.register(username: username, password: password, name: name);
      if (loginResp == 'success') {
        message = "Đăng kí thành công";
        registerProgress(false);
      } else {
        message = loginResp;
        registerProgress(false);
      }
    } catch(e) {
      message = 'abc';
      registerProgress(false);
    }
    return message;
  }
}