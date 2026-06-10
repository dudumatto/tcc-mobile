import 'package:timeago/timeago.dart' as timeago;

class DateUtilsX {
  static String relative(DateTime value) => timeago.format(value, locale: 'pt');
}

