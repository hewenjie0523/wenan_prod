
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

class ReportSheet{
  static show(BuildContext context,int? targetUid,{VoidCallback? reportEnd,bool showReportFailMsg=false,}) async{
    if(targetUid==null){
      return;
    }
    List<SheetAction<int>> actions = _getActions();
    final result = await showModalActionSheet<int>(
      context: context,
      title: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report),
      // message: 'This is message.',
      actions: actions,
      builder: (context, child) => Theme(
        data: ThemeData(
          cupertinoOverrideTheme: const CupertinoThemeData(
            primaryColor:  AppColor.b1,
          ),
          // listTileTheme: const ListTileThemeData(
          //   textColor: AppColor.b1,
          //   iconColor: Colors.orange,
          // ),
        ),
        child: child,
      ),
    );
    AuvChatLog.d(result.toString());
    Utils.nullSafe<int>(result,notNullBlock: (notNull) async{
      if(notNull==99){
        var result = await showTextInputDialog(
            context: context,
            textFields: const [DialogTextField()],
            title: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_reason),
            cancelLabel: StringTranslate.e2z(Application.appLocalizations!.wenan_string_cancel),
            okLabel: StringTranslate.e2z(Application.appLocalizations!.wenan_string_submit)
        );
        var input = result?.first;
        if(!Utils.isEmpty(input)){
          _report(targetUid, notNull, context,reason: input);
        }
      } else {
        _report(targetUid, notNull, context);
      }
    });
  }

  static List<SheetAction<int>> _getActions(){
    List<SheetAction<int>> actions = [];
    actions.add(SheetAction(label: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_saorao),key: 1));
    actions.add(SheetAction(label: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_cheat),key: 2));
    actions.add(SheetAction(label: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_sex),key: 3));
    actions.add(SheetAction(label: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_iligal),key: 4));
    actions.add(SheetAction(label: StringTranslate.e2z(Application.appLocalizations!.wenan_string_report_other),key: 99));
    return actions;
  }


  static _report(int targetUid, int type, BuildContext context,{VoidCallback? reportEnd,bool showReportFailMsg=false,String? reason}) async{
    try {
      var result = await CommonApi(DioHelper.getInstance()).reportUser(targetUid, type, reason);
      if(result.code==0){
        if(!Utils.isEmptyString(result.msg)){
          Fluttertoast.showToast(msg: result.msg!);
        }
      } else {
        if(showReportFailMsg){
          Fluttertoast.showToast(msg: result.msg??StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
        }
      }

    } catch (e,stack) {
      AuvChatLog.printE(e,error: stack);
      if(showReportFailMsg){
        Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
      }
    }
    reportEnd?.call();
  }
  
}