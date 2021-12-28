//@dart = 2.9
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://truethanyarak.com/api/Ar_List.php'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  String id;
  String subject;
  String title;
  String htmlname;
  String urlhtmlpath;
  String picname;
  String urlpicpath;
  String createby;
  DateTime createdate;
  DateTime lastmoddate;
  String lastmodby;
  Data({
    this.id,
    this.subject,
    this.title,
    this.htmlname,
    this.urlhtmlpath,
    this.picname,
    this.urlpicpath,
    this.createby,
    this.createdate,
    this.lastmoddate,
    this.lastmodby,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] == null ? null : json["id"],
      subject: json["subject"] == null ? null : json["subject"],
      title: json["title"] == null ? null : json["title"],
      htmlname: json["htmlname"] == null ? null : json["htmlname"],
      urlhtmlpath: json["urlhtmlpath"] == null ? null : json["urlhtmlpath"],
      picname: json["picname"] == null ? null : json["picname"],
      urlpicpath: json["urlpicpath"] == null ? null : json["urlpicpath"],
      createby: json["createby"] == null ? null : json["createby"],
      createdate: json["createdate"] == null
          ? null
          : DateTime.parse(json["createdate"]),
      lastmoddate: json["lastmoddate"] == null
          ? null
          : DateTime.parse(json["lastmoddate"]),
      lastmodby: json["lastmodby"] == null ? null : json["lastmodby"],
    );
  }
}

class testapi extends StatefulWidget {
  testapi({Key key}) : super(key: key);

  @override
  _testapiState createState() => _testapiState();
}

class _testapiState extends State<testapi> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    //พื้นหลัง
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    //เนื้อหา
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 130, left: 40, right: 40),
                      child: Column(
                        children: [
                          Container(
                            //height: MediaQuery.of(context).size.height,
                            height: 500,
                            width: 100,
                            child: FutureBuilder<List<Data>>(
                              future: futureData,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<Data> data = snapshot.data;
                                  return ListView.builder(
                                      controller: ScrollController(),
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 75,
                                          margin: EdgeInsets.all(15),
                                          color: Colors.red,
                                          child: Center(
                                            child: Text(data[index].id),
                                          ),
                                        );
                                      });
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                // By default show a loading spinner.
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height,
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(40.0),
                    //       topRight: Radius.circular(40.0),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavigagitonBar(),
    );
  }
}
