// ignore_for_file: unused_field, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/services/dialogService.dart';
import 'package:SOUFEEDBACKAPP/src/models/dialog_model.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  const DialogManager({Key? key, required this.child}) : super(key: key);

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> with ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();
  // LocalizationService localizationService = locator<LocalizationService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
    // _dialogService.registerLanguagePickerListener(getLanguageContainer);
    _dialogService.registerCustomDialogListener(_showCutomDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: buildChild(context, request),
            ));
  }

  void _showCutomDialog(Widget child) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              // /*shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: child,
            ));
  }

  // void _showLanguagePicker() {
  //   var langs = localizationService.languages;

  //   showModalBottomSheet(
  //       context: context,
  //       builder: (ctx) {
  //         return SizedBox(
  //           //width: SizeConfig.screenWidth,
  //           height: SizeConfig.relativeHeight(8) * langs.length,
  //           child: ListView.builder(
  //             itemBuilder: (ctx, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 child: ListTile(
  //                     onTap: () {
  //                       localizationService.setLanguage(langs[index].shortName);
  //                     },
  //                     title: Text(
  //                       langs[index].name,
  //                       style: AppTheme.titleTextStyle,
  //                     ),
  //                     leading: Padding(
  //                       padding:
  //                           EdgeInsets.only(top: SizeConfig.relativeWidth(1)),
  //                       /*child: Flags.getFlag(
  //                           country: langs[index].flagId,
  //                           height: SizeConfig.relativeHeight(2.5),
  //                           width: SizeConfig.relativeWidth(8),
  //                           fit: BoxFit.fill),*/
  //                     ),
  //                     trailing: SizedBox(
  //                       width: SizeConfig.relativeWidth(10),
  //                       height: SizeConfig.relativeWidth(10),
  //                       child: Card(
  //                         borderOnForeground: true,
  //                         elevation: langs[index].shortName ==
  //                                 localizationService.currentLanguage.shortName
  //                             ? 5.0
  //                             : 0,
  //                         shape: CircleBorder(
  //                             side: langs[index].shortName ==
  //                                     localizationService
  //                                         .currentLanguage.shortName
  //                                 ? BorderSide.none
  //                                 : BorderSide(
  //                                     color: AppColors.plGreyColor22,
  //                                     width: 1.0,
  //                                   )),
  //                         clipBehavior: Clip.antiAlias,
  //                         // with Card
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: langs[index].shortName ==
  //                                   localizationService
  //                                       .currentLanguage.shortName
  //                               ? Image.asset(
  //                                   'assets/images/check2@3x.png',
  //                                 )
  //                               : null,
  //                         ),

  //                         //margin: EdgeInsets.all(10),
  //                       ),
  //                     )),
  //               );
  //             },
  //             itemCount: langs.length,
  //           ),
  //         );
  //       });
  // }

  Widget buildDialogButton(String title, bool whiteColor, Function callback) {
    var size = MediaQuery.of(context).size;
    var container = Container(
        height: size.height * 0.3,
        width: size.width * 4,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: whiteColor ? ThemeColors.bgColor : ThemeColors.bgColor2,
            borderRadius: const BorderRadius.all(Radius.circular(23.0)),
            border: Border.all(
              width: 2,
              color: ThemeColors.bgColor2,
            )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      whiteColor ? ThemeColors.bgColor2 : ThemeColors.bgColor,
                  // fontFamily: AppTheme.ffRegular,
                )),
          ),
        ));
    return Expanded(
      flex: 1,
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.3, right: size.width * 0.3),
        /*child: CircularButton(
          height: SizeConfig.relativeHeight(6),
          whiteColor: whiteColor,
          title: title,
          callback: callback,
        ),*/
      ),
    );
  }

  Widget buildChild(BuildContext context, DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;
    var size = MediaQuery.of(context).size;
    var column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.bgColor2,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: size.height * 0.9,
          child: Center(
              child: Text(
            'request.title',
            maxLines: 1,
            style: const TextStyle(
              color: ThemeColors.bgColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          )),
        ),
        Container(
          color: ThemeColors.bgColor.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'request.description',
                style: TextStyle(
                    // fontFamily: AppTheme.ffRegular,
                    color: ThemeColors.bgColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                    height: 1.71),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            /*decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),*/
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isConfirmationDialog)
              buildDialogButton(
                  'request.cancelTitle!',
                  true,
                  () => _dialogService
                      .dialogComplete(DialogResponse(confirmed: false))),
            //if (isConfirmationDialog) SizeConfig.horizontalSpacer(10),
            buildDialogButton(
                'request.buttonTitle!',
                isConfirmationDialog ? false : true,
                () => _dialogService
                    .dialogComplete(DialogResponse(confirmed: true)))
          ],
        )),
        SizedBox(
          height: 20,
        )
      ],
    );
    return WillPopScope(
      onWillPop: () async {
        if (isConfirmationDialog) {
          _dialogService.dialogComplete(DialogResponse(confirmed: false));
        }
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
            color: ThemeColors.bgColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: column,
      ),
    );
  }
}
