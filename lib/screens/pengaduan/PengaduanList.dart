import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/pengaduanController.dart';
import 'package:pengaduan_masyarakat_flutter/screens/pengaduan/DetailPengaduanPage.dart';

class PengaduanList extends StatelessWidget {
  final PengaduanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isloadingPengaduan.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.listPengaduan.value.length,
              itemBuilder: (context, index) {
                final pengaduan = controller.listPengaduan.value[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => DetailPengaduanPage(pengaduan: pengaduan));
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIK: ${pengaduan.nik ?? ""}'),
                          SizedBox(height: 8.0),
                          Text(pengaduan.isiLaporan ?? ""),
                          SizedBox(height: 8.0),
                          if (pengaduan.image != null)
                            Image.network(
                              pengaduan.image!,
                              height: 150.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          SizedBox(height: 8.0),
                          Text('Status: ${pengaduan.status ?? ""}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
