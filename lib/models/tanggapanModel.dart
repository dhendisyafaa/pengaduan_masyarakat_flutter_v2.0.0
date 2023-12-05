class tanggapanModel {
  int? idPengaduan;
  String? tglPengaduan;
  String? nik;
  String? isiLaporan;
  String? image;
  String? url;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Tanggapans>? tanggapans;

  tanggapanModel(
      {this.idPengaduan,
      this.tglPengaduan,
      this.nik,
      this.isiLaporan,
      this.image,
      this.url,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.tanggapans});

  tanggapanModel.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    nik = json['nik'];
    isiLaporan = json['isi_laporan'];
    image = json['image'];
    url = json['url'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['tanggapans'] != null) {
      tanggapans = <Tanggapans>[];
      json['tanggapans'].forEach((v) {
        tanggapans!.add(new Tanggapans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_pengaduan'] = this.tglPengaduan;
    data['nik'] = this.nik;
    data['isi_laporan'] = this.isiLaporan;
    data['image'] = this.image;
    data['url'] = this.url;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.tanggapans != null) {
      data['tanggapans'] = this.tanggapans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tanggapans {
  int? idTanggapan;
  String? idPetugas;
  int? idPengaduan;
  String? tglTanggapan;
  String? tanggapan;
  String? createdAt;
  String? updatedAt;

  Tanggapans(
      {this.idTanggapan,
      this.idPetugas,
      this.idPengaduan,
      this.tglTanggapan,
      this.tanggapan,
      this.createdAt,
      this.updatedAt});

  Tanggapans.fromJson(Map<String, dynamic> json) {
    idTanggapan = json['id_tanggapan'];
    idPetugas = json['id_petugas'];
    idPengaduan = json['id_pengaduan'];
    tglTanggapan = json['tgl_tanggapan'];
    tanggapan = json['tanggapan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanggapan'] = this.idTanggapan;
    data['id_petugas'] = this.idPetugas;
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_tanggapan'] = this.tglTanggapan;
    data['tanggapan'] = this.tanggapan;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
