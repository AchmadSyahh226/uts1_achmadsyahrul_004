import 'package:flutter/material.dart';

class TambahData extends StatefulWidget {
  const TambahData({Key? key}) : super(key: key);

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Data")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>
            [Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Nomor Peserta",
                  label: Text("Nomor Peserta"),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nama Peserta",
                  label: Text("Nama Peserta"),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Asal Peserta",
                  label: Text("Asal Peserta"),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nomor Telepon Peserta",
                  label: Text("Nomor Telepon Peserta"),
                ),
              ),
              Padding(padding: const EdgeInsets.all(10.0),),
        
              ElevatedButton(onPressed: () {}, child: Text("TAMBAH DATA"))
            ]),
          ],
        ),
      ),
    );
  }
}