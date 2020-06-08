import 'package:devotion/widgets/DefaultAppBarWidget.dart';
import 'package:devotion/widgets/ScaffoldDesignWidget.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldDesignWidget(
      customAppBar: DefaultAppBarWidget(
        color: Color(0xff352641),
        title: 'Summer Playlist',
      ),
      body: Container(
        padding: EdgeInsets.only(top:223),
        color: Color(0xff241332),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.asset('images/avatar1.jpg',
                width: 260,
                height: 260,),),
            SizedBox(
              height: 25,
            ),
            Text('Salad Days'),
            SizedBox(
              height: 6,
            ),
            Text('Danielle Gibson'),
            SizedBox(
              height: 81,
            ),
            Slider(value: 0.4, onChanged: null),
          ],
        ),
      ),
    );
  }
}
