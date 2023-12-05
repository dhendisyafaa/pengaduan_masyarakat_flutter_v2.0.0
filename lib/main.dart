import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/masyarakatController.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/CreateMasyarakatPage.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/MasyarakatPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  final MasyarakatController controller = Get.put(MasyarakatController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pengaduan Masyarakat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Text("data"),
      home: MasyarakatPage(),
    );
  }
}
