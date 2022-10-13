import 'package:flutter/material.dart';

class Identitas extends StatefulWidget {
  List list;
  int index;
  Identitas({this.index, this.list})

  @override
  State<Identitas> createState() => _IdentitasState();
}

class _IdentitasState extends State<Identitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.list[widget.index]['nama_santri']}")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['nama_santri'], style: TextStyle(fontSize: 15),),
                Text("Nomor Santri : ${widget.list[widget.index]['no_santri']}", style: TextStyle(fontSize: 15),),
                Text("Asal : ${widget.list[widget.index]['asal_santri']}", style: TextStyle(fontSize: 15),),
                Text("Nomor Telepon : ${widget.list[widget.index]['no_telp_santri']}", style: TextStyle(fontSize: 15),),
                Padding(padding: const EdgeInsets.all(10),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}