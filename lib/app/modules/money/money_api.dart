
import 'package:atividade/app/modules/money/domain/money.dart';
import 'package:dio/dio.dart';

class MoneyApi {
  static const  URL = 'https://economia.awesomeapi.com.br/json/daily/EUR-BRL';
  final Dio dio;

  MoneyApi(this.dio);

  Future<Money> getPriceEur() async{
    try {
      var response = await dio.get(URL);
      return Money.fromMap(response.data[0]);
    } catch (e) {
      print(e);
      return Money(0.0);
    }
  }
}