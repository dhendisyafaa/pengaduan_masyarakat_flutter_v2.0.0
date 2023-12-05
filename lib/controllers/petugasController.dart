// import 'dart:convert';
// import 'dart:developer' as developer;

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pengaduan_masyarakat/models/petugasModel.dart';

// class PetugasController extends GetxController {
//   RxBool isLoadingPetugas = false.obs;
//   var baseUrl = "http://192.168.232.98:5000";
//   Rx<List<petugasModel>> listPetugas = Rx<List<petugasModel>>([]);

//   TextEditingController setFullName = TextEditingController();
//   TextEditingController setNik = TextEditingController();
//   TextEditingController setUsername = TextEditingController();
//   TextEditingController setPassword = TextEditingController();
//   TextEditingController setTelp = TextEditingController();

//   @override
//   void onInit() {
//     getDataPetugas();
//     super.onInit();
//   }

//   Future<void> getDataPetugas() async {
//     listPetugas.value.clear();
//     try {
//       isLoadingPetugas.value = true;
//       var response = await http.get(Uri.parse('$baseUrl' + '/petugas'));

//       if (response.statusCode == 200) {
//         isLoadingPetugas.value = false;
//         final content = jsonDecode(response.body);

//         for (Map<String, dynamic> i in content) {
//           listPetugas.value.add(petugasModel.fromJson(i));
//         }
//         isLoadingPetugas.value = false;
//       } else {
//         isLoadingPetugas.value = false;
//         print("Terdapat Kesalahan");
//       }
//     } catch (e) {
//       isLoadingPetugas.value = false;
//     }
//   }

//   Future<void> createPetugas(Map<String, dynamic> data) async {
//     try {
//       isLoadingPetugas.value = true;
//       final response = await http.post(
//         Uri.parse('$baseUrl' + '/petugas'),
//         body: jsonEncode(data),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 201) {
//         isLoadingPetugas.value = true;
//         getDataPetugas();
//         isLoadingPetugas.value = false;
//         Get.back();
//       }
//       isLoadingPetugas.value = true;
//       refresh();
//     } catch (e) {
//       isLoadingPetugas.value = false;
//       print('Terjadi kesalahan: $e');
//     }
//   }

//   Future<void> updatePetugas(String uuid, Map<String, dynamic> data) async {
//     try {
//       isLoadingPetugas.value = true;
//       final response = await http.patch(
//         Uri.parse('$baseUrl' + '/petugas/$uuid'),
//         body: jsonEncode(data),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 201) {
//         isLoadingPetugas.value = true;
//         await getDataPetugas();
//         isLoadingPetugas.value = false;
//         Get.back();
//       }
//       isLoadingPetugas.value = false;
//       refresh();
//     } catch (e) {
//       isLoadingPetugas.value = false;
//       print('Terjadi kesalahan: $e');
//     }
//   }

//   Future<void> deletePetugas(String uuid) async {
//     try {
//       print(uuid);
//       isLoadingPetugas.value = true;
//       var response =
//           await http.delete(Uri.parse('$baseUrl' + '/petugas/$uuid'));

//       if (response.statusCode == 200) {
//         isLoadingPetugas.value = true;
//         await getDataPetugas();
//         isLoadingPetugas.value = false;
//         Get.back();
//       }
//       isLoadingPetugas.value = false;
//     } catch (e) {
//       isLoadingPetugas.value = false;
//       print('Terjadi kesalahan: $e');
//     }
//   }
// }
