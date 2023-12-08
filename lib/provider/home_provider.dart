import 'package:audio_kumbh/Utils/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../model/custom_audio_model.dart';

class HomeProvider extends ChangeNotifier {
  AudioModel? audioModel;
  bool isload = false;
  int imgindex = 0;
  ThemeMode currentTheme = ThemeMode.system;



  String lang = "es";



  void setLocal(String val) {
    lang = val;

  }

  Future<void> getAudioData() async {
    isload = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    audioModel = await Apihelper.helper.getApi();
    isload = false;
    notifyListeners();
  }

  void ChangeIndex(int index) {
    imgindex = index;
    notifyListeners();
  }

  List linearGradients = [
    LinearGradient(
      colors: [Color(0xff745EFF), Color(0xffB164FF)],
    ),
    LinearGradient(
      colors: [Color(0xffFFD464), Color(0xffFFB25E)],
    ),
    LinearGradient(
      colors: [Color(0xffFF9068), Color(0xffFF4B1F)],
    ),
    LinearGradient(
      colors: [Color(0xffC84ED0), Color(0xff834D9B)],
    ),
    LinearGradient(
      colors: [Color(0xff4B79A1), Color(0xff283E51)],
    ),
    LinearGradient(
      colors: [Color(0xffB5DC9F), Color(0xff76B852)],
    ),
    LinearGradient(
      colors: [Color(0xff00C6FF), Color(0xff0072FF)],
    ),
    LinearGradient(
      colors: [Color(0xffFFB75E), Color(0xffED8F03)],
    ),
    LinearGradient(
      colors: [Color(0xff75D8EA), Color(0xff4CA1AF)],
    ),
  ];

  ThemeMode mythemeMode = ThemeMode.light;

  get themeMode => mythemeMode;

  toggleTheme(bool isDark) {
    mythemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    print(themeMode);
    notifyListeners();
  }
}
