import 'package:devotion/misc/CustomIcons.dart';
import 'package:devotion/models/Address.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/sheets/AdressSheet.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/BottomSheetWidget.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  Event myEvent = Event();
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

      myEvent.addresses[0] = eventAddress;
    });
  }

  postEvent() async {
    var res = await NetworkingClass().post('/events', myEvent);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Create Event',
        color: Colors.white,
      ),
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
                border: UnderlineInputBorder(
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
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff352641),
                      width: 1,
                      style: BorderStyle.solid),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CreateModelRowWidget(
              icon: CustomIcons.icons_light_localization,
              title: myEvent.addresses != null
                  ? myEvent.addresses[0].address1
                  : 'Location',
              description: myEvent.addresses != null
                  ? myEvent.addresses[0].address2
                  : 'Select a location',
              body: SizedBox(),
              tapped: _showLocationAndReturn,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Color(0xff757575),
                  size: 36,
                ),
                SizedBox(
                  width: 16,
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
                            'Images',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.14),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffffffff),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Select A few Pics',
                        style: TextStyle(
                          letterSpacing: -0.19,
                          color: Color(0xff8c8195),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                    ],
                  ),
                )
              ],
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
            size: 36,
          ),
          SizedBox(
            width: 16,
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
                      Icons.arrow_forward_ios,
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
                (this.body == null)
                    ? Container()
                    : Container(
                        padding: EdgeInsets.only(top: 17),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60),
                          ),
                          child: Image.asset(
                            'images/avatar1.jpg',
                            width: double.infinity,
                            height: 116,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
