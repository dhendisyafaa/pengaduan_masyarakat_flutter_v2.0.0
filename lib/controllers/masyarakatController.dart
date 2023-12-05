import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pengaduan_masyarakat_flutter/models/masyarakatModel.dart';

class MasyarakatController extends GetxController {
  RxBool isloading = false.obs;
  // var baseUrl = "http://192.168.137.1:5000";
  var baseUrl = "http://192.168.0.8:5000";
  Rx<List<masyarakatModel>> listMasyarakat = Rx<List<masyarakatModel>>([]);

  TextEditingController setFullName = TextEditingController();
  TextEditingController setNik = TextEditingController();
  TextEditingController setUsername = TextEditingController();
  TextEditingController setPassword = TextEditingController();
  TextEditingController setTelp = TextEditingController();

  @override
  void onInit() {
    getDataMasyarakat();
    super.onInit();
  }

  Future<void> getDataMasyarakat() async {
    listMasyarakat.value.clear();
    try {
      isloading.value = true;
      var response = await http.get(Uri.parse('$baseUrl' + '/masyarakat'));

      if (response.statusCode == 200) {
        isloading.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listMasyarakat.value.add(masyarakatModel.fromJson(i));
        }
        isloading.value = false;
      } else {
        isloading.value = false;
        print("Terdapat Kesalahan");
      }
    } catch (e) {
      isloading.value = false;
    }
  }

  Future<void> createMasyarakat(Map<String, dynamic> data) async {
    try {
      isloading.value = true;
      final response = await http.post(
        Uri.parse('$baseUrl' + '/masyarakat'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        isloading.value = true;
        getDataMasyarakat();
        isloading.value = false;
        Get.back();
      }
      isloading.value = true;
      refresh();
    } catch (e) {
      isloading.value = false;
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> updateMasyarakat(String uuid, Map<String, dynamic> data) async {
    try {
      isloading.value = true;
      final response = await http.patch(
        Uri.parse('$baseUrl' + '/masyarakat/$uuid'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        isloading.value = true;
        await getDataMasyarakat();
        isloading.value = false;
        Get.back();
      }
      isloading.value = false;
      refresh();
    } catch (e) {
      isloading.value = false;
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> deleteMasyarakat(String uuid) async {
    try {
      isloading.value = true;
      var response =
          await http.delete(Uri.parse('$baseUrl' + '/masyarakat/$uuid'));

      if (response.statusCode == 200) {
        isloading.value = true;
        await getDataMasyarakat();
        isloading.value = false;
        Get.back();
      }
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      print('Terjadi kesalahan: $e');
    }
  }
}
