import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahData extends StatefulWidget {
  const TambahData({Key? key}) : super(key: key);

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {

  TextEditingController controllerNomor = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerAsal = new TextEditingController();
  TextEditingController controllerNotelp = new TextEditingController();

  void tambahData(){
    var url = "http://10.0.2.2/my_crud_app/tambahdata.php";

    http.post(Uri.parse(url), body: {
      "nosantri": controllerNomor.text,
      "namasantri": controllerNama.text,
      "asalsantri": controllerAsal.text,
      "notelpsantri": controllerNotelp.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Data")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              TextField(
                controller: controllerNomor,
                decoration: InputDecoration(
                  hintText: "Nomor Peserta",
                  label: Text("Nomor Peserta"),
                ),
              ),
              TextField(
                controller: controllerNama,
                decoration: InputDecoration(
                  hintText: "Nama Peserta",
                  label: Text("Nama Peserta"),
                ),
              ),
              TextField(
                controller: controllerAsal,
                decoration: InputDecoration(
                  hintText: "Asal Peserta",
                  label: Text("Asal Peserta"),
                ),
              ),
              TextField(
                controller: controllerNotelp,
                decoration: InputDecoration(
                  hintText: "Nomor Telepon Peserta",
                  label: Text("Nomor Telepon Peserta"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              ElevatedButton(onPressed: () {
                tambahData();
                Navigator.pop(context);
              }, child: Text("TAMBAH DATA"))
            ]),
          ],
        ),
      ),
    );
  }
}
