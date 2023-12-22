import 'package:flutter/material.dart';

class KoNnecTPost extends StatelessWidget {
    final String message;
    final String user;
    const KoNnecTPost({
        super.key,
        required this.message,
        required this.user,

    });

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            ),
          margin: EdgeInsets.only(top: 25, left:25, right:25),
          child: Row(
              children: [
                //profile pic
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[400]),
                  child: Icon(Icons.person),
                ),
                  //message and user
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          user,
                        style: TextStyle(color: Colors.grey[500]),
                        ),
                      const SizedBox(height: 10),
                      Text(message),
                    ],
                  )
              ],
          ),
        );
    }
}
