// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print, unused_field, unused_local_variable, unused_element, use_build_context_synchronously, library_private_types_in_public_api, sort_child_properties_last, unnecessary_null_comparison, unnecessary_import

import 'dart:io';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm2/feedback2.dart';
import 'package:SOUFEEDBACKAPP/src/screens/Login%20GR/gr_login_screen_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/provider/base_model.dart';
import 'package:SOUFEEDBACKAPP/provider/base_view.dart';
import 'package:SOUFEEDBACKAPP/provider/getusers_model.dart';
import 'package:SOUFEEDBACKAPP/src/models/save_users.dart';
// import 'package:SOUFEEDBACKAPP/view/login_screen_viewmodel.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/TextFieldWithPostFixIcon.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:SOUFEEDBACKAPP/src/screens/OTP Screen/OTP_Screen.dart';
// import 'package:custom_qr_generator/custom_qr_generator.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedbackForm/feedback.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_flutter/qr_flutter.dart';

class GRLoginScreen extends StatefulWidget {
  const GRLoginScreen({Key? key}) : super(key: key);

  @override
  _GRLoginScreenState createState() => _GRLoginScreenState();
}

class _GRLoginScreenState extends State<GRLoginScreen> {
  List<UsersViewModel>? _users;
  final TextEditingController _mobileno = TextEditingController();
  bool isScanned = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    bool isotp;
    bool isPhoneShow = true;
    bool isOtpShow = false;

    String verid = "";
    var size = MediaQuery.of(context).size;
    const IconData dialpad = IconData(0xe1ce, fontFamily: 'MaterialIcons');
    QuerySnapshot? snapshot;

    return ChangeNotifierProvider<GRLoginScreenViewModel>(
      create: (context) => locator<GRLoginScreenViewModel>(),
      child: ViewModelBuilder<GRLoginScreenViewModel>.reactive(
          viewModelBuilder: () => GRLoginScreenViewModel(
                context,
              ),
          builder: (
            context,
            model,
            child,
          ) {
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ThemeColors.bgColor,
                    ThemeColors.bgColor2,
                  ],
                )),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: size.height * 0.06),
                        child: Text(
                          'Welcome to GUEST FEEDBACK FORM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: size.height * 0.06),
                        child: Text(
                          'GuestRelation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),

                      SizedBox(
                          height: 200,
                          width: 200,
                          //flex: 5,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          )),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: isScanned
                                ? Text('QR Code Scanned!')
                                : Text('Please scan a QR code'),
                          )),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Feedback2()),
                          );
                        },
                        child: SizedBox(
                            child: QrImageView(
                          data: 'GuestRelation',
                          version: QrVersions.auto,
                          size: 200.0,
                        )),
                      )

                      // Expanded(
                      //     flex: 5,
                      //     child: QRView(
                      //       key: qrKey,
                      //       onQRViewCreated: model.onQRViewCreated,
                      //     )),

                      // Expanded(
                      //   flex: 1,
                      //   child: Center(
                      //       child: result != null
                      //           ? Text(
                      //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      //           : Text('eScan a cod')),
                      // )

                      // Container(
                      //   margin: EdgeInsets.only(bottom: size.height * 0.06),
                      //   child: Text(
                      //     'LogIn',
                      //     textAl ign: TextAlign.center,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 18),
                      //   ),
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     TextFieldWithPostFixIcon(
                      //       postfixIconTap: () => {},
                      //       controller: _mobileno,
                      //       postfixIcon: dialpad,
                      //       hinText: "Enter Mobile Number",
                      //       postfixIconColor: Colors.white24,
                      //     ),
                      //     SizedBox(
                      //       height: 10,
                      //     ),
                      //     Container(
                      //       alignment: Alignment.centerRight,
                      //       color: Colors.transparent,
                      //       height: size.height * 0.05,
                      //       width: size.width * 0.7,
                      //       child: TextButton(
                      //         onPressed: () {
                      //           model.redirectToPage(signupScreen);
                      //         },
                      //         child: const Text(
                      //           'New User? CreateAccount',
                      //           textAlign: TextAlign.right,
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 15,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     CustomBtn(
                      //       height: size.height * 0.05,
                      //       width: size.width * 0.6,
                      //       str: 'Log In Now',
                      //       btnColor: ThemeColors.appDarkPrimaryColor,
                      //       fontWeight: FontWeight.bold,
                      //       btnPressed: () async {
                      //         final isExistusers = await model
                      //             .checkCustomerExist(_mobileno.text);
                      //         if (isExistusers == true) {
                      //           final isOtpsent = await model.verifyPhoneNumber(
                      //               context, _mobileno.text.toString().trim());

                      //           ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                   content: Text(
                      //                       model.authexception.toString())));

                      //           if (isOtpsent) {
                      //             setState(() {
                      //               verid = model.verificationid.toString();
                      //             });
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       OTPScreen(verId: verid)),
                      //             );
                      //           } else {
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //                 SnackBar(
                      //                     content: Text("Didn't get OTP")));
                      //           }
                      //         } else {
                      //           ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                   content: Text("user is not exist")));
                      //         }
                      //       },
                      //       borderRadius: 10,
                      //       btnBorderColor: ThemeColors.textBoxOutlineBorder,
                      //       fontSize: 18,
                      //       // fontWeight: FontWeight.w300,
                      //       txtColor: ThemeColors.textBoxOutlineBorder,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!isScanned) {
        print('Scanned data: ${scanData.code}');

        _redirectBasedOnQRData(scanData.code.toString());

        setState(() {
          isScanned = true;
        });
      }
    });
  }

  void _redirectBasedOnQRData(String qrData) {
    if (qrData == 'GuestRelation') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FeedbackScreen()),
      );
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
