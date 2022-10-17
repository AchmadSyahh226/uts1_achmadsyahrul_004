import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Identitas.dart';
import './Tambahdata.dart';

void main() {
  runApp(const MaterialApp(
    title: "DATA SANTRI LOMBA PILDACIL",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
        title: const Text("Data Santri Lomba Pildacil"),
        backgroundColor: Colors.blue[600],
      ),
      floatingActionButton:
          FloatingActionButton(
            child: const Icon(Icons.add), 
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const TambahData())
    ),),
      body: FutureBuilder<List>(
        future: ambilData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data!,
                )
              : const Center(
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
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Identitas(
                      list: list,
                      index: i,
                    ))),
            child: Card(
              child: ListTile(
                title: Text(list[i]['nama_santri']),
                leading: const Icon(Icons.person),
              ),
            ),
          ),
        );
      },
    );
  }
}
