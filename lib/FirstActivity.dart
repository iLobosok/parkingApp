/*
MIT License

Copyright (c) 2018 Liu Yanbo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Copyright 2020 Ahmet Burak Ozyurt

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/
/*Copyright 2020 Mudassir

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.*/

import 'dart:ui';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class FirstActivity extends StatefulWidget {
  int val=0;
  @override
  First createState() => First();
}


class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text('Done!'),
    backgroundColor: Colors.lightGreen,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
        label: 'Done',
        textColor: Colors.white,
        onPressed: () {
          print('Done pressed!');
        }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}


class First extends State<FirstActivity> {
   final scaffoldKey = GlobalKey<ScaffoldState>();
    GoogleMapController mapController;

   final LatLng _center = const LatLng(45.521563, -122.677433);

   void _onMapCreated(GoogleMapController controller) {
     mapController = controller;
   }
   @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF2D2D2D),
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add  place',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFF9F5F5),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                  child:SizedBox(
                  height: 25,
                width: 128,
                child:FlutterToggleTab(
                  width: 40,
                  borderRadius: 15,
                  initialIndex:0,
                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  unSelectedTextStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  labels: ["",""],
                  icons: [Icons.attach_money,Icons.euro],
                  selectedLabelIndex: (index) {
                    print("Selected Index $index");
                  },
              ),),),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: Row(
                      mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Timer',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                           DatePicker.showDatePicker(context,
                           showTitleActions: true,
                           minTime: DateTime(2021, 1, 30),
                           maxTime: DateTime(2021, 12, 31), onChanged: (date) {
                           print('change $date');
                           }, onConfirm: (date) {
                           print('confirm $date');
                           }, currentTime: DateTime.now(), locale: LocaleType.en);
                           },
                          child:Icon(Icons.access_time_outlined, color:Colors.white)
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Floor',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child:SizedBox(
                  width: 80,
                  height: 30,
                  child:StepperSwipe(
                    initialValue:0,
                    speedTransitionLimitCount: 3,
                    firstIncrementDuration: Duration(milliseconds: 300),
                    secondIncrementDuration: Duration(milliseconds: 100),
                    direction: Axis.horizontal,
                    dragButtonColor: Colors.blueAccent,
                    withSpring: true,
                    maxValue:59,
                    minValue:1,
                    withFastCount: true,
                    stepperValue:widget.val,
                    onChanged: (int val) => print('New value : $val'),
                  ),),),
              ],)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                                child:SizedBox(
                                  width: 80,
                                  height: 30,
                                  child:StepperSwipe(
                                    initialValue:0,
                                    speedTransitionLimitCount: 3,
                                    firstIncrementDuration: Duration(milliseconds: 300),
                                    secondIncrementDuration: Duration(milliseconds: 100),
                                    direction: Axis.horizontal,
                                    dragButtonColor: Colors.blueAccent,
                                    withSpring: true,
                                    maxValue:59,
                                    minValue:1,
                                    withFastCount: true,
                                    stepperValue:widget.val,
                                    onChanged: (int val) => print('New value : $val'),
                                  ),),),
                            ],)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child:Container(
                                height: 100,
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: GoogleMap(
                                  onMapCreated: _onMapCreated,
                                  initialCameraPosition: CameraPosition(
                                    target: _center,
                                    zoom: 11.0,
                                  ),
                                  ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              /*Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Button',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0xFFF8C03B),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 15,
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}