import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants/colors/app_colors.dart';
import 'package:todoapp/views/auth_screens/login_screen.dart';
import 'package:todoapp/views/home_screens/insert_data_screen/insert_todo_data.dart';
import 'package:todoapp/views/home_screens/update_data_screen/update_todo_data.dart';
//import 'package:todoapp/views/auth_screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Global Variables-------------------
  String userId = '';

  String userEmail = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    userId = user!.uid;
    userEmail = user.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FloatingActionButton to insert data to the app----------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoDialogRoute(
                builder: (context) => InsertData(userEmail: userEmail),
                context: context),
          );
        },
        backgroundColor: AppColors.appPrimaryColor,
        child: Icon(
          Icons.add,
          color: AppColors.appWhiteColor,
        ),
      ),
      appBar: AppBar(
        title: Text(userEmail),
        backgroundColor: AppColors.appPrimaryColor,
        actions: [
          //IconButton to signout from app------------------------
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.logout,
              color: AppColors.appWhiteColor,
            ),
          ),
        ],
      ),
      //StreamBuilder to fetch/Read data from firestore---------------
      body: Stack(
        children: [
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection(userEmail).snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child:
                      CircularProgressIndicator(), // Show loader while data is loading
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error loading data'),
                );
              }

              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, Index) {
                  //Three variables created for DocId, title, and description---------
                  String docid = data.docs[Index]['id'];
                  String title = data.docs[Index]['title'];
                  String description = data.docs[Index]['description'];
                  return Card(
                    color: AppColors.appSecondaryColor,
                    child: ListTile(
                      //Button on Long Press-------------Move to Update Screen---------
                      onLongPress: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UpdateData(
                              docid: docid,
                              description: description,
                              title: title,
                              userEmail: userEmail,
                            ),
                          ),
                        );
                      },
                      //Button On Tap-----------Delete the Record---------------------
                      onTap: () {
                        Get.defaultDialog(
                            title: 'Confirmation',
                            content:
                                const Text('Are you sure you want to delete?'),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection(userEmail)
                                        .doc(docid)
                                        .delete();
                                    Get.back();
                                  },
                                  child: const Text('Yes'))
                            ]);
                      },
                      // leading: CircleAvatar(
                      //   backgroundColor: AppColors.appWhiteColor,
                      //   child: Text(data.docs[Index]['id']),
                      // ),
                      title: Text(title),
                      subtitle: Text(description),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
