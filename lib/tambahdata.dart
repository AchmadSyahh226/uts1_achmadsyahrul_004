import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahData extends StatefulWidget {
  const TambahData({Key? key}) : super(key: key);

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {

  TextEditingController controllerNomor = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAsal = TextEditingController();
  TextEditingController controllerNotelp = TextEditingController();

  void tambahData(){
    var url = "http://10.0.2.2/my_app_crud/tambahdata.php";

    http.post(Uri.parse(url), body: {
      'nosantri': controllerNomor.text,
      'namasantri': controllerNama.text,
      'asalsantri': controllerAsal.text,
      'notelpsantri': controllerNotelp.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Data")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              TextField(
                controller: controllerNomor,
                decoration: const InputDecoration(
                  hintText: "Nomor Peserta",
                  label: Text("Nomor Peserta"),
                ),
              ),
              TextField(
                controller: controllerNama,
                decoration: const InputDecoration(
                  hintText: "Nama Peserta",
                  label: Text("Nama Peserta"),
                ),
              ),
              TextField(
                controller: controllerAsal,
                decoration: const InputDecoration(
                  hintText: "Asal Peserta",
                  label: Text("Asal Peserta"),
                ),
              ),
              TextField(
                controller: controllerNotelp,
                decoration: const InputDecoration(
                  hintText: "Nomor Telepon Peserta",
                  label: Text("Nomor Telepon Peserta"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(onPressed: () {
                tambahData();
                Navigator.pop(context);
              }, child: const Text("TAMBAH DATA",)),
            ]),
          ],
        ),
      ),
    );
  }
}
