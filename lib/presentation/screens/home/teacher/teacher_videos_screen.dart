
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_project/view_model/home_view_model.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherVideosScreen extends StatefulWidget {
  String email;

  TeacherVideosScreen({required this.email});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<TeacherVideosScreen> {
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
                          .collection('videos')
                          .where('owner_email', isEqualTo: widget.email)
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
                                            250,
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
                                                        height:90,
                                                        child: Image.network(
                                                            posts['image'],
                                                            fit: BoxFit.fill),
                                                      ),
                                                      SizedBox(
                                                          height: 5),
                                                      Column(
                                                        children: [
                                                          Custom_Text(
                                                            text: posts['name'],
                                                            color:ColorManager.black,
                                                            alignment: Alignment.center,
                                                          ),
                                                          SizedBox(
                                                              height:7
                                                          ),
                                                          Custom_Text(
                                                            text: posts['teacher_name'],
                                                            color:ColorManager.grey,
                                                            alignment: Alignment.center,
                                                            fontSize:16,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                _launchVideo(posts['video'],);
                                              },
                                            )),
                                      );
                                  });
                        }
                      }))
            ]))

    );
  }
  Future _launchVideo(String link) async {
    String email = link;
    final url = link;
        //'mailto:$email?subject=${Uri.encodeFull('My Subject')}'
        '&body=${Uri.encodeFull('استفسار ')}';

    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      await launch(url);
    }
  }
}
