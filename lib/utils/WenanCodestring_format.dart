import 'package:date_format/date_format.dart' as DateFormat;
import 'package:wenan/utils/WenanCodelog.dart';

import '../data/user/CommonUser.dart';

class StringUtils {
  static double ONE_MINUTE = 60000;
  static double ONE_HOUR = 3600000;
  static double ONE_DAY = 86400000;
  static double ONE_WEEK = 604800000;

  static String ONE_SECOND_AGO = "秒前";
  static String ONE_MINUTE_AGO = "分钟前";
  static String ONE_HOUR_AGO = "小时前";
  static String ONE_DAY_AGO = "天前";
  static String ONE_MONTH_AGO = "月前";
  static String ONE_YEAR_AGO = "年前";

  /// 根据时间字符串获取描述性时间，如3分钟前，1天前
  ///
  /// @param dateString 时间字符串
  /// @return
  static String getDescriptionTimeFromDateString(String dateString) {
    if (dateString.isEmpty) {
      return "";
    }
    var dateTime = DateTime.parse(dateString);
    try {
      return getDescriptionTimeFromDate(dateTime);
    } catch (e) {
      AuvChatLog.e(e.toString());
    }
    return "";
  }

  String formatZhuiShuDateString(String dateString) =>
      dateString.replaceAll("T", " ").replaceAll("Z", "");

  static String getDescriptionTimeFromDate(DateTime parse) {
    var delta = DateTime.now().difference(parse).inMilliseconds.toDouble();
    if (delta < 1 * ONE_MINUTE) {
      var seconds = toSeconds(delta);
      return (seconds <= 0 ? 1 : seconds).toString() + ONE_SECOND_AGO;
    }
    if (delta < 45 * ONE_MINUTE) {
      var minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toString() + ONE_MINUTE_AGO;
    }
    if (delta < 24 * ONE_HOUR) {
      var hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toString() + ONE_HOUR_AGO;
    }
    if (delta < 48 * ONE_HOUR) {
      return "昨天";
    }

    if (delta < 10 * ONE_DAY) {
      var days = toDays(delta);
      return (days <= 0 ? 1 : days).toString() + ONE_DAY_AGO;
    }

    if (delta < 30 * ONE_DAY) {
      // var days = toDays(delta);
      // return (days <= 0 ? 1 : days).toString() + ONE_DAY_AGO;
      return getFormatDate(parse.millisecondsSinceEpoch, formats: FORMAT_DATE4);
    }
    if (delta < 12 * 4 * ONE_WEEK) {
      // var months = toMonths(delta);
      // return (months <= 0 ? 1 : months).toString() + ONE_MONTH_AGO;
      return getFormatDate(parse.millisecondsSinceEpoch, formats: FORMAT_DATE4);
    } else {
      // var years = toYears(delta);
      // return (years <= 0 ? 1 : years).toString() + ONE_YEAR_AGO;
      return getFormatDate(parse.millisecondsSinceEpoch, formats: FORMAT_DATE5);
    }
  }

  static int toSeconds(double date) => (date / 1000).ceil();

  static int toMinutes(double date) => (toSeconds(date) / 60).ceil();

  static int toHours(double date) => (toMinutes(date) / 60).ceil();

  static int toDays(double date) => (toHours(date) / 24).ceil();

  static int toMonths(double date) => (toDays(date) / 30).ceil();

  static int toYears(double date) => (toMonths(date) / 365).ceil();

  static String formatWordCount(int wordCount) {
    if (wordCount / 10000 > 0) {
      return (wordCount / 10000 + 0.5).toInt().toString() + "万字";
    } else if (wordCount / 1000 > 0) {
      return (wordCount / 1000 + 0.5).toInt().toString() + "千字";
    } else {
      return wordCount.toString() + "字";
    }
  }

  static String formatDuration(Duration d) {
    int hour = d.inHours;
    int minute = d.inMinutes >= 60 ? (d.inMinutes % 60) : d.inMinutes;
    int second = (d.inSeconds >= 60) ? (d.inSeconds % 60) : d.inSeconds;
    String formatTime(int time) => time < 10 ? '0$time' : '$time';
    return (hour == 0 ? '' : formatTime(hour) + ':') +
        formatTime(minute) +
        ':' +
        formatTime(second);
  }

  static bool isNotEmpty(String? str) {
    return null != str && str.isNotEmpty;
  }

//将时间日期格式转化为时间戳
  ///formartDate=2018年12月11日    或者    2019-12-11   或者    2018年11月15 11:14分89
  ///结果是毫秒
  static int getMilliseconds({String formartDate = "1970-10-01 00:00:00"}) {
    //年必须大于1970年
    String mYear = formartDate.substring(0, 4);
    if (int.parse(mYear) < 1970) {
      mYear = "1970";
    }
    var result;
    try {
      result = mYear +
          "-" +
          formartDate.substring(5, 7) +
          "-" +
          formartDate.substring(8, 10);
      if (formartDate.toString().length >= 13 &&
          formartDate.substring(10, 13) != null) {
        result += "" + formartDate.substring(10, 13);
      }
      if (formartDate.toString().length >= 17 &&
          formartDate.toString().substring(14, 16) != null) {
        result += ":" + formartDate.substring(14, 16);
      }
      if (formartDate.toString().length >= 19 &&
          formartDate.substring(17, 19) != null) {
        result += ":" + formartDate.substring(17, 19);
      }
      print(result);
      var dateTime = DateTime.parse(result);
      return dateTime.millisecondsSinceEpoch;
    } catch (e) {
      throw e;
    }
  }

  static const  FORMAT_DATE4 = [DateFormat.mm,"-",DateFormat.dd];
  static const  FORMAT_DATE5 = [DateFormat.yyyy, '-', DateFormat.mm, '-', DateFormat.dd];
  static const  FORMAT_YYYY_MM_DD_HH_MM_SS = [DateFormat.yyyy, '-', DateFormat.mm, '-', DateFormat.dd,' ',DateFormat.hh,':',DateFormat.nn,':',DateFormat.ss];

  ///格式化时间戳
  ///timeSamp:毫秒值
  ///format:"yyyy年MM月dd hh:mm:ss"  "yyy?MM?dd  hh?MM?dd" "yyyy:MM:dd"......
  ///结果： 2019?08?04  02?08?02
  static String getFormatDate(int timeSamp, {List<String> formats = FORMAT_YYYY_MM_DD_HH_MM_SS}) {
    return DateFormat.formatDate(
        DateTime.fromMillisecondsSinceEpoch(timeSamp),
        formats);
  }

  ///格式化计时器
  ///seconds 秒
  ///return 分:秒
  static String getFormatTimer(int seconds, {List<String> formats = const [DateFormat.nn, ":", DateFormat.ss]}) {
    return DateFormat.formatDate(DateTime(0).add(Duration(seconds: seconds)), formats);
  }

  static String getFormartDateTime(DateTime dateTime,
      {List<String> formats = FORMAT_YYYY_MM_DD_HH_MM_SS}) {
    return DateFormat.formatDate(dateTime,
        formats);
  }


  ///1.获取从某一天开始到某一天结束的所有的中间日期，例如输入 startTime:2019:07:31  endTime:2019:08:31  就会返回所有的中间天数。
  ///startTime和endTime格式如下都可以
  ///使用:    List<String> mDate=DateUtils.instance.getTimeBettwenStartTimeAndEnd(startTime:"2019-07-11",endTime:"2019-08-29",format:"yyyy年MM月dd");
  ///结果:[2019年07月11, 2019年07月12, 2019年07月13, 2019年07月14, 2019年07月15, 2019年07月16, 2019年07月17, 2019年07月18, 2019年07月19, 2019年07月20, 2019年07月21, 2019年07月22, 2019年07月23, 2019年07月24, 2019年07月25, 2019年07月26, 2019年07月27, 2019年07月28, 2019年07月29, 2019年07月30, 2019年07月31, 2019年08月01, 2019年08月02, 2019年08月03, 2019年08月04, 2019年08月05, 2019年08月06, 2019年08月07, 2019年08月08, 2019年08月09, 2019年08月10, 2019年08月11, 2019年08月12, 2019年08月13, 2019年08月14, 2019年08月15, 2019年08月16, 2019年08月17, 2019年08月18, 2019年08月19, 2019年08月20, 2019年08月21, 2019年08月22, 2019年08月23, 2019年08月24, 2019年08月25, 2019年08月26, 2019年08月27, 2019年08月28, 2019年08月29]
  static List<String> getTimeBettwenStartTimeAndEnd(
      {required String startTime, required String endTime, required String format}) {
    var mDateList = <String>[];
    //记录往后每一天的时间搓，用来和最后一天到做对比。这样就能知道什么时候停止了。
    int allTimeEnd = 0;
    //记录当前到个数(相当于天数)
    int currentFlag = 0;
    DateTime startDate = DateTime.parse(startTime);
    DateTime endDate = DateTime.parse(endTime);
    while (endDate.millisecondsSinceEpoch > allTimeEnd) {
      allTimeEnd =
          startDate.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000;
      var dateTime = DateTime.fromMillisecondsSinceEpoch(
          startDate.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000);
      String nowMoth = DateFormat.formatDate(dateTime,[format]);
      mDateList.add(nowMoth);
      currentFlag++;
    }
    return mDateList;
  }

  ///获取从某一天开始和之后的多少天内的所有你需要格式化样式的时间日期。
  ///tarTime: 开始日期 2012-02-27 13:27:00 或者 "2012-02-27等....
  ///dayNumber：从startTime往后面多少天你需要输出
  ///formart:获取到的日期格式。"yyyy年MM月dd" "yyyy-MM-dd" "yyyy年" "yyyy年MM月" "yyyy年\nMM月dd"  等等
  ///使用：DateUtils.instance.getTimeStartTimeAndEnd(startTime:"2019-07-11",dayNumber:10,format:"yyyy年MM月dd");
  ///结果:[2019年07月11, 2019年07月12, 2019年07月13, 2019年07月14, 2019年07月15, 2019年07月16, 2019年07月17, 2019年07月18, 2019年07月19, 2019年07月20, 2019年07月21]
  static List<String> getTimeStartTimeAndEnd(
      {String startTime = "1970-01-01",
      int dayNumber = 1,
      String format = "yyyy年MM月dd"}) {
    var mDateList = <String>[];
    //记录往后每一天的时间搓，用来和最后一天到做对比。这样就能知道什么时候停止了。
    //记录当前到个数(相当于天数)
    int currentFlag = 0;
    DateTime startDate = DateTime.parse(startTime);
    print(startDate.millisecondsSinceEpoch);
    while (dayNumber >= currentFlag) {
      var dateTime = DateTime.fromMillisecondsSinceEpoch(
          startDate.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000);
      String nowMoth = DateFormat.formatDate(dateTime,[format]);
      mDateList.add(nowMoth);
      currentFlag++;
    }
    return mDateList;
  }

  ///获取从某一天时间戳开始和之后的多少天内的所有你需要格式化样式的时间日期。
  ///startTime:输入其实时间的时间戳也可以。例如 1570723200000
  ///dayNumber:所需要后面的几天以内的日期数字 1
  ///format 输入时间格式
  static List<TimeDate> getTimeStartTimeAndEndTime(
      {required int startTime, required int dayNumber, required String format}) {
    var mDateList = <TimeDate>[];
    //记录往后每一天的时间搓，用来和最后一天到做对比。这样就能知道什么时候停止了。
    int allTimeEnd = 0;
    //记录当前到个数(相当于天数)
    int currentFlag = 0;
    while (dayNumber >= currentFlag) {
      TimeDate timeDate = new TimeDate();
      var dateTime = DateTime.fromMillisecondsSinceEpoch(
          startTime + currentFlag * 24 * 60 * 60 * 1000);
      String nowMoth = DateFormat.formatDate(dateTime,[format]);
      timeDate.DateTime = nowMoth;
      timeDate.week = dateTime.weekday;
      mDateList.add(timeDate);
      currentFlag++;
    }
    return mDateList;
  }

  ///获取某一个月的最后一天。
  ///我们能提供和知道的条件有:(当天的时间,)
  ///timeSamp:时间戳 单位（毫秒）
  ///format:想要的格式  "yyyy年MM月dd hh:mm:ss"  "yyy?MM?dd  hh?MM?dd" "yyyy:MM:dd"
  static getEndMoth(int timeSamp, {format = "yyyy年MM月dd hh:mm:ss"}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timeSamp);
    var DateNextMonthDate = DateTime(dateTime.year, dateTime.month + 1, 1);
    int nextTimeSamp =
        DateNextMonthDate.millisecondsSinceEpoch - 24 * 60 * 60 * 1000;
    //取得了下一个月1号码时间戳
    var dateTimeeee = DateTime.fromMillisecondsSinceEpoch(nextTimeSamp);
    String formartResult = DateFormat.formatDate(dateTimeeee,[format]);
    return formartResult;
  }

  ///获取某一个月的最后一天。
  ///我们能提供和知道的条件有:(当天的时间,)
  ///timeSamp:时间戳 单位（毫秒）
  ///format:想要的格式  "yyyy年MM月dd hh:mm:ss"  "yyy?MM?dd  hh?MM?dd" "yyyy:MM:dd"
  static getEndMothFor({String mothFormartTime = "1970年01月01", required String format}) {
    DateTime startDate = DateTime.parse(mothFormartTime);
    //DateTime获取年和月
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        startDate.millisecondsSinceEpoch);
    //通过DateTime获取当月的下个月第一天。
    var DateNextMonthDate = DateTime(dateTime.year, dateTime.month + 1, 1);
    //下一个月的第一天时间戳减去一天的时间戳就是当前月的最后一天的时间戳
    int nextTimeSamp =
        DateNextMonthDate.millisecondsSinceEpoch - 24 * 60 * 60 * 1000;
    //取得了下一个月1号码时间戳
    var dateTimeeee = DateTime.fromMillisecondsSinceEpoch(nextTimeSamp);
    String formartResult = DateFormat.formatDate(dateTimeeee,[format]);
    return formartResult;
  }

  static String formatFeedtime(int timeIn) {
    return getDescriptionTimeFromDate(
        DateTime.fromMillisecondsSinceEpoch(timeIn));
  }

  // static String formatUserExtendDesc(CommonUser user) {
  //   StringBuffer buffer = StringBuffer();
  //   if (StringUtils.isNotEmpty(user.constellation)) {
  //     buffer.write(user.constellation);
  //   }
  //   if (StringUtils.isNotEmpty(user.extend.profile.age_section)) {
  //     if (buffer.length > 0) {
  //       buffer.write(" | ");
  //     }
  //     buffer.write(user.extend.profile.age_section);
  //   }
  //
  //   if (StringUtils.isNotEmpty(user.extend.profile.getLocationArea)) {
  //     if (buffer.length > 0) {
  //       buffer.write(" | ");
  //     }
  //     buffer.write(user.extend.profile.getLocationArea);
  //   }
  //
  //   if (user.extend.profile.followed_count > 0) {
  //     if (buffer.length > 0) {
  //       buffer.write(" | ");
  //     }
  //     buffer.write("${user.extend.profile.followed_count} 粉丝");
  //   }
  //   return buffer.toString();
  // }

  static String showUserOnlineTime(int milliseconds) {
    final date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    final delta = DateTime.now().difference(date).inMilliseconds.toDouble();
    if (delta < 10 * StringUtils.ONE_MINUTE) {
      return '刚刚';
    }
    if (delta < 30 * StringUtils.ONE_MINUTE) {
      return '10分钟前';
    }
    if (delta < StringUtils.ONE_HOUR) {
      return '半小时前';
    }
    if (delta < 24 * StringUtils.ONE_HOUR) {
      return '${(delta / StringUtils.ONE_HOUR).floor()}小时前';
    }
    var day = (delta / StringUtils.ONE_DAY).floor();
    if (day > 10) day = 10;
    return '$day天前';
  }


  static bool isSameDate(int millise,int formatMillis){

    String nowDateStr = getFormatDate(millise, formats: FORMAT_DATE5);
    String formateStr = getFormatDate(formatMillis, formats: FORMAT_DATE5);
    AuvChatLog.d("StringUtils isSameDate -- nowDateStr - $nowDateStr =====  formateStr -$formateStr");
    if(isNotEmpty(nowDateStr) && isNotEmpty(formateStr)){
      return  nowDateStr == formateStr;
    }
    return false;
  }
}

class TimeDate {
  String DateTime = "";
  int week = 0;
}
