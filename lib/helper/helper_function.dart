import 'package:chatty/model/user.information.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/location.model.dart';
import '../model/trajectory.item.model.dart';

class HelperFunction {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String imgLink = "none";

  static Locations userLocation =
      Locations(address: "", name: "", latitude: 0.0, longitude: 0.0);
  static Locations searchLocationResult =
      Locations(address: "", name: "", latitude: 0.0, longitude: 0.0);
  static Locations departurePoint =
      Locations(address: "", name: "", latitude: 0.0, longitude: 0.0);
  static Locations destinationPoint =
      Locations(address: "", name: "", latitude: 0.0, longitude: 0.0);

  //User informations
  static UserInformation userInformations = UserInformation(
      mailAddress: "",
      name: "",
      imageLink: "",
      password: "",
      uid: "",
      statu: 0,
      mode: -1);
  //route
  static TrajectItemModel route = TrajectItemModel.fromJson({});

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserImageLinkSF(String ImgLink) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(imgLink, ImgLink);
  }

  static Future<bool?> getUserLoggedInStatuts() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.getBool(userLoggedInKey);
  }
}
