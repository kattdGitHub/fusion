import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fusion/signup%20page.dart';
import 'package:flutter/material.dart';

class Showdata extends StatelessWidget {
  const Showdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignPage()));
        },
      ),
      appBar: AppBar(
        title: Text(
          "Show Users",
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
                  final user = snapshot.data?.docs[index];
                  return ListTile(
                    leading: buildAvatarContainer(index, user),
                    title: Text(
                      "${user?["email"] ?? ""}",
                    ),
                    subtitle: Text(
                      "${user?["password"] ?? ""}",
                    ),
                  );
                },
                itemCount: snapshot.data?.docs.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(
                  height: 500,
                  width: 205,
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

  Widget buildAvatarContainer(int index, QueryDocumentSnapshot<Map<String, dynamic>>? user) {
    return Container(
      width: 50, // Adjust the width as per your requirement
      height: 50, // Adjust the height as per your requirement
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black), // Add border styling if needed
      ),
      child: user?["image"] == null
          ? _buildDefaultAvatar(index)
          : _buildUserImage(user?["image"]),
    );
  }

  Widget _buildDefaultAvatar(int index) {
    return Center(
      child: Text("${index + 1}"),
    );
  }

  Widget _buildUserImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

}
