import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pengaduan_masyarakat_flutter/models/pengaduanModel.dart';

class PengaduanController extends GetxController {
  RxBool isloadingPengaduan = false.obs;
  var baseUrl = "http://192.168.0.8:5000";
  // var baseUrl = "http://192.168.137.1:5000";
  Rx<List<pengaduanModel>> listPengaduan = Rx<List<pengaduanModel>>([]);

  TextEditingController setLaporan = TextEditingController();
  TextEditingController setNik = TextEditingController();
  TextEditingController setImage = TextEditingController();

  @override
  void onInit() {
    getDataPengaduan();
    super.onInit();
  }

  Future<void> getDataPengaduan() async {
    listPengaduan.value.clear();
    try {
      isloadingPengaduan.value = true;
      var response = await http.get(Uri.parse('$baseUrl' + '/pengaduan'));

      if (response.statusCode == 200) {
        isloadingPengaduan.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listPengaduan.value.add(pengaduanModel.fromJson(i));
        }
        isloadingPengaduan.value = false;
      } else {
        isloadingPengaduan.value = false;
      }
    } catch (e) {
      isloadingPengaduan.value = false;
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> updatePengaduan(
      String idPengaduan, Map<String, dynamic> data) async {
    print(idPengaduan);
    try {
      isloadingPengaduan.value = true;
      final response = await http.patch(
        Uri.parse('$baseUrl' + '/pengaduan/$idPengaduan'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        isloadingPengaduan.value = true;
        await getDataPengaduan();
        isloadingPengaduan.value = false;
        Get.back();
      }
      isloadingPengaduan.value = false;
      refresh();
    } catch (e) {
      isloadingPengaduan.value = false;
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> deletePengaduan(String idPengaduan) async {
    try {
      print(idPengaduan);
      isloadingPengaduan.value = true;
      var response =
          await http.delete(Uri.parse('$baseUrl' + '/masyarakat/$idPengaduan'));

      if (response.statusCode == 200) {
        isloadingPengaduan.value = true;
        await getDataPengaduan();
        refresh();
        isloadingPengaduan.value = false;
        Get.back();
      }
      isloadingPengaduan.value = false;
    } catch (e) {
      isloadingPengaduan.value = false;
      print('Terjadi kesalahan: $e');
    }
  }
}
