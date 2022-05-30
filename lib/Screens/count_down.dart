import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Models/previousmeditation.dart';
import 'package:satiated_life/Theme/color.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wakelock/wakelock.dart';

import 'Journal/journal_page.dart';
import 'add_your_intention.dart';

class CountDown extends StatefulWidget {
  final String musicfile;
  final int min;
  final String image;
  final String uid;
  final String isWheel;
  final String wheelhead;
  CountDown(this.musicfile, this.min, this.image, this.uid, this.isWheel,
      this.wheelhead);
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  _filesDialog2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //width: 350,
                            height: 250,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: kwhite,
                              //color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.cancel_outlined,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/congratulation.png",
                              scale: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Congratulations",
                                style: TextStyle(
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "You have completed your Meditation ",
                                style: TextStyle(
                                    color: kblack,
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JournalPage(widget.uid)));
                                },
                                child: Container(
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color: kblue_1,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Continue",
                                        style: TextStyle(
                                          color: kwhite,
                                          fontFamily: "Rene Bieder",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  _filesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //width: 350,
                            height: 250,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: kwhite,
                              //color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.cancel_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/congratulation.png",
                              scale: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Congratulations",
                                style: TextStyle(
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "You have completed your Meditation ",
                                style: TextStyle(
                                    color: kblack,
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddYourIntention(widget.uid,
                                                  widget.wheelhead)));
                                },
                                child: Container(
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color: kblue_1,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Continue",
                                        style: TextStyle(
                                          color: kwhite,
                                          fontFamily: "Rene Bieder",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  //////////////////////////////////////////////////////////////// Counter  Code  //////////////////////////////////////////////
  List<PreviousMeditationGET> intention_data;
  DbHelper db = new DbHelper();
  Future<void> get() async {
    intention_data = await db.getmeditation();
    setState(() {});
  }

  void insertMeditation() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy – h:mm a');
    String formattedDate = formatter.format(now);
    final list =
        PreviousMeditation(widget.image, formattedDate, '0', widget.uid);
    await db.insertPreviousmeditation(list);
  }

  void updateMeditation() async {
    await get();
    await db.updateMeditation(intention_data.length, '1');
  }

  int _seconds = 00;
  int _minutes;
  int isPlay = 0;

  Timer _timer;
  var f = NumberFormat("00");

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _seconds = 0;
      _minutes = widget.min;
      pauseMusic();
      audioPlayer.release();
    }
  }

  void _startTimer() {
    playMusic();
    if (_timer != null) {
      _stopTimer();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() async {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print("Timer Complete");
            await updateMeditation();
            pauseMusic();
            isPlay = 0;
            audioPlayer.release();
            if (widget.isWheel == "1") {
              _filesDialog(context);
            } else {
              _filesDialog2(context);
            }
          }
        }
      });
    });
  }

  //////////////////////////////////////////////////////////////// Counter Code End ////////////////////////////////////////

  ///////////////////////////////////////////////////////   Audio Player Code   ///////////////////////////////////////////////
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  // String filePath = "some body's me.mp3";

  String filePath;

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  /// Optional
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: (timeProgress / 1000).floorToDouble(),
          max: (audioDuration / 1000).floorToDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    filePath = widget.musicfile;
    // filePath =
    //     'https://raagjatt.net/songsm/128/40609/Hai%20Kahan%20Ka%20Irada%20(RaagJatt.com).mp3';
    _minutes = widget.min;
    Wakelock.enable(); // or Wakelock.toggle(on: true);
    super.initState();

    /// Compulsory
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    /// Optional
    audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    await audioPlayer.play(filePath, isLocal: false);
//    await audioCache.loop(filePath);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }

  /// Optional
  Future<int> _getAudioDuration() async {
    File audioFile = await audioCache.load(filePath);
    await audioPlayer.setUrl(
      audioFile.path,
    );

    audioDuration = await Future.delayed(
      Duration(seconds: 2),
      () => audioPlayer.getDuration(),
    );

    return audioDuration;
  }

  /// Optional
  Widget getLocalFileDuration() {
    return FutureBuilder<int>(
      future: _getAudioDuration(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Waiting...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Text(getTimeString(snapshot.data));
        }
        return null; // unreachable
      },
    );
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  /// Optional
  String getTimeString(int milliseconds) {
    if (milliseconds == null) milliseconds = 0;
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

//////////////////////////////////////////////////////// Audio Player Code End   ////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        backgroundColor: kblue_2,
        elevation: 0,
      ),
      body: Container(
        height: height1,
        width: width1,
        color: kblue_2,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: width1 * 0.19),
                child: Column(
                  children: [
                    FadeAnimation(
                      1,
                      Text(
                        "Count Down ",
                        style: TextStyle(
                          fontFamily: "Rene Bieder",
                          color: kwhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.04),
                      child: FadeAnimation(
                        1.1,
                        Container(
                          height: 81,
                          width: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            //color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage(widget.image),
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //////////////////////////////////////////////////////// Count Down Watch  //////////////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.09),
                      child: Container(
                        height: 240,
                        width: 240,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "assets/count_down.png",
                                scale: 1.5,
                              ),
                            ),
                            Positioned(
                              top: 116,
                              left: 62,
                              child: FadeAnimation(
                                1.2,
                                Text(
                                  "${f.format(_minutes)} : ${f.format(_seconds)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                    fontFamily: "Rene Bieder",
                                    color: kwhite,
                                    //color: Colors.yellow
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //////////////////////////////////////////////////////// Count Down Watch  //////////////////////////////////////

                    //////////////////////////////////////////////////////// Audio Player   //////////////////////////////////////
                    // GestureDetector(
                    //   onTap: () async {
                    //     // audioPlayerState == AudioPlayerState.PLAYING
                    //     //  ? pauseMusic()
                    //     //:
                    //     playMusic();
                    //     await insertMeditation();
                    //     setState(() {});
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: width1 * 0.04),
                    //     child: Container(
                    //       height: 50,
                    //       width: 70,
                    //       decoration: BoxDecoration(
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey.withOpacity(0.3),
                    //             spreadRadius: 2,
                    //             blurRadius: 5,
                    //             offset: Offset(0, 2),
                    //           ),
                    //         ],
                    //         color: Color(0xFFFFFFFFF),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           FadeAnimation(
                    //             1.3,
                    //             Icon(
                    //               audioPlayerState == AudioPlayerState.PLAYING
                    //                   //? Icons.pause_rounded
                    //                   //: Icons.play_arrow_rounded,
                    //                   ? Icons.volume_off
                    //                   : Icons.volume_down,
                    //               color: kblue_1,
                    //               size: 32,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //////////////////////////////////////////////////////// Audio Player End  //////////////////////////////////////
                  ],
                ),
              ),

              ///////////////////////////////////////////////////////////  Row of Start / Stop Button       ///////////////////////////////////////////
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width1 * 0.14),
                child: FadeAnimation(
                  1.4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // audioPlayerState == AudioPlayerState.PLAYING
                          //  ? pauseMusic()
                          //:
                          setState(() async {
                            if (isPlay == 0) {
                              playMusic();
                              await insertMeditation();
                              _startTimer();
                              isPlay = 1;
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: width1 * 0.04),
                          child: Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              //color: Color(0xFFFFFFFFF),
                              color:
                                  // audioPlayerState == AudioPlayerState.PLAYING
                                  //     ?
                                  Color(0xFFFFFFFFF),
                              //: kblue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeAnimation(
                                  1.3,
                                  Icon(
                                    //audioPlayerState == AudioPlayerState.PLAYING
                                    //?
                                    //Icons.pause_rounded, //:
                                    Icons.play_arrow_rounded,
                                    //? Icons.volume_off
                                    //: Icons.volume_down,
                                    color: audioPlayerState ==
                                            AudioPlayerState.PLAYING
                                        ? Colors.redAccent
                                        : kblue_1,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() async {
                      //       if (isPlay == 0) {
                      //         playMusic();
                      //         await insertMeditation();
                      //         _startTimer();
                      //         isPlay == 1;
                      //       }
                      //     });
                      //   },
                      //   child: Icon(
                      //     audioPlayerState == AudioPlayerState.PLAYING
                      //         //? Icons.pause_rounded
                      //         //: Icons.play_arrow_rounded,
                      //         ? Icons.volume_off
                      //         : Icons.volume_down,
                      //     color: kblue_1,
                      //     size: 32,
                      //   ),
                      //   // Image.asset(
                      //   //   "assets/Play Icon.png",
                      //   //   scale: 3.5,
                      //   // ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          isPlay = 0;
                          setState(() {
                            _stopTimer();
                          });
                        },
                        child: Image.asset(
                          "assets/Stop Icon.png",
                          scale: 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///////////////////////////////////////////////////////////  Row of Start / Stop Button  End  ///////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
