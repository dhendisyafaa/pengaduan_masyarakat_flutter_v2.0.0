import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/pengaduanController.dart';
import 'package:pengaduan_masyarakat_flutter/models/pengaduanModel.dart';

class DetailPengaduanPage extends StatelessWidget {
  final PengaduanController controller = Get.find();
  final pengaduanModel pengaduan;

  DetailPengaduanPage({required this.pengaduan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pengaduan'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIK: ${pengaduan.nik ?? ""}'),
            SizedBox(height: 8.0),
            Text('Isi Laporan: ${pengaduan.isiLaporan ?? ""}'),
            SizedBox(height: 8.0),
            if (pengaduan.image != null)
              Image.network(
                pengaduan.image!,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Tampilkan bottom sheet dengan tanggapan
                _showResponseBottomSheet(context, pengaduan);
              },
              child: Text('Lihat Tanggapan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResponseBottomSheet(
      BuildContext context, pengaduanModel pengaduan) {
    // Implementasi bottom sheet untuk menampilkan tanggapan
    // ...
  }
}
