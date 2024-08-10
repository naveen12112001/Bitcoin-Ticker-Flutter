import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'C08729A8-906A-4E36-B53A-43CDF1BED507';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String stockName, String currency) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$stockName/$currency?apikey=$apiKey'));
    var coinData = jsonDecode(response.body);
    var rate = coinData['rate'];
    return rate;
  }
}
