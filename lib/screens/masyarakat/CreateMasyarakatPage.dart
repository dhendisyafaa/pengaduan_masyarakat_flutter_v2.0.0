import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/masyarakatController.dart';

class CreateMasyarakatPage extends StatelessWidget {
  final MasyarakatController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Masyarakat Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIK'),
              TextField(
                controller: controller.setNik,
                decoration: InputDecoration(
                  hintText: 'Masukkan NIK',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Nama'),
              TextField(
                controller: controller.setFullName,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Username'),
              TextField(
                controller: controller.setUsername,
                decoration: InputDecoration(
                  hintText: 'Masukkan Username',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Kata Sandi'),
              TextField(
                controller: controller.setPassword,
                decoration: InputDecoration(
                  hintText: 'Kata Sandi',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Telepon'),
              TextField(
                controller: controller.setTelp,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nomor Telepon',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final data = {
                    "nik": controller.setNik.text,
                    "nama": controller.setFullName.text,
                    "username": controller.setUsername.text,
                    "password": controller.setPassword.text,
                    "telp": controller.setTelp.text
                  };
                  controller.createMasyarakat(data);
                  Get.back();
                },
                child: Text('Buat Masyarakat Baru'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
