import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/masyarakatController.dart';
import 'package:pengaduan_masyarakat_flutter/models/masyarakatModel.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/CreateMasyarakatPage.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/EditMasyarakatPage.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/MasyarakatScrolled.dart';

class MasyarakatPage extends StatelessWidget {
  final MasyarakatController controller = Get.put(MasyarakatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Masyarakat'),
      ),
      body: Obx(
        () => controller.isloading.value
            ? Center(child: CircularProgressIndicator())
            : MasyarakatScrolled(
                stories: controller.listMasyarakat.value,
                onStoryClicked: (masyarakat) =>
                    _showBottomSheet(context, masyarakat),
              ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.getDataMasyarakat(),
      //   child: Icon(Icons.refresh),
      // ),
    );
  }

  void _showBottomSheet(BuildContext context, masyarakatModel? masyarakat) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (masyarakat != null) ...[
                ListTile(
                  title: Text(masyarakat.nama ?? ''),
                  subtitle: Text('NIK: ${masyarakat.nik ?? ''}'),
                ),
                Divider(),
                ListTile(
                  title: Text('Hapus Data'),
                  leading: Icon(Icons.delete),
                  onTap: () {
                    _deleteMasyarakat(masyarakat.uuid ?? '');
                    Navigator.pop(
                        context); // Menutup bottom sheet setelah menghapus
                  },
                ),
                ListTile(
                  title: Text('Edit Data'),
                  leading: Icon(Icons.edit),
                  onTap: () {
                    _editMasyarakat(masyarakat);
                    Navigator.pop(
                        context); // Menutup bottom sheet setelah mengedit
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void _deleteMasyarakat(String uuid) {
    Get.back();
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Apakah Anda yakin ingin menghapus data masyarakat?',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implementasi penghapusan data masyarakat
                    // Panggil fungsi atau API yang sesuai
                    // ...
                    Get.back(); // Tutup bottom sheet setelah penghapusan berhasil
                  },
                  child: Text('Ya'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Tutup bottom sheet jika dibatalkan
                  },
                  child: Text('Tidak'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _editMasyarakat(masyarakatModel masyarakat) {
    // Implementasi untuk mengedit data masyarakat
    // Navigasi ke halaman edit dengan membawa data masyarakat
    Get.to(EditMasyarakatPage(masyarakat: masyarakat));
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FutureBuilder<void>(
      // FutureBuilder untuk membangun menu yang muncul saat tombol mengambang ditekan
      future: Future.value(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Tambah Masyarakat'),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: ListTile(
                leading: Icon(Icons.report),
                title: Text('Tambah Pengaduan'),
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 1) {
              // Tambahkan logika untuk menambahkan data masyarakat
              Get.to(() => CreateMasyarakatPage());
            } else if (value == 2) {
              // Tambahkan logika untuk menambahkan data pengaduan
              // Get.to(() => TambahPengaduanPage());
            }
          },
          child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
