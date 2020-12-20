import 'package:devotion/OnBoardingScreen.dart';
import 'package:devotion/models/AudioMessage.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final int audioId;

  const MusicPlayerScreen(this.audioId, {Key key}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  AudioMessage audio;

  Future<Map<ResponseKey, dynamic>> getEvent() {
    NetworkingClass server = NetworkingClass();
    return server.get('/events/' + widget.audioId.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return 
    //  FutureBuilder<Map<ResponseKey, dynamic>>(
    //     future: getEvent(),
    //     builder: (
    //       context,
    //       AsyncSnapshot<Map<ResponseKey, dynamic>> snapshot,
    //     ) {
    //       if (snapshot.hasData) {
    //         if (snapshot.data[ResponseKey.type] == ResponseType.data) {
    //           var res = snapshot.data[ResponseKey.data]['data'];
    //           audio = AudioMessage.fromJson(snapshot.data[ResponseKey.data]['data']);
         
    
    
    
    
    AppScaffoldWidget(
      showFloatingButton: false,
      appBar: AppBarWidget(
        color: Color(0xff352641),
        title: 'Summer Playlist',
        borderColor: Color(0x00ffffff),
        titleColor: Color(0xffffffff),
      ),
      body: Container(
        color: Color(0xff241332),
        height: size.height - 73,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height - 200,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DottedTabBarWidget(
                      count: 4,
                    ),
                    SizedBox(
                      height: 125,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/avatar1.jpg',
                        width: 260,
                        height: 260,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Salad Days',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Danielle Gibson',
                      style: TextStyle(
                        color: Color(0xafffffff),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.18,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '04:52',
                                  style: TextStyle(
                                    color: Color(0xff998fa2),
                                    letterSpacing: 1,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  '04:52',
                                  style: TextStyle(
                                    color: Color(0xff998fa2),
                                    letterSpacing: 1,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: 0.4,
                              onChanged: null,
                              activeColor: Color(0xffd47fa6),
                              inactiveColor: Color(0x20d47fa6),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 37,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // top: size.height - 200,
              bottom: 0,
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0x1a455b63),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 34,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffd47fa6),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 34,
                      ),
                    ),
                    Icon(Icons.skip_next, color: Colors.white, size: 34),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
