import 'dart:convert';
import 'dart:developer';

import 'package:devotion/misc/CustomIcons.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/sheets/AdressSheet.dart';
import 'package:devotion/sheets/ImageSheet.dart';
import 'package:devotion/util/Constants.dart';
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

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  Event myEvent = Event();
  Address myAddress = Address();
  bool isLoading = false;
  bool eventCreated = false;
  DateTime selectedDate;
  TimeOfDay selectedTime;
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

  void _getProfileMedia(BuildContext context) async {
    List<ResizedImage> images = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomSheetWidget(
          child: ImageSheet(),
        ),
      ),
    );

    setState(() {
      if (images == null) return;
      myEvent.images = images;
    });
  }

  postEvent() async {
    isLoading = true;
    myEvent.name = nameController.value.text;
    myEvent.description = descriptionController.value.text;
    myEvent.startingAt = selectedDate;
    Map<String, dynamic> dataVal = myEvent.toJson();
    dataVal['address_ids'] = [myAddress.id];
    log(dataVal.toString());
    try {
      Map<String, dynamic> res =
          await NetworkingClass().post('/events', dataVal);
      log(res.toString());
      myEvent = Event.fromJson(res['data']);
      eventCreated = true;
    } catch (e) {
      log(e.toString());
    }
    setState(() {});
    isLoading = false;
  }

  selectStartingDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {});
  }

  selectStartingTime(BuildContext context) async {
    selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Create Event',
        color: Colors.white,
      ),
      fixedWidget:
          eventCreated ? EventCreatedWidget(myEvent: myEvent) : Container(),
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
              icon: Icons.calendar_today,
              title: selectedDate != null
                  ? "${MONTHS[selectedDate.month]} ${selectedDate.day}"
                  : 'Starting Date',
              description: selectedDate != null
                  ? "${MONTHS[selectedDate.month]} ${selectedDate.day} ${selectedDate.year}"
                  : 'What Date does the event start',
              tapped: selectStartingDate,
            ),
            SizedBox(height: 40),
            CreateModelRowWidget(
              icon: Icons.timer,
              title: selectedTime != null
                  ? "${selectedTime.hour}:${selectedTime.minute}"
                  : 'Starting At',
              description: selectedTime != null
                  ? "${selectedTime.hour}:${selectedTime.minute}"
                  : 'When does the event start',
              tapped: selectStartingTime,
            ),
            SizedBox(height: 40),
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
              icon: Icons.favorite_border,
              title: myEvent.images != null
                  ? "${myEvent.images.length} Images"
                  : 'Images',
              description: myEvent.images != null
                  ? 'Edit Event Images'
                  : 'Select A few Pics',
              tapped: _getProfileMedia,
              body: Container(
                height: myEvent.images != null ? 100 : 0,
                padding: EdgeInsets.only(top: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: myEvent.images
                          ?.map((ResizedImage e) =>
                              Image.network(STORAGE_URL + e.small))
                          ?.toList() ??
                      [],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: postEvent,
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

class EventCreatedWidget extends StatelessWidget {
  const EventCreatedWidget({
    Key key,
    @required this.myEvent,
  }) : super(key: key);

  final Event myEvent;

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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        ImageAvatarWidget(
                          imageURL: myEvent.images != null &&
                                  myEvent.images.isNotEmpty
                              ? myEvent.images[0].small
                              : 'defaultImage',
                          size: 68,
                          borderColor: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getRelativeTime(myEvent.startingAt),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0x99ffffff),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              myEvent.name,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
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
