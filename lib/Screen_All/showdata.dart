import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Showdata extends StatelessWidget {
  const Showdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Show Data",
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(
                      "${snapshot.data?.docs[index]["title"]??""}",
                    ),
                    subtitle: Text(
                      "${snapshot.data?.docs[index]["description"]??""}",
                    ),
                  );
                },
                itemCount: snapshot.data?.docs.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(
                  height: 500,width: 205,
                  child: Text(
                    "${snapshot.error.toString()}",
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
