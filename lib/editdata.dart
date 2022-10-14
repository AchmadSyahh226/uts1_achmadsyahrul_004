import 'package:flutter/material.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;
  EditData({required this.list,required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  late TextEditingController controllerNomor;
  late TextEditingController controllerNama;
  late TextEditingController controllerAsal;
  late TextEditingController controllerNotelp;

void editData(){
  
}

@override
  void initState() {
    controllerNomor= new TextEditingController(text: widget.list[widget.index]['no_santri'] );
    controllerNama= new TextEditingController(text: widget.list[widget.index]['nama_santri'] );
    controllerAsal= new TextEditingController(text: widget.list[widget.index]['asal_santri'] );
    controllerNotelp= new TextEditingController(text: widget.list[widget.index]['no_telp_santri'] );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Data")),
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
                editData();
                Navigator.pop(context);
              }, child: Text("EDIT DATA",)),
            ]),
          ],
        ),
      ),
    );
  }
}