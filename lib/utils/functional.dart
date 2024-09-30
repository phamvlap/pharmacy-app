import 'package:intl/intl.dart';

String formatMoney(double money) {
  var currencyFormater = NumberFormat.currency(
    locale: "vi_VN",
    symbol: "",
    decimalDigits: 0,
  );

  String formattedMoney = currencyFormater.format(money);
  formattedMoney = '${formattedMoney.trim()}đ';

  return formattedMoney;
}
