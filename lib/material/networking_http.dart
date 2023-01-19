import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postData(Map<String, String> data) async {
  var result = await http.post(
    Uri.parse("http://127.0.0.1:8089/api/users/insert"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
    body: json.encode(data),
  );
  print(result.statusCode);
  return result;
}

Future<http.Response> updateData(int id, Map<String, dynamic> data) async {
  var result = await http.put(
      Uri.parse("http://127.0.0.1:8089/api/users/update/${id}"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: json.encode(data));

  print(result.body);
  return result;
}

Future<http.Response> deleteData(id) async {
  var result = await http
      .delete(Uri.parse("http://127.0.0.1:8089/api/users/delete/${id}"));
  print(result.body);
  return result;
}

class NetworkingHttpApp extends StatefulWidget {
  NetworkingHttpApp({super.key});

  @override
  State<NetworkingHttpApp> createState() => _NetworkingHttpAppState();
}

class _NetworkingHttpAppState extends State<NetworkingHttpApp> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> getData() async {
      var result =
          await http.get(Uri.parse("http://127.0.0.1:8089/api/users/getAll"));
      setState(() {
        result;
      });
      return result;
    }

    var data = getData();

    final add1 = TextEditingController();
    final add2 = TextEditingController();
    final add3 = TextEditingController();

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference users = firestore.collection("users");

    final up1 = TextEditingController();
    final up2 = TextEditingController();
    final up3 = TextEditingController();

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: add1,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.person_add),
                                  hintText: "Masukan Nama"),
                              textAlign: TextAlign.center,
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              controller: add2,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: "Masukan Email"),
                              textAlign: TextAlign.center,
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              controller: add3,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.male),
                                  hintText: "Masukan Gender"),
                              textAlign: TextAlign.center,
                              onSaved: (val) {},
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              postData(
                                {
                                  "nama": add1.text,
                                  "email": add2.text,
                                  "gender": add3.text
                                },
                              );
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.add))
                      ],
                    ));
          },
          backgroundColor: Color.fromARGB(255, 57, 23, 82),
          child: Icon(Icons.add_circle_outline),
        ),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          toolbarHeight: 50,
          centerTitle: true,
          leadingWidth: 200,
          title: const Text(
            "Flutter API",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Color.fromARGB(255, 57, 23, 82),
        ),
        body:
            // Stack(
            //   children: [
            //     ListView(
            //       children: [
            //         StreamBuilder(
            //           stream: users.snapshots(),
            //           builder: (context, snapshot) {
            //             if (snapshot.hasData) {
            //               ListView.builder(
            //                 itemCount: snapshot.data!.docs.length,
            //                 itemBuilder: (context, index) {
            //                   return ListTile();
            //                 },
            //               );
            //             } else {
            //               return CircularProgressIndicator();
            //             }
            //           },
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            FutureBuilder<http.Response>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> json = jsonDecode(snapshot.data!.body);
              return ListView.builder(
                itemCount: json.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(json[index]["nama"] ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(json[index]["email"] ?? ""),
                        Text(json[index]["gender"] ?? ""),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_note),
                          onPressed: () {
                            add1.text = json[index]["nama"];
                            add2.text = json[index]["email"];
                            add3.text = json[index]["gender"];
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Form(
                                        child: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              controller: add1,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.person_add),
                                                  hintText: "Masukan Nama"),
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {},
                                            ),
                                            TextFormField(
                                              controller: add2,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.email),
                                                  hintText: "Masukan Email"),
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {},
                                            ),
                                            TextFormField(
                                              controller: add3,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.male),
                                                  hintText: "Masukan Gender"),
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              updateData(
                                                json[index]["id"],
                                                {
                                                  "nama": add1.text,
                                                  "email": add2.text,
                                                  "gender": add3.text
                                                },
                                              );
                                              add1.clear();
                                              add2.clear();
                                              add3.clear();
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(Icons.add))
                                      ],
                                    ));
                            // updateData(json[index]["id"] ?? "");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            deleteData(json[index]["id"]);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
