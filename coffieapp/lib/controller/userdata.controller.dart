import 'package:get/get.dart';

import 'package:coffieapp/model/userdata.model.dart';

class UserDataController extends GetxController {
  var userData = UserData(date: "loading...", username: "loading...").obs;
  var isLoading = false.obs;

  fetchUserData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    userData.value = UserData(date: "20/12/2022", username: "Joshua Scanlan");
    isLoading.value = false;
    isLoading.value = false;
  }
}
