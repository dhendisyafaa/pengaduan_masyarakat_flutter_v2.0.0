// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pengaduan_masyarakat_flutter/models/masyarakatModel.dart';
// import 'package:pengaduan_masyarakat_flutter/models/tanggapanModel.dart';

// class MasyarakatController extends GetxController {
//   RxBool isloading = false.obs;
//   // var baseUrl = "http://192.168.137.1:5000";
//   var baseUrl = "http://192.168.0.8:5000";
//   Rx<List<tanggapanModel>> listMasyarakat = Rx<List<tanggapanModel>>([]);

//   // TextEditingController setFullName = TextEditingController();
//   // TextEditingController setNik = TextEditingController();
//   // TextEditingController setUsername = TextEditingController();
//   // TextEditingController setPassword = TextEditingController();
//   // TextEditingController setTelp = TextEditingController();

//   @override
//   void onInit() {
//     getDataMasyarakat();
//     super.onInit();
//   }

//   Future<void> getDataMasyarakat() async {
//     listMasyarakat.value.clear();
//     try {
//       isloading.value = true;
//       var response = await http.get(Uri.parse('$baseUrl' + '/masyarakat'));

//       if (response.statusCode == 200) {
//         isloading.value = false;
//         final content = jsonDecode(response.body);

//         for (Map<String, dynamic> i in content) {
//           listMasyarakat.value.add(masyarakatModel.fromJson(i));
//         }
//         isloading.value = false;
//       } else {
//         isloading.value = false;
//         print("Terdapat Kesalahan");
//       }
//     } catch (e) {
//       isloading.value = false;
//     }
//   }
// }
