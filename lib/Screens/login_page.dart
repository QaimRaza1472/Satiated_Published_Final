import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Models/logdetails.dart';
import 'package:satiated_life/Screens/dashboard.dart';
import 'package:satiated_life/Screens/signup_page.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';
import 'package:the_apple_sign_in/apple_sign_in_button.dart';
import 'package:the_apple_sign_in/scope.dart';

import '../AuthService.dart';
import '../Sync.dart';




/*
appBar: AppBar(
toolbarHeight: 38,
backgroundColor: kblue_1,
elevation: 0,
),*/




class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //AccessToken _accessToken;

  Future<FirebaseApp> _firebaseApp;
  String name;

  /// Database uses
  DbHelper helper = DbHelper();
  void insertLogs(String uid) async {
    final list = LogsDetail(1, uid);
    await helper.insertLogs(list);
  }

  @override
  void initState() {
    super.initState();
    _firebaseApp = Firebase.initializeApp();
  }



/*
  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance.login();


    // by default we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      Syncronization syncronization = new Syncronization();
      await insertLogs(userData['id']);
      // print(userData['id']);
      // await syncronization.synndata(userData['id']);
      Get.to(Dashboard(userData['id'], "1"));
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {});
  }*/

  void _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final signInAccount = await googleSignIn.signIn();

    final googleAccountAuthentication = await signInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (FirebaseAuth.instance.currentUser != null) {
      print('Google Authentication Successful');
      print('${FirebaseAuth.instance.currentUser.email} signed in.');
      // setState(() {
      //Syncronization syncronization = new Syncronization();
      name = FirebaseAuth.instance.currentUser.email;
      await insertLogs(name);
      //await syncronization.synndata(name);
      Get.to(Dashboard(name, "1"));
      //});
    } else {
      print('Unable to sign in');
    }
  }





  Future<void> _signInWithApple(BuildContext context) async {
    try {
      AuthService authService = new AuthService();

      //Provider.of<AuthService>(context, listen: false);
      final user = await authService.signInWithApple(
          scopes: [Scope.email, Scope.fullName]);
      print('uid: ${user.uid}');
      await insertLogs(
          user.uid
      );
      //await syncronization.synndata(name);
      Get.to(
          Dashboard(
          user.uid
      , "1"));



    } catch (e) {
      // TODO: Show alert here
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {



    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        exit(0);
      }, // Empty Function.
      child: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Container(
              height: height1,
              width: width1,
              color: kblue_2,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /////////////////////////////////////////////// Logo   //////////////////////////////
                    FadeAnimation(
                      1,
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 1.7,
                      ),
                    ),
                    //////////////////////////////////////////////// End   //////////////////////////////////

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /////////////////////////////////////////// Login With Google Button ///////////////////////
                        GestureDetector(
                          onTap: () {
                            _googleSignIn();
                          },
                          child: Container(
                            height: 52,
                            width: width1 * 0.90,
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
                                  children: [
                                    Image.asset(
                                      "assets/google.png",
                                      scale: 6,
                                    ),
                                    SizedBox(
                                      width: width1 * 0.05,
                                    ),
                                    Text(
                                      "Login With Google",
                                      style: TextStyle(
                                        color: kblack,
                                        fontFamily: "Rene Bieder",
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //////////////////////////////////////////////   End                ///////////////////////
                        SizedBox(
                          height: width1 * 0.05,
                        ),

                        /////////////////////////////////////////// Login With FaceBook Button ///////////////////////
                     /*   GestureDetector(
                          onTap: () async {
                            _login();

                            //                           Get.to(Dashboard());
                          },
                          child: Container(
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
                                  children: [
                                    Image.asset(
                                      "assets/fb_1.png",
                                      scale: 6,
                                    ),
                                    SizedBox(
                                      width: width1 * 0.05,
                                    ),
                                    Text(
                                      "Login With Facebook",
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
                        ),*/
                        //////////////////////////////////////////////      End                ////////////////////////
                        GestureDetector(
                          onTap: () => _signInWithApple(context),
                          child: Container(
                            height: 52,
                            width: width1 * 0.90,
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
                                  children: [
                                  /*  AppleSignInButton(
                                      type: ButtonType.signIn,
                                      onPressed: () => _signInWithApple(context),
                                    ),*/




                                    Image.asset(
                                      "assets/appleicon1.png",
                                      scale: 6,
                                    ),
                                    SizedBox(
                                      width: width1 * 0.05,
                                    ),
                                    Text(
                                      "Login With Apple",
                                      style: TextStyle(
                                        color: kblack,
                                        fontFamily: "Rene Bieder",
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: width1 * 0.14,
                        ),

                        /////////////////////////////////////////////   Don't Have account text   //////////////////////
                        // FadeAnimation(
                        //   1.4,
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         "Don't Have Account?",
                        //         style: TextStyle(
                        //           fontFamily: "Rene Bieder",
                        //           color: kwhite,
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         onTap: () async {
                        //           // Get.to(SignUpPage());
                        //         },
                        //         child: Text(
                        //           " Sign Up Now",
                        //           style: TextStyle(
                        //             fontFamily: "Rene Bieder",
                        //             color: kwhite,
                        //             fontSize: 19,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ///////////////////////////////////////////////     End                ///////////////////////////
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
