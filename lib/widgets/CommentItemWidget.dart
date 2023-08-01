import 'package:devotion/models/comment.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

//  CurvedCornerWidget(
//             borderColor: Color(0xff423050),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 48, vertical: 40),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'About Me',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 18,
//                   ),
//                   Text(
//                     'When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. ',
//                     style: TextStyle(
//                       color: Color(0xff998fa2),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

class CommentItemWidget extends StatelessWidget {
  final Comment comment;

//  final Size size;

  CommentItemWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      // padding: EdgeInsets.only(top: this.radius),
      radius: 60,
      borderColor: Color(0xffE7E4E9),
      child: Container(
//        width: size.width,
        padding: EdgeInsets.only(left: 18, top: 30, right: 12, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageAvatarWidget(
              imageURL: comment.user.avatar != null
                  ? comment.user.avatar
                  : 'aurl/at/least',
              borderWidth: 2,
              borderColor: Color(0xff8A56AC),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    comment.user.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.16,
                      height: 1.125,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    comment.comment,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 1.42,
                      letterSpacing: -0.14,
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.reply_outlined , size:21),
                        Text('Reply', style:TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              width: 69,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getRelativeTime(comment.createdAt),
                    style: TextStyle(
                      // color: Color(0xb2ffffff),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                      height: 1.125,
                    ),
                  ),
                  SizedBox(height: 16),
                  comment.liked == 1
                      ? Icon(
                          Icons.favorite_border,
                          size: 16,
                        )
                      : Icon(
                          Icons.favorite,
                          size: 16,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
