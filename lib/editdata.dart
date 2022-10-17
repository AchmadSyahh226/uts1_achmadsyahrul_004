import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;
  const EditData({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerNomor;
  late TextEditingController controllerNama;
  late TextEditingController controllerAsal;
  late TextEditingController controllerNotelp;

  void editData() {
    var url = "http://10.0.2.2/my_crud_app/editdata.php";

    http.post(Uri.parse(url), body: {
      'nosantri': controllerNomor.text,
      'namasantri': controllerNama.text,
      'asalsantri': controllerAsal.text,
      'notelpsantri': controllerNotelp.text,
    });
  }

  @override
  void initState() {
    controllerNomor =
        TextEditingController(text: widget.list[widget.index]['no_santri']);
    controllerNama = TextEditingController(
        text: widget.list[widget.index]['nama_santri']);
    controllerAsal = TextEditingController(
        text: widget.list[widget.index]['asal_santri']);
    controllerNotelp = TextEditingController(
        text: widget.list[widget.index]['no_telp_santri']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Data")),
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
              ElevatedButton(
                  onPressed: () {
                    editData();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "EDIT DATA",
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
