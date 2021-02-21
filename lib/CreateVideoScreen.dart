import 'dart:convert';
import 'dart:developer';

import 'package:devotion/misc/CustomIcons.dart';
import 'package:devotion/models/Address.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/sheets/AdressSheet.dart';
import 'package:devotion/sheets/ProfileMediaSheet.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/AppButtonWidget.dart';
import 'package:devotion/widgets/BottomSheetWidget.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CreateVideoScreen extends StatefulWidget {
  @override
  _CreateVideoScreenState createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  VideoPost myVideo = VideoPost();
  Address myAddress = Address();
  bool isLoading = false;
  bool eventCreated = false;
  DateTime selectedDate = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _showLocationAndReturn(BuildContext context) async {
    Address eventAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomSheetWidget(
          child: AddressSheet(),
        ),
      ),
    );

    setState(() {
      if (eventAddress == null) return;

      myAddress = eventAddress;
    });
//    showModalBottomSheet(
//        context: context,
//        isScrollControlled: true,
//        enableDrag: true,
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//        backgroundColor: Colors.transparent,
//        builder: (BuildContext context) {
//          return DraggableScrollableSheet(
//            initialChildSize: 0.5, //set this as you want
//            maxChildSize: 0.95, //set this as you want
//            minChildSize: 0.5, //set this as you want
//            expand: true,
//            builder: (context, scrollController) => BottomSheetWidget(
//              child: AddressSheet(),
//            ),
//          );
//        });
  }

  postVideo() async {
    isLoading = true;
    myVideo.name = nameController.value.text;
    myVideo.description = descriptionController.value.text;
//    myVideo.addressId = myAddress.id;
    Map<String, dynamic> dataVal = myVideo.toJson();
    Map<String, dynamic> res =
        await NetworkingClass().post('/video-posts', dataVal);
    log(res.toString());
    //show response
    if (res['data'] == true) {
      //set state here or go back
      //event has been created successfully
      setState(() {
        eventCreated = true;
      });
//        Navigator.pop(context);

    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Create Event',
        color: Colors.white,
      ),
      fixedWidget:
          eventCreated ? VideoCreatedWidget(myVideo: myVideo) : Container(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100, left: 24, right: 24),
        color: Color(0xff241332),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  letterSpacing: -0.32,
                  color: Color(0x99ffffff),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                hintText: 'Event Name',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff352641),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            TextField(
              controller: descriptionController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(
                  letterSpacing: -0.32,
                  color: Color(0x99ffffff),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff352641),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CreateModelRowWidget(
              icon: Icons.location_on,
              title:
                  myAddress.address1 != null ? myAddress.address1 : 'Location',
              description: myAddress.address2 != null
                  ? myAddress.address2
                  : 'Select a location',
              body: MapWidget(address: myAddress),
              tapped: _showLocationAndReturn,
            ),
            SizedBox(
              height: 40,
            ),
            CreateModelRowWidget(
              icon: Icons.videocam_outlined,
              title: 'Select Video',
              description: 'Select the file to be uploaded',
//              tapped: (context) {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) =>
//                          BottomSheetWidget(child: ProfileMediaSheet())),
//                );
//              },
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: postVideo,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff8a56ac),
                ),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCreatedWidget extends StatelessWidget {
  const VideoCreatedWidget({
    Key key,
    @required this.myVideo,
  }) : super(key: key);

  final VideoPost myVideo;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff000000),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 174,
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width - 120,
                height: 300,
                child: Column(
                  children: [
                    Text(
                      'Event Created',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -16 / 24,
                          color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        ImageAvatarWidget(
                          imageURL: 'images/avatar1.jpg',
                          size: 68,
                          borderColor: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getRelativeTime(myVideo.createdAt),
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0x99ffffff)),
                            ),
                            SizedBox(height: 7),
                            Text(myVideo.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 174,
              child: Column(children: [
                AppButtonWidget(
                  text: 'Done',
                  onTap: () => Navigator.pop(context),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class CreateModelRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget body;
  final Function tapped;
  const CreateModelRowWidget(
      {Key key,
      this.icon,
      this.title,
      this.description,
      this.body,
      this.tapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        tapped(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Color(0xff757575),
            size: 24,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.1),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 20,
                      color: Color(0xffffffff),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  this.description,
                  style: TextStyle(
                    letterSpacing: -0.19,
                    color: Color(0xff8c8195),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                (this.body != null) ? this.body : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
