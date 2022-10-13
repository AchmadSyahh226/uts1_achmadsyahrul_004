import 'package:flutter/material.dart';

class Identitas extends StatefulWidget {
  

  List list;
  int index;
  Identitas({Key? key, required this.index, required this.list}) : super(key: key);


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
                Text(widget.list[widget.index]['nama_santri'], style: TextStyle(fontSize: 20),),
                Text("Nomor Santri : ${widget.list[widget.index]['no_santri']}", style: TextStyle(fontSize: 20),),
                Text("Asal : ${widget.list[widget.index]['asal_santri']}", style: TextStyle(fontSize: 20),),
                Text("Nomor Telepon : ${widget.list[widget.index]['no_telp_santri']}", style: TextStyle(fontSize: 20),),
                Padding(padding: const EdgeInsets.all(10),),
                
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    
                    ElevatedButton(
                      child: Text("EDIT"),
                      onPressed: () {} ,
                    ),
                    ElevatedButton(
                      child: Text("DELETE"),
                      onPressed: () {} ,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}