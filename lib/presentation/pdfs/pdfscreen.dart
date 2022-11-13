
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/pdfs/pdf_api.dart';
import 'package:school_project/presentation/pdfs/pdfs_widget.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';

class PdfShowScreen extends StatefulWidget {
  String classs;

  PdfShowScreen({required this.classs});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PdfShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primary,
          toolbarHeight: 1,
        ),
        body:

        Container(
            color: Colors.white38,
            child: Column(children: [
              SizedBox(height: 30),
              Flexible(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('pdfs')
                          .where('grade', isEqualTo:widget.classs)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return

                              GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 3,
                                  ),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    DocumentSnapshot posts =
                                    snapshot.data!.docs[index];

                                    return
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height:
                                            270,
                                            child: InkWell(
                                              child: Card(
                                                color: Colors.white,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                          topLeft:
                                                          Radius.circular(
                                                              10),
                                                          topRight:
                                                          Radius.circular(
                                                              10),
                                                          bottomLeft:
                                                          Radius.circular(
                                                              10),
                                                          bottomRight:
                                                          Radius.circular(
                                                              10)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width:
                                                        420,
                                                        height:84,
                                                        child: Image.network(
                                                            posts['image'],
                                                            fit: BoxFit.fill),
                                                      ),
                                                      SizedBox(
                                                          height: 1),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                              height:3
                                                          ),
                                                          Custom_Text(
                                                            text: posts['name'] ,
                                                            color:ColorManager.black,
                                                            alignment: Alignment.center,
                                                            fontSize:18,
                                                          ),
                                                          SizedBox(
                                                              height:8
                                                          ),
                                                          Custom_Text(
                                                            text: posts['sub'] ,
                                                            color:ColorManager.grey,
                                                            alignment: Alignment.center,
                                                            fontSize:13,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () async {
                                                final url = posts['pdf'];
                                                final file =
                                                await PDFApi.loadNetwork(url);
                                                openPDF(file);
                                              },
                                            )),
                                      );
                                  });
                        }
                      }))
            ]))

    );
  }
}


