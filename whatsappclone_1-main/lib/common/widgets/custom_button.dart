import 'package:flutter/material.dart';
import 'package:whatsappclone/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const CustomButton({Key? key, required this.text, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(color: blackColor),
      ),
      style: ElevatedButton.styleFrom(
          primary: tabColor, minimumSize: const Size(double.infinity, 50)),
    );
  }
}
