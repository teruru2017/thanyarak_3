//@dart=2.9
import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_rights.dart';
import 'package:thanyarak/bodys/API/api_scheduleDate.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/login/editprofile_page.dart';
import 'package:thanyarak/models/session.dart';

import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat, Intl;
import 'package:intl/date_symbol_data_local.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/msgBox_widget.dart';

DateTime dt;
DateTime _currentDate = DateTime.now();
DateTime _targetDateTime = DateTime.now();
String _currentMonth = DateFormat.MMMM().format(DateTime.now());
String _daysel = DateFormat.yMd().format(_currentDate), Token, getDateAPI;
bool _ckVisittime = false;
DateTime _markedDateMapLOOP;
int setID;
String name_get;
String xx, showTime, showDay;
String pid_x;
String formattedDate;
var jsonResappointment;
//วันตัวแดง
List<DateTime> absentDates = [];
List<ScheduleDate> scheduleDate = [];

EventList<Event> _markedDateMap = new EventList<Event>(
  events: {},
);

class xrayMark_page extends StatefulWidget {
  bool postpone;
  int ID_postpone;
  xrayMark_page({Key key, this.postpone, this.ID_postpone}) : super(key: key);
  @override
  _xrayMark_pageState createState() => _xrayMark_pageState();
}

int btck, ID_postpone;
bool bt2 = true, page1 = false, postpone;
enum SingingCharacter { buse01, buse02, buse03, buse04, buse05, buse06, buse07 }

enum SingingCharacterV { have, donthave }
enum SingingCharacterCD { have, donthave }

SingingCharacter _character = SingingCharacter.buse01;
SingingCharacterV _characterV2 = SingingCharacterV.have;
SingingCharacterCD _characterCD = SingingCharacterCD.have;

int _Checkcharacter = 1;
int _CheckcharacterV2 = 0;
int _CheckcharacterCD = 0;
bool groupValue;
bool value;

class _xrayMark_pageState extends State<xrayMark_page> {
  String phoneSet;
  TextEditingController Phonecall = TextEditingController();
  List<String> timeslotDate = [];
  initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();

    setState(() {
      phoneSet = '';
      _currentDate = DateTime.now();
      getDateAPI = DateFormat('yyyy-MM').format(_targetDateTime);
      if (widget.postpone == true) {
        postpone = widget.postpone;
      } else {
        postpone = false;
      }
      ID_postpone = widget.ID_postpone;
      print(getDateAPI);
    });
    getDATA();
  }

  Future<List<ScheduleDate>> futureData;
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
      pid_x = per.getString('pid');
      name_get = per.getString('name');
      print('name_get : ${name_get}');
      print('pid : ${pid_x}');
      futureData = fetchData(dateAPI: getDateAPI);
    });
  }

  Future<List<ScheduleDate>> fetchData({String dateAPI}) async {
    var url = '${apiurl().url}/scheduleDate/1/${dateAPI}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.statusCode);
      // print(jsonResponse);
      var holiday = min(jsonResponse?.length, jsonResponse.length);
      setState(() {
        for (int i = 0; i < holiday; i++) {
          // print(jsonResponse[0]['is_holiday']);
          if (jsonResponse[i]['is_holiday'] == true) {
            // print();
            _markedDateMap.add(
                DateTime.parse(jsonResponse[i]['date']),
                new Event(
                    title: jsonResponse[i].toString(),
                    date: DateTime.parse(jsonResponse[i]['date']),
                    icon: _absentIcon(
                      DateTime.parse(jsonResponse[i]['date']).day.toString(),
                    )));
          }
        }
        _ckVisittime = false;
      });

      return jsonResponse
          .map((data) => new ScheduleDate.fromJson(data))
          .toList();
    } else if (response.statusCode == 401) {
      print('Status Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
  }

  var len = min(absentDates?.length, absentDates.length);
  double cHeight;
  String ck;
  CalendarCarousel _calendarCarouselNoHeader;
  static Widget _absentIcon(String day) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.red[100],
        ),
        padding: EdgeInsets.all(1),
        child: Text(
          day,
          style: TextStyle(color: Colors.red, fontSize: 14),
        ),
      );
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;

    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.MMMM('th_Th').format(_targetDateTime);
        });
      },

      markedDateIconBorderColor: Colors.red,
      markedDateIconOffset: 2,
      markedDateIconMargin: 0,
      markedDateIconMaxShown: 1,
      showHeader: false,
      showHeaderButton: true,
      // headerTextStyle: TextStyle(color: Colors.red),

      weekDayMargin: const EdgeInsets.only(bottom: 4.0),
      todayBorderColor: Colors.grey[200],
      todayButtonColor: Colors.grey[200],
      targetDateTime: _targetDateTime,
      daysHaveCircularBorder: false,
      // thisMonthDayBorderColor: Colors.grey,
      todayTextStyle: TextStyle(
        color: Colors.black,
      ),

      customWeekDayBuilder: (weekday, weekdayName) => customDay(weekday),
      // weekDayBackgroundColor: Colors.amber,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),

      showWeekDays: true,
      selectedDayButtonColor: Colors.blue,
      dayPadding: 1,

      selectedDayBorderColor: Colors.blue,

      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,

      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 0)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      selectedDateTime: _currentDate,
      onDayPressed: (date, events) {
        ck = '';
        events.forEach(
          (event) => ck = event.title,
        );
        print(" xxx  ${btck}");
        // print(_targetDateTime);
        // print(_daysel);
        setState(() {
          btck = 404;
        });

        if (ck == '') {
          this.setState(() => _currentDate = date);
          _ckVisittime = true;
          print('----------------------------');
          print('ว่าง');
          print(
              'Day select :  ${convertDateTimeDisplay(_currentDate.toString())}');

          print(scheduleDate.length);
          timeslotDate.clear();
          for (int x = 0; x < scheduleDate.length; x++) {
            if (convertDateTimeDisplay(_currentDate.toString()) ==
                convertDateTimeDisplay(scheduleDate[x].date.toString())) {
              print(
                  "Day get : ${convertDateTimeDisplay(scheduleDate[x].date.toString())}");
              for (int timeCount = 0;
                  timeCount < scheduleDate[x].timeslots.length;
                  timeCount++) {
                timeslotDate
                    .add(scheduleDate[x].timeslots[timeCount].time.toString());
                // print(
                //     "Time get :${timeCount} : ${scheduleDate[x].timeslots[timeCount].time.toString()}");
                // txtTime(1, false, '07:30 น.');
              }
            }
          }
          print(timeslotDate);
          print('----------------------------');
        } else {
          print('ไม่ว่าง');
        }
      },
      scrollDirection: Axis.horizontal,
      // markedDateCustomShapeBorder: RoundedRectangleBorder(
      //     side: BorderSide(color: Colors.black),
      //     borderRadius: BorderRadius.all(Radius.circular(15))),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    //พื้นหลัง
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.center,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'เลือกวันนัด',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.kanit(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    //เนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 90, left: 15, right: 15, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.navigate_before,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month - 1);
                                        _currentMonth = DateFormat.MMMM('th_TH')
                                            .format(_targetDateTime);
                                        //GETAPI
                                        getDateAPI = DateFormat('yyyy-MM')
                                            .format(_targetDateTime);
                                        print("GAR : ${getDateAPI}");
                                        futureData =
                                            fetchData(dateAPI: getDateAPI);
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Text(_currentMonth,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month + 1);
                                        _currentMonth = DateFormat.MMMM('th_TH')
                                            .format(_targetDateTime);
                                        //GETAPI
                                        getDateAPI = DateFormat('yyyy-MM')
                                            .format(_targetDateTime);
                                        print("GAR : ${getDateAPI}");
                                        futureData =
                                            fetchData(dateAPI: getDateAPI);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: FutureBuilder<List<ScheduleDate>>(
                              future: futureData,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  scheduleDate = snapshot.data;

                                  return _calendarCarouselNoHeader;
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                return Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                          Visibility(
                            visible: _ckVisittime,
                            child: Text(
                              'เวลานัด',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _ckVisittime,
                            child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.center,
                                runSpacing: 3.0,
                                spacing: 3.0,
                                children:
                                    List.generate(timeslotDate.length, (index) {
                                  setState(() {
                                    setID = index;
                                  });
                                  return txtTime(setID, false,
                                      '${timeslotDate[index]} น.');
                                })),
                          ),
                          SizedBox(height: 20),
                          Visibility(
                            visible: _ckVisittime,
                            child: Text(
                              'เบอร์ติดต่อ',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _ckVisittime,
                            child: FormBuilderTextField(
                              controller: Phonecall,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              name: 'phone',
                              style: GoogleFonts.kanit(fontSize: 14),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      'images/phone.png',
                                      alignment: Alignment.center,
                                      scale: 1.3,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: 'เบอร์โทรศัพท์',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: false),
                            ),
                          ),
                          Visibility(
                            visible: _ckVisittime,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  phoneSet = Phonecall.text;
                                  if (btck == 404) {
                                    showGeneralDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        barrierLabel:
                                            MaterialLocalizations.of(context)
                                                .modalBarrierDismissLabel,
                                        barrierColor: Colors.transparent,
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (BuildContext context,
                                                Animation frist,
                                                Animation second) =>
                                            MSGBoxWidget(
                                              title: 'กรุณาระบุเวลานัดหมาย',
                                              detail: '',
                                            ));
                                  } else if (phoneSet.length < 10) {
                                    showGeneralDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        barrierLabel:
                                            MaterialLocalizations.of(context)
                                                .modalBarrierDismissLabel,
                                        barrierColor: Colors.transparent,
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (BuildContext context,
                                                Animation frist,
                                                Animation second) =>
                                            MSGBoxWidget(
                                              title: 'กรุณาระบุเบอร์โทรศัพท์',
                                              detail: '',
                                            ));
                                  } else {
                                    showGeneralDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        barrierLabel:
                                            MaterialLocalizations.of(context)
                                                .modalBarrierDismissLabel,
                                        barrierColor: Colors.transparent,
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (BuildContext context,
                                                Animation frist,
                                                Animation second) =>
                                            CustomDialog());
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffE6EFFE),
                                  gradient: btck == 404
                                      ? LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.grey[100],
                                            Colors.grey[100]
                                          ],
                                        )
                                      : LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff0088C6),
                                            Color(0xff43CEF8)
                                          ],
                                        ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    postpone == true
                                        ? 'เลื่อนนัดหมาย'
                                        : 'นัดหมาย',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: btck == 404
                                          ? Colors.grey
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }

  Container txtTime(int id, bool ckStatus, String txt) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.5,
      child: GestureDetector(
        onTapCancel: () {},
        onTap: () {
          setState(() {
            if (ckStatus == true) {
            } else {
              btck = id;
              print("_currentDate : ${_currentDate}");
              print("btck : ${timeslotDate[btck]}");

              xx =
                  '${convertDateTimeDisplay_YMD(_currentDate.toString())} ${timeslotDate[btck]}';
              print(xx);
              showTime = ' ${timeslotDate[btck]}';
              showDay = '${convertDateTimeDisplay(_currentDate.toString())}';
            }
          });
        },
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              border: ckStatus == true
                  ? Border.all(color: Colors.transparent)
                  : btck == id
                      ? Border.all(color: Colors.blue)
                      : Border.all(color: Colors.grey.shade200),
              color: ckStatus == true
                  ? Colors.red[100]
                  : btck == id
                      ? Colors.blue
                      : Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 2, right: 2),
            margin: EdgeInsets.all(2),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                txt,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ckStatus == true
                        ? Colors.red
                        : btck == id
                            ? Colors.white
                            : Colors.black),
              ),

              // bt2 == false
              //     ? Colors.red
              //     : btck == 2
              //         ? Colors.white
              //         : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Expanded customDay(weekday) {
    return Expanded(
        child: Text(
      weekday == 0
          ? 'อา.'
          : weekday == 1
              ? 'จ.'
              : weekday == 2
                  ? 'อ.'
                  : weekday == 3
                      ? 'พ.'
                      : weekday == 4
                          ? 'พฤ.'
                          : weekday == 5
                              ? 'ศ.'
                              : 'ส.',
      textAlign: TextAlign.center,
      style: TextStyle(),
    )

        //

        );
  }
}

class CustomDialog extends StatefulWidget {
  CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int _selected = 0;
  bool value;
  ValueChanged<bool> onChanged;
  @override
  initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
    _character = SingingCharacter.buse01;
    _characterCD = SingingCharacterCD.have;
    _characterV2 = SingingCharacterV.have;
    setState(() {
      _selected = 1;
      _Checkcharacter = 1;
    });
  }

  Future<List<RightsAPI>> RightsAPIDatas;

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
      dt = DateTime.parse(xx);
      print(dt);
      print("ID_postpone ${ID_postpone}");
      RightsAPIData = APIRightsGET();
    });
  }

  Future<void> postappointment(
      {String pid_api,
      DateTime datetime,
      int location,
      int right_id,
      int have_doc,
      int have_cd}) async {
    var url = '${apiurl().url}/appointment';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token}',
      },
      body: jsonEncode(<String, String>{
        "pid": "${pid_api}",
        "datetime": "${datetime}",
        "location_id": "${location}",
        "right_id": "${right_id}",
        "have_doc": "${have_doc}",
        "have_cd": "${have_cd}",
      }),
    );

    if (response.statusCode == 200) {
      jsonResappointment = convert.jsonDecode(response.body);
      print(jsonResappointment);
      print('APITURE statusCode:' + response.statusCode.toString());
      setState(() {
        Navigator.pop(context);
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder:
                (BuildContext context, Animation frist, Animation second) =>
                    SuscesDialog());
      });
    } else if (response.statusCode == 401) {
      print('APITURE Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      print("${pid_api} ${datetime} ${location} ${right_id}");
      print('APITURE Getcid : ${response.statusCode}');
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

  Future<void> put_postpone(
      {String pid_api,
      DateTime datetime,
      int location,
      int right_id,
      int have_doc,
      int have_cd}) async {
    var url = '${apiurl().url}/appointment/${pid_api}';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token}',
      },
      body: jsonEncode(<String, String>{
        "datetime": "${datetime}",
        "location_id": "${location}",
        "right_id": "${right_id}",
        "have_doc": "${have_doc}",
        "have_cd": "${have_cd}",
      }),
    );

    if (response.statusCode == 200) {
      jsonResappointment = convert.jsonDecode(response.body);

      print('APITURE statusCode:' + response.statusCode.toString());
      setState(() {
        Navigator.pop(context);
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder:
                (BuildContext context, Animation frist, Animation second) =>
                    SuscesDialog());
      });
    } else if (response.statusCode == 401) {
      print('APITURE Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      print('APITURE Getcid : ${response.statusCode}');

      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

  Future<List<RightsAPI>> RightsAPIData;
  Future<List<RightsAPI>> APIRightsGET() async {
    var url = '${apiurl().url}/rights';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token}',
      },
    );
    if (response.statusCode == 200) {
      print('RightsAPI  : ${response.statusCode}');
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => new RightsAPI.fromJson(data)).toList();
    } else if (response.statusCode == 401) {
      print('RightsAPI  : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      print('RightsAPI  : ${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    // print(height);
    return Visibility(
      visible: !page1,
      child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                      margin: EdgeInsets.only(top: 80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'สิทธิการรักษา และค่าบริการตรวจ',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                              child: Column(
                            children: [
                              FutureBuilder<List<RightsAPI>>(
                                future: RightsAPIData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<RightsAPI> data = snapshot.data;

                                    return ListView.separated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 1,
                                        );
                                      },
                                      controller: ScrollController(),
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            Transform.scale(
                                              scale: 1,
                                              child: Radio(
                                                activeColor: Color(0xff0088C6),
                                                value: data[index].id,
                                                groupValue: _selected,
                                                onChanged: (int value) {
                                                  print(value);
                                                  setState(() {
                                                    _selected = value;
                                                    _Checkcharacter = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              '${data[index].name}',
                                              style: GoogleFonts.kanit(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            )),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
                            ],
                          )),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse01,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 1;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิเบิกจ่ายตรง กรมบัญชีกลาง',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse02,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;

                          //             _Checkcharacter = 2;
                          //             print(value);
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิเบิกราชการอื่นๆ',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse03,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 3;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิประกันสังคม (รพ.ศิริราช)',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse04,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 4;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิประกันสังคม (รพ.อื่น)',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse05,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 5;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (รพ.ศิริราช)',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse06,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 6;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (รพ.อื่น)',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Transform.scale(
                          //       scale: 1,
                          //       child: Radio<SingingCharacter>(
                          //         activeColor: Color(0xff0088C6),
                          //         value: SingingCharacter.buse07,
                          //         groupValue: _character,
                          //         onChanged: (SingingCharacter value) {
                          //           setState(() {
                          //             _character = value;
                          //             _Checkcharacter = 7;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     Expanded(
                          //         child: Text(
                          //       'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (สิทธิว่าง)',
                          //       style: GoogleFonts.kanit(
                          //         fontSize: 14,
                          //         color: Colors.grey,
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ค่าบริการ',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '1. ค่าบริการ 160 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '2. ค่าเอ็กซ์เรย์ 999 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '3. ค่ายารักษา 999 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'เอกสารที่เกี่ยวข้อง',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ใบส่งตรวจวินิจฉัย',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterV>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterV.have,
                                  groupValue: _characterV2,
                                  onChanged: (SingingCharacterV valueV) {
                                    setState(() {
                                      _characterV2 = valueV;
                                      _CheckcharacterV2 = 0;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterV>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterV.donthave,
                                  groupValue: _characterV2,
                                  onChanged: (SingingCharacterV valueV) {
                                    setState(() {
                                      _characterV2 = valueV;
                                      _CheckcharacterV2 = 1;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'ไม่มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ผลการตรวจ, CD โรงพยาบาลอื่น',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterCD>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterCD.have,
                                  groupValue: _characterCD,
                                  onChanged: (SingingCharacterCD valueV) {
                                    setState(() {
                                      _characterCD = valueV;
                                      _CheckcharacterCD = 0;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterCD>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterCD.donthave,
                                  groupValue: _characterCD,
                                  onChanged: (SingingCharacterCD valueV) {
                                    setState(() {
                                      _characterCD = valueV;
                                      _CheckcharacterCD = 1;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'ไม่มี',
                                  style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // height: 100,
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                if (postpone == true) {
                                  put_postpone(
                                      pid_api: ID_postpone.toString(),
                                      datetime: dt,
                                      location: 1,
                                      right_id: _Checkcharacter,
                                      have_cd: _CheckcharacterCD,
                                      have_doc: _CheckcharacterV2);
                                } else {
                                  postappointment(
                                      pid_api: pid_x,
                                      datetime: dt,
                                      location: 1,
                                      right_id: _Checkcharacter,
                                      have_cd: _CheckcharacterCD,
                                      have_doc: _CheckcharacterV2);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffE6EFFE),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff0088C6),
                                        Color(0xff43CEF8)
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    postpone == true
                                        ? 'เลื่อนนัดหมาย'
                                        : 'นัดหมาย',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigagitonBar()),
    );
  }
}

class SuscesDialog extends StatefulWidget {
  SuscesDialog({Key key}) : super(key: key);

  @override
  _SuscesDialogState createState() => _SuscesDialogState();
}

class _SuscesDialogState extends State<SuscesDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/estimate.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              postpone == true
                                  ? "เลื่อนตรวจสำเร็จ"
                                  : "นัดตรวจสำเร็จ",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'ชื่อ-สกุล',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${jsonResappointment['patient']['name']}  ${jsonResappointment['patient']['surname']}',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'ID No.',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${jsonResappointment['id']}',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'HN',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${jsonResappointment['patient']['hn']}',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'วันที่',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${showDay}',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'เวลา',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${showTime}',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'เอกสารที่เกี่ยวข้อง',
                                style: GoogleFonts.kanit(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '1.ใบส่งตรวจวินิจฉัย (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '2.ผลการตรวจ , CD โรงพยาบาลอื่น (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '3.เอกสารรับรองสิทธิการรักษา (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '4.เอกสารการเปลี่ยนชื่อ - สกุล (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '5.บัตรประจำตัวประชาชน',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       Navigator.pop(context);
                            //     });
                            //   },
                            //   child: Text(
                            //     "แก้ไขวันนัดหมาย",
                            //     style: GoogleFonts.kanit(
                            //         fontWeight: FontWeight.w500,
                            //         color: Color(0xff0088C6),
                            //         fontSize: 16),
                            //   ),
                            // ),

                            //ปุ่ม

                            GestureDetector(
                              //หน้ายิงยังผิด
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: dating_page()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffE6EFFE),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff0088C6),
                                        Color(0xff43CEF8)
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'เสร็จสิ้น',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);
        // showGeneralDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     barrierLabel:
        //         MaterialLocalizations.of(context).modalBarrierDismissLabel,
        //     barrierColor: Colors.transparent,
        //     transitionDuration: Duration(milliseconds: 200),
        //     pageBuilder:
        //         (BuildContext context, Animation frist, Animation second) =>
        //             detaildonate_pages());
        return true;
      });
  BoxShadow BoxShadow1(double _offset1, _offset2, _blur, _spread) {
    return BoxShadow(
      color: Colors.blue[100],
      offset: Offset(
        _offset1,
        _offset2,
      ),
      blurRadius: _blur,
      spreadRadius: _spread,
    );
  }

  BoxShadow BoxShadow2() {
    return BoxShadow(
      color: Colors.white,
      offset: const Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    );
  } //BoxShadow

}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay_YMD(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

// if (absentDates.length > 0) {
//   for (int x = 0; x < len; x++) {
//     _markedDateMap.add(
//       absentDates[x],
//       new Event(
//         date: absentDates[x],
//         title: absentDates[x].toString(),
//         icon: _absentIcon(
//           absentDates[x].day.toString(),
//         ),
//       ),
//     );
//   }
// }

// if (absentDates != null) {
//   for (int i = 0; i < len; i++) {
//     _markedDateMap.add(
//       absentDates[i],
//       new Event(
//         date: absentDates[i],
//         title: absentDates[i].toString(),
//         icon: _absentIcon(
//           absentDates[i].day.toString(),
//         ),
//       ),
//     );
//   }
// }
// var holiday = min(scheduleDate?.length,
//     scheduleDate.length);
// for (int i = 0; i < holiday; i++) {
//   if (scheduleDate[i].isHoliday == true) {
//     print(scheduleDate[i].date);
//     _markedDateMap.add(
//         scheduleDate[i].date,
//         Event(
//             title: scheduleDate[i].toString(),
//             date: scheduleDate[i].date,
//             icon: _absentIcon(
//               scheduleDate[i]
//                   .date
//                   .day
//                   .toString(),
//             )));
//   }
// }
