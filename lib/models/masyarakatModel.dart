class masyarakatModel {
  String? uuid;
  String? nik;
  String? nama;
  String? username;
  String? telp;

  masyarakatModel({this.uuid, this.nik, this.nama, this.username, this.telp});

  masyarakatModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nik = json['nik'];
    nama = json['nama'];
    username = json['username'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['telp'] = this.telp;
    return data;
  }
}
