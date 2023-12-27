import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget{
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
        color: Colors.grey[50],
    ),
      child: Image.asset(
        imagePath,
        height: 65,
      ),
    );
  }
}