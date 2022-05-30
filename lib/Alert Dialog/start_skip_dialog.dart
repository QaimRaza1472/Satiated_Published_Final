import 'package:flutter/material.dart';
import 'package:satiated_life/Theme/color.dart';

///////////////////////////////////////////        ////////////////////////////////////////////

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 390,

          height: height1 * 0.7,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: kwhite,
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
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      size: 32,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width1 * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Pointer Landed On:",
                      style: TextStyle(
                        color: kblack,
                        fontFamily: "Rene Bieder",
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "A",
                          style: TextStyle(
                            color: kblack,
                            fontFamily: "Rene Bieder",
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Stand For ",
                          style: TextStyle(
                            color: kblack,
                            fontFamily: "Rene Bieder",
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          "Activity",
                          style: TextStyle(
                            color: kblack,
                            fontFamily: "Rene Bieder",
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Definition:",
                          style: TextStyle(
                            color: kblack,
                            fontFamily: "Rene Bieder",
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          style: TextStyle(
                            color: kblack,
                            fontFamily: "Rene Bieder",
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height1 * 0.023,
                    ),
                    Container(
                      height: 3,
                      width: width1 * 0.9,
                      color: kblack,
                    ),
                    SizedBox(
                      height: height1 * 0.023,
                    ),
                    Text(
                      "Before Putting intentions Would Like to Do Mediated ?",
                      style: TextStyle(
                        color: kblack,
                        fontFamily: "Rene Bieder",
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/male/2.png",
                        scale: 2.7,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: kblack,
                          fontFamily: "Rene Bieder",
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Meditation",
                        style: TextStyle(
                          color: kblack,
                          fontFamily: "Rene Bieder",
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/female/2.png",
                        scale: 2.7,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: kblack,
                          fontFamily: "Rene Bieder",
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Meditation",
                        style: TextStyle(
                          color: kblack,
                          fontFamily: "Rene Bieder",
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
