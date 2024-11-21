import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants/colors/app_colors.dart';
import 'package:todoapp/controllers/components/apploader/apploader.dart';
import 'package:todoapp/controllers/components/custom_button_component.dart';
import 'package:todoapp/controllers/components/primary_text_component.dart';
import 'package:todoapp/controllers/components/text_form_field_component.dart';

class InsertData extends StatefulWidget {
  final String userEmail;
  const InsertData({super.key, required this.userEmail});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Crete a funtion to insert data into real_time Database-------------------------

  insertYourData() async {
    try {
      isLoading = true;
      setState(() {});
      //Create a variable to contain document id according to current time(millisecond)
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      String uid =
          FirebaseAuth.instance.currentUser!.uid; // Get the current user's UID

      /*millisecondsSinceEpoch is a property of the DateTime object. It returns the number 
    of milliseconds that have passed since the "epoch," which is defined as 
    January 1, 1970, 00:00:00 UTC (the Unix epoch). */

      await FirebaseFirestore.instance.collection(widget.userEmail).doc(id).set(
        {
          //key : value
          //Field : value
          'title': _titleController.text,
          'description': _descriptionController.text,
          'id': id,
          'uid': uid,
        },
      );
      Get.snackbar('Success', 'Data inserted successfully!',
          icon: const Icon(Icons.check),
          backgroundColor: AppColors.appPrimaryColor);
      //Navigator.pop(context);
    } catch (error) {
      //catch the error
      isLoading = true;
      setState(() {});
      Get.defaultDialog(
        title: 'Error',
        content: const Text('Data insertion failed. Please try again.'),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Ok'))
        ],
      );
    } finally {
      Navigator.pop(context);
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        title: Text(
          'Insert your Data',
          style: TextStyle(
              color: AppColors.appWhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            //Text------------------------------
            const PrimaryTxtComponent(
              appText: 'Insert your Data',
              appTextSize: 30,
            ),
            const SizedBox(
              height: 15,
            ),
            //Custom TextFormField 1----------------------
            TxtFormFieldComponent(
              textHint: 'Enter Title',
              appController: _titleController,
            ),
            //Custom TextFormField 1----------------------
            TxtFormFieldComponent(
                textHint: 'Enter Description',
                appController: _descriptionController),
            const SizedBox(
              height: 15,
            ),
            //Custom Button ----------------------
            isLoading
                ? const AppLoader()
                : ButtonComponent(
                    buttonText: 'Add',
                    onbuttonTap: () {
                      if (_titleController.text != '' &&
                          _descriptionController.text != '') {
                        insertYourData();
                      } else {
                        Get.snackbar(
                          'Error',
                          'All fields are required to be filled.',
                          icon: const Icon(Icons.error_outline),
                        );
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
