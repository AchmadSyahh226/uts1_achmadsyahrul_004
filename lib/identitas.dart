import 'package:crud_mobile_004_achmadsr/main.dart';
import 'package:flutter/material.dart';
import './Editdata.dart';
import 'package:http/http.dart' as http;

class Identitas extends StatefulWidget {
  

  List list;
  int index;
  Identitas({required this.index, required this.list});


  @override
  State<Identitas> createState() => _IdentitasState();

}

class _IdentitasState extends State<Identitas> {

  void hapusData(){
    var url = "http://10.0.2.2/my_crud_app/hapusdata.php";
    http.post(Uri.parse(url), body: {
      'nosantri': widget.list[widget.index]['no_santri'],
    });
  }

  void confirm(){
    AlertDialog alertDialog = AlertDialog(
        content: Text("Apakah Anda yakin ingin menghapus '${widget.list[widget.index]['nama_santri']}' ?"),
        actions: <Widget>[
          ElevatedButton(onPressed: () {
            hapusData();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyApp()));
          }, child: const Text("HAPUS")),
          ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text("BATAL")),
        ],
    );
    showDialog(context: context, builder: (BuildContext context) => alertDialog, );
  }

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
                Text(widget.list[widget.index]['nama_santri'], style: const TextStyle(fontSize: 20),),
                Text("Nomor Santri : ${widget.list[widget.index]['no_santri']}", style: const TextStyle(fontSize: 20),),
                Text("Asal : ${widget.list[widget.index]['asal_santri']}", style: const TextStyle(fontSize: 20),),
                Text("Nomor Telepon : ${widget.list[widget.index]['no_telp_santri']}", style: const TextStyle(fontSize: 20),),
                const Padding(padding: EdgeInsets.all(10),),
                
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    
                    ElevatedButton(
                      child: const Text("EDIT"),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EditData(list: widget.list, index: widget.index),
                    ))),
                    ElevatedButton(
                      child: const Text("DELETE"),
                      onPressed: () => confirm() ,
                    ),
                ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}