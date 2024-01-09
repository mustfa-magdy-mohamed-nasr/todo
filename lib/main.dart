import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/util/database_heloer.dart';

import 'views/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.initDataBase();
  runApp(GetMaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
