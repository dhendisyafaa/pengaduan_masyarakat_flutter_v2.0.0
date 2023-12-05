import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat_flutter/models/masyarakatModel.dart';

class EditMasyarakatPage extends StatelessWidget {
  final masyarakatModel masyarakat;

  EditMasyarakatPage({required this.masyarakat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Masyarakat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Masyarakat Page'),
            Text('Nama: ${masyarakat.nama ?? ''}'),
            Text('NIK: ${masyarakat.nik ?? ''}'),
            // Add input fields or form elements for editing data
            // ...
          ],
        ),
      ),
    );
  }
}
