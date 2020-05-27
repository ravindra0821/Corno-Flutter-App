import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterlearningapp/colors.dart';
import 'package:flutterlearningapp/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'latest_cases_bean.dart';
import 'network/global.dart';
import 'network/rest_data_source.dart';

class  HomePageScreen extends StatefulWidget {
  var selectedCountry = "INDIA";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageScreen();
  }
}

class _HomePageScreen extends State<HomePageScreen> implements ApiResponse {
  var _showLoader = false;
  RestDatasource api;

  List<Regional> _latestCases = new List<Regional>();


  var totalConfirmStr="",totalActiveStr="",totalRecoverStr="",totalDeathStr="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    api = new RestDatasource(this);

    ////CALL GET LATEST CASES API
    callLatestCasesApi();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.TEXT_BLACK,
        title: Text(
          "CORONA-19 TRACKER (RAVI)",
          textAlign: TextAlign.center,
        ),
        leading: new Container(),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.139,
              child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 10.0,
                  color: ColorConst.ORANGE_LIGHT_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      side: BorderSide(
                          width: 1, color: ColorConst.ORANGE_LIGHT_COLOR)),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Let's pray together to fight against the virus..Hey lord Govind help us, We are all your childerns.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: ColorConst.ORANGE_DARK_COLOR,
                                fontFamily: StringConst.FONT_BOLD),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Radhe Radhe🙏 🙏 ",
                              style: TextStyle(
                                  fontFamily: StringConst.FONT_BOLD,
                                  fontSize: 16.0,
                                  color: ColorConst.ORANGE_DARK_COLOR),
                            ),
                          ),
                        ],
                      ))),
            ),
            SizedBox(
              height: 1.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.transparent,
                            child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorConst.LIGHT_RED_COLOR,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CONFIRM",
                                          style: TextStyle(
                                              color: ColorConst.DAR_RED_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_BOLD),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          totalConfirmStr,
                                          style: TextStyle(
                                              color: ColorConst.DAR_RED_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_SEMI_BOLD),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.transparent,
                            child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorConst.LIGHT_BLUE_COLOR,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ACTIVE",
                                          style: TextStyle(
                                              color: ColorConst.DARK_BLUE_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_BOLD),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          totalActiveStr,
                                          style: TextStyle(
                                              color: ColorConst.DARK_BLUE_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_SEMI_BOLD),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.transparent,
                            child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorConst.LIGHT_GREEN_COLOR,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "RECOVER",
                                          style: TextStyle(
                                              color:
                                                  ColorConst.DARK_GREEN_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_BOLD),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          totalRecoverStr,
                                          style: TextStyle(
                                              color:
                                                  ColorConst.DARK_GREEN_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_SEMI_BOLD),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.transparent,
                            child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorConst.LIGHT_BLACK_COLOR,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "DEATH",
                                          style: TextStyle(
                                              color:
                                                  ColorConst.DARK_BLACK_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_BOLD),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                         totalDeathStr,
                                          style: TextStyle(
                                              color:
                                                  ColorConst.DARK_BLACK_COLOR,
                                              fontFamily:
                                                  StringConst.FONT_SEMI_BOLD),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorConst.DARK_BLACK_COLOR,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.59,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: _latestCases.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                child: new Container(
                                    decoration: new BoxDecoration(
                                      color: ColorConst.LIGHT_TEXT_COLOR,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0, left: 10.0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              _latestCases[index].loc,
                                              style: TextStyle(
                                                  color: ColorConst
                                                      .DARK_BLACK_COLOR,
                                                  fontFamily:
                                                      StringConst.FONT_BOLD),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 15.0),
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.115,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "CONFIRM",
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DAR_RED_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_BOLD),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          _latestCases[index]
                                                              .totalConfirmed
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DAR_RED_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_SEMI_BOLD),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.115,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "ACTIVE",
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_BLUE_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_BOLD),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          (_latestCases[index]
                                                                      .totalConfirmed -
                                                                  (_latestCases[
                                                                              index]
                                                                          .deaths +
                                                                      _latestCases[
                                                                              index]
                                                                          .discharged))
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_BLUE_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_SEMI_BOLD),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.115,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "RECOVER",
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_GREEN_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_BOLD),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          _latestCases[index].discharged.toString(),
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_GREEN_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_SEMI_BOLD),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.115,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "DEATH",
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_BLACK_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_BOLD),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            _latestCases[index].deaths
                                                                .toString(),
                                                          style: TextStyle(
                                                              color: ColorConst
                                                                  .DARK_BLACK_COLOR,
                                                              fontFamily:
                                                                  StringConst
                                                                      .FONT_SEMI_BOLD),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 4.0,
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /*
   * Call Get Help API
   */
  Future<void> callLatestCasesApi() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          _showLoader = true;

          api.apiForGet(
              RestDatasource.LATEST_CASES_API, RestDatasource.LATEST_CASES_API);
        });
      }
    } on SocketException catch (_) {
      setState(() {
        _showLoader = false;
      });
      GlobalUtil.showToast(
          null, StringConst.NO_INTERNET_CONNECTION, Toast.LENGTH_SHORT);
    }
  }

  @override
  void onError(String errorTxt) {
    setState(() {
      _showLoader = false;
      GlobalUtil.showToast(context, errorTxt, Toast.LENGTH_SHORT);
    });
  }

  @override
  void onSuccess(response, String eventType) {
    final jsonResponse = json.decode(response);
    setState(() {
      _showLoader = false;
    });
    if (eventType == RestDatasource.LATEST_CASES_API) {
      LatestCases latestCases = new LatestCases.fromJson(jsonResponse);
      setState(() {
/*
        "total":7529,
        "confirmedCasesIndian":7458,
        "confirmedCasesForeign":71,
        "discharged":653,
        "deaths":242,
        "confirmedButLocationUnidentified":0*/

        totalConfirmStr= latestCases.data.summary.total.toString();
        totalActiveStr= (latestCases.data.summary.total-(latestCases.data.summary.discharged+
          latestCases.data.summary.deaths)).toString();
        totalRecoverStr= latestCases.data.summary.discharged.toString();
        totalDeathStr= latestCases.data.summary.deaths.toString();

        _latestCases.addAll(latestCases.data.regional);
      });
    }
  }
}
