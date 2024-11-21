import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/controllers/components/primary_text_component.dart';
//import 'package:todoapp/views/auth_screens/login_screen.dart';

class AccountExists extends StatelessWidget {
  final String rowText;
  final String rowText2;
  final Widget nextScreen;

  const AccountExists(
      {super.key,
      required this.rowText,
      required this.nextScreen,
      required this.rowText2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rowText,
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => nextScreen,
              ),
            );
          },
          child: PrimaryTxtComponent(appText: rowText2),
        ),
      ],
    );
  }
}
