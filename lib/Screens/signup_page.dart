import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height1,
        width: width1,
        color: kblue_2,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///////////////////////////////////////////    Logo      ////////////////////////////
              FadeAnimation(
                1,
                Image.asset(
                  'assets/images/logo.png',
                  scale: 1.7,
                ),
              ),
              ////////////////////////////////////////////  End       //////////////////////////////

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /////////////////////////////////////////// Login With Google Button ///////////////////////
                  Container(
                    height: 52,
                    width: width1 * 0.9,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: kwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width1 * 0.09),
                      child: FadeAnimation(
                        1.2,
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/google.png",
                              scale: 6,
                            ),
                            SizedBox(
                              width: width1 * 0.05,
                            ),
                            Text(
                              "Sign up With Google",
                              style: TextStyle(
                                fontFamily: "Rene Bieder",
                                color: kblack,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////////////////////          End             ///////////////////////

                  SizedBox(
                    height: width1 * 0.05,
                  ),

                  /////////////////////////////////////////// Login With FaceBook  Button   ///////////////////////
                  Container(
                    height: 52,
                    width: width1 * 0.90,
                    decoration: BoxDecoration(
                      color: kfacebook,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width1 * 0.09),
                      child: FadeAnimation(
                        1.3,
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/fb_1.png",
                              scale: 6,
                            ),
                            SizedBox(
                              width: width1 * 0.07,
                            ),
                            Text(
                              "Sign up With Facebook",
                              style: TextStyle(
                                fontFamily: "Rene Bieder",
                                color: kwhite,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////////////////////         End                  ///////////////////////
                  SizedBox(
                    height: width1 * 0.14,
                  ),

                  ///////////////////////////////////////////   Already Have account text    ///////////////////////
                  FadeAnimation(
                    1.4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have An Account?",
                          style: TextStyle(
                            fontFamily: "Rene Bieder",
                            color: kwhite,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            " Login Now",
                            style: TextStyle(
                              fontFamily: "Rene Bieder",
                              color: kwhite,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //////////////////////////////////////////////////     End                /////////////////////////
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
