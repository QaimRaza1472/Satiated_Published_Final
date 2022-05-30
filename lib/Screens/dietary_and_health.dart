import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Screens/task_wheel.dart';
import 'package:satiated_life/Theme/color.dart';

class DietaryAndHealth extends StatefulWidget {
  final String heading;
  final String defination;
  final String imageurl;
  final String uid;

  DietaryAndHealth(this.heading, this.defination, this.imageurl, this.uid);

  @override
  _DietaryAndHealthState createState() => _DietaryAndHealthState();
}

class _DietaryAndHealthState extends State<DietaryAndHealth> {
  final typehere = TextEditingController();
  @override
  void initState() {
    typehere.text = widget.defination;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 38,
          backgroundColor: kblue_1,
          elevation: 0,
        ),
        body: WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskWheel(widget.uid)),
        );

        return true;
      },
      child: Container(
        height: height1,
        width: width1,
        color: kblue_1,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ///////////////////////////////////////////////////       Top Image Container    ///////////////////////////////////////////////
              Container(
                height: width1 * 0.54,
                width: width1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.imageurl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              ///////////////////////////////////////////////////       Top Image Container  End    ///////////////////////////////////////////////

              SizedBox(
                height: width1 * 0.07,
              ),
              FadeAnimation(
                1,
                Text(
                  widget.heading,
                  style: TextStyle(
                    fontFamily: "Rene Bieder",
                    color: kwhite,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: width1 * 0.05,
              ),

              /////////////////////////////////////////////////////////////////  How do you fee container     ///////////////////////////////
              Container(
                  height: width1 * 0.81,
                  width: width1 * 0.95,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: kblue_1,
                    border: Border.all(
                      width: 1.7,
                      color: kwhite,
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 0, top: 0),
                      child: FadeAnimation(
                        1.1,
                        Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: width1 * 0,
                                ),
                                child: Container(
                                  height: width1 * 0.75,
                                  width: width1 * 0.92,
                                  padding: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.grey.withOpacity(0.3),
                                  //       spreadRadius: 3,
                                  //       blurRadius: 3,
                                  //       offset: Offset(0, 2),
                                  //     ),
                                  //   ],
                                  //   color: kblue_1,
                                  //   borderRadius: BorderRadius.circular(15),
                                  //   border: Border.all(
                                  //     width: 1.3,
                                  //     color: kwhite,
                                  //   ),
                                  // ),
                                  child: FadeAnimation(
                                    1.2,
                                    TextFormField(
                                      readOnly: true,
                                      controller: typehere,
                                      cursorColor: kwhite,
                                      maxLines: 8,
                                      style: TextStyle(
                                        color: kwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Rene Bieder",
                                        letterSpacing: 1.1,
                                      ),
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Type Here...",
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: kwhite,
                                          fontFamily: "Rene Bieder",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //     Container(
                              //       height: 7,
                              //       width: 7,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle, color: kwhite),
                              //     ),
                              //     SizedBox(
                              //       width: width1 * 0.02,
                              //     ),
                              //     Text(
                              //       widget.defination,
                              //       style: TextStyle(
                              //         fontFamily: "Rene Bieder",
                              //         color: kwhite,
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 2,),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 7,
                              //       width: 7,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: kwhite
                              //       ),
                              //     ),
                              //     SizedBox(width: width1*0.02,),
                              //     Text("Are you meeting your nutritional needs?",
                              //       style: TextStyle(
                              //         color: kwhite,
                              //         fontFamily: "Rene Bieder",
                              //           fontSize: 16
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 2,),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 7,
                              //       width: 7,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: kwhite
                              //       ),
                              //     ),
                              //     SizedBox(width: width1*0.02,),
                              //     Text("Do you want to cook at home more?",
                              //       style: TextStyle(
                              //         fontFamily: "Rene Bieder",
                              //         color: kwhite,
                              //           fontSize: 16
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              // Padding(
                              //   padding:  EdgeInsets.only(left:width1*0.04,top:2,),
                              //   child: Text("Perhaps you want to prepare more of your meals at home  or just be more adventurous with food. ",
                              //     style: TextStyle(
                              //       color: kwhite,
                              //       fontFamily: "Rene Bieder",
                              //         fontSize: 16,
                              //     ),
                              //   ),
                              // ),

                              // Padding(
                              //   padding:  EdgeInsets.only(left:width1*0.04,top: 2),
                              //   child: Text("What are some goals you'd like to set for yourself to get closer to feeling fully satisfied?",
                              //     style: TextStyle(
                              //       color: kwhite,
                              //       fontFamily: "Rene Bieder",
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ]),
                        //            ),
                        //            ),
                        /////////////////////////////////////////////////////////////////  How do you fee container End    ///////////////////////////////
                      )))
            ],
          ),
        ),
      ),
    ));
  }
}
