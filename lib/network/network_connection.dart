import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:goindiastocks_task/models/request_status.dart';
import 'package:goindiastocks_task/models/stock_deal_model.dart';
import 'package:http/http.dart' as http;


class NetworkConnection {
  static const _baseUrl = "goindiastocks.com";
  final http.Client _httpClient;

  NetworkConnection({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<RequestStatus<StockDealModel>> getBulkDeal() async {
    try {
      final bulkDealUri = Uri.https(_baseUrl, '/api/service/GetBulkBlockDeal',
          {'fincode': '100114', 'DealType': 'Bulk_Deal'});
      final response = await _httpClient.get(bulkDealUri);
      if (response.statusCode == 200) {
        final homeResponse = StockDealModel.fromJson(jsonDecode(response.body));
        return RequestStatus<StockDealModel>(
            RequestStatus.SUCCESS, null, homeResponse);
      } else {
        return RequestStatus<StockDealModel>(
            RequestStatus.FAILURE, "Something went wrong", null);
      }
    } catch (e) {
      return _commonCatchBlock<StockDealModel>(e);
    }
  }

  Future<RequestStatus<StockDealModel>> getBlockDeal() async {
    try {
      final bulkDealUri = Uri.https(_baseUrl, '/api/service/GetBulkBlockDeal',
          {'fincode': '100114', 'DealType': 'Block_Deal'});
      final response = await _httpClient.get(bulkDealUri);
      if (response.statusCode == 200) {
        final homeResponse = StockDealModel.fromJson(jsonDecode(response.body));
        return RequestStatus<StockDealModel>(
            RequestStatus.SUCCESS, null, homeResponse);
      } else {
        return RequestStatus<StockDealModel>(
            RequestStatus.FAILURE, "Something went wrong", null);
      }
    } catch (e) {
      return _commonCatchBlock<StockDealModel>(e);
    }
  }

  RequestStatus<T> _commonCatchBlock<T>(e) {
    if (e is TimeoutException || e is SocketException) {
      return RequestStatus<T>(
          RequestStatus.FAILURE, 'Check internet connection', null);
    }
    //print(e);
    return RequestStatus<T>(
        RequestStatus.FAILURE, 'Something went wrong', null);
  }
}
