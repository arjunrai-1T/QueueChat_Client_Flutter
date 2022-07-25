import 'package:queuechat/screens/signinOrSignUp/otp_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Image.asset("assets/images/welcome_image.png"),
              ],
            ),
            Spacer(),
            Column(
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Welcome to Quee Chat',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.height * 0.43),
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'We will send you an ',
                          style: TextStyle(color: kPrimaryColor)),
                      TextSpan(
                          text: 'One Time Password ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'on this mobile number',
                          style: TextStyle(color: kPrimaryColor)),
                    ]),
                  ),
                ),
                Container(
                  height: 50,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.height * 0.43),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    controller: phoneController,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    placeholder: '+33...',
                  ),
                ),
                Container(
                  // margin:
                  //     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.height * 0.43),
                  child: RaisedButton(
                    onPressed: () {
                      // if (phoneController.text.isNotEmpty) {
                      //   loginStore.getCodeWithPhoneNumber(
                      //       context, phoneController.text.toString());
                      // } else {
                      //   loginStore.loginScaffoldKey.currentState
                      //       .showSnackBar(SnackBar(
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: Colors.red,
                      //     content: Text(
                      //       'Please enter a phone number',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ));
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OtpPage(),
                        ),
                      );
                    },
                    color: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: kPrimaryColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
