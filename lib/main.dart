import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Identitas.dart';
import './Tambahdata.dart';

void main() {
  runApp(new MaterialApp(
    title: "DATA SANTRI LOMBA FASI",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> ambilData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/my_app_crud/ambildata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Santri Lomba FASI"),
      ),
      floatingActionButton:
          FloatingActionButton(
            child: Icon(Icons.add), 
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new TambahData())
    ),),
      body: FutureBuilder<List>(
        future: ambilData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data!,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(3.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Identitas(
                      list: list,
                      index: i,
                    ))),
            child: Card(
              child: new ListTile(
                title: Text(list[i]['nama_santri']),
                leading: Icon(Icons.person),
              ),
            ),
          ),
        );
      },
    );
  }
}
