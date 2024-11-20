import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Controller/components/apploader/primary_text_component.dart';
class AccountExistsComponent extends StatelessWidget {
  final String rowText;
  final String rowText2;
  final Widget nextScreen;
   const AccountExistsComponent({super.key,
   required this.rowText,
   required this.nextScreen,
   required this.rowText2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(rowText,
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>nextScreen,
            ),
            );
          },
          child: PrimaryTextWidget(text: rowText2),
        ),
      ],
    );
  }
}
