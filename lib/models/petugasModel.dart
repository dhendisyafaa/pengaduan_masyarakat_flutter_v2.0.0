class petugasModel {
  String? idPetugas;
  String? namaPetugas;
  String? username;
  String? telp;
  String? level;

  petugasModel(
      {this.idPetugas, this.namaPetugas, this.username, this.telp, this.level});

  petugasModel.fromJson(Map<String, dynamic> json) {
    idPetugas = json['id_petugas'];
    namaPetugas = json['nama_petugas'];
    username = json['username'];
    telp = json['telp'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.idPetugas;
    data['nama_petugas'] = this.namaPetugas;
    data['username'] = this.username;
    data['telp'] = this.telp;
    data['level'] = this.level;
    return data;
  }
}
