//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:todoapp/constants/colors/app_colors.dart';
import 'package:todoapp/controllers/components/apploader/apploader.dart';
import 'package:todoapp/controllers/components/custom_button_component.dart';
import 'package:todoapp/controllers/components/primary_text_component.dart';
import 'package:todoapp/controllers/components/text_form_field_component.dart';

class UpdateData extends StatefulWidget {
  final String docid;
  final String title;
  final String description;
  final String userEmail;
  const UpdateData(
      {super.key,
      required this.docid,
      required this.description,
      required this.title,
      required this.userEmail});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Crete a funtion to insert data into real_time Database-------------------------

  // insertYourData() async {
  //   try {
  //     isLoading = true;
  //     setState(() {});
  //     //Create a variable to contain document id according to current time(millisecond)
  //     String id = DateTime.now().millisecondsSinceEpoch.toString();
  //     String uid =
  //         FirebaseAuth.instance.currentUser!.uid; // Get the current user's UID

  //     /*millisecondsSinceEpoch is a property of the DateTime object. It returns the number
  //   of milliseconds that have passed since the "epoch," which is defined as
  //   January 1, 1970, 00:00:00 UTC (the Unix epoch). */

  //     await FirebaseFirestore.instance.collection('todo').doc(id).set(
  //       {
  //         //key : value
  //         //Field : value
  //         'title': _titleController.text,
  //         'description': _descriptionController.text,
  //         'id': id,
  //         'uid': uid,
  //       },
  //     );
  //     Get.snackbar('Success', 'Data inserted successfully!',
  //         icon: const Icon(Icons.check),
  //         backgroundColor: AppColors.appPrimaryColor);
  //     //Navigator.pop(context);
  //   } catch (error) {
  //     //catch the error
  //     isLoading = true;
  //     setState(() {});
  //     Get.defaultDialog(
  //       title: 'Error',
  //       content: const Text('Data insertion failed. Please try again.'),
  //       actions: [
  //         TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: const Text('Ok'))
  //       ],
  //     );
  //   } finally {
  //     Navigator.pop(context);
  //   }
  // }

  bool isLoading = false;
  //Create a function to Update your Data-------------------
  updateYourData() async {
    try {
      isLoading = true;
      setState(() {});
      await FirebaseFirestore.instance
          .collection(widget.userEmail)
          .doc(widget.docid)
          .update({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'id': widget.docid,
      });
    } catch (error) {
      //Catch error
    } finally {
      isLoading = false;
      setState(() {});
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        title: Text(
          'Update your Data',
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
              appText: 'Update your Data',
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
                    buttonText: 'Update',
                    onbuttonTap: () {
                      updateYourData();
                      // if (_titleController.text != '' &&
                      //     _descriptionController.text != '') {
                      //   updateYourData();
                      //   //insertYourData();
                      // } else {
                      //   Get.snackbar(
                      //     'Error',
                      //     'All fields are required to be filled.',
                      //     icon: const Icon(Icons.error_outline),
                      //   );
                      // }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
