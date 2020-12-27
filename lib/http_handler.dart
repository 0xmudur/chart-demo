import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpHandler {
  ///Singleton HTTP
  static final HttpHandler _instance = new HttpHandler._internal();

  HttpHandler._internal();

  factory HttpHandler() => _instance;

  ///Fetch data from API
  ///@param period: ['1G,1H,1A,3A,1Y,5Y']
  Future<dynamic> getData(String period) async {
    String url = 'https://finfree.app/demo';
    String token = 'R29vZCBMdWNr';

    final Response response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      var jsonEncode = json.decode(response.body);
      var result = responseParser(jsonEncode, period);
      return result;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load data');
    }
  }
}

///@param map: Convert List() to Map()
///@param period: ['1G,1H,1A,3A,1Y,5Y']
void responseParser(Map<String, dynamic> map, String period) {
  switch (period) {
    case 'oneDay':
      var oneDay = map['1G'];
      return oneDay;
    case 'oneWeek':
      var oneWeek = map['1H'];
      return oneWeek;
    case 'oneMonth':
      var oneMonth = map['1A'];
      return oneMonth;
    case 'threeMonths':
      var threeMonths = map['3A'];
      return threeMonths;
    case 'oneYear':
      var oneYear = map['1Y'];
      return oneYear;
    case 'fiveYears':
      var fiveYears = map['5Y'];
      return fiveYears;
  }
}
