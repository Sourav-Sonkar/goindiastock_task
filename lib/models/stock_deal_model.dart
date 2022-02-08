class StockDealModel {
  List<Data>? data;
  String? status;

  StockDealModel({this.data, this.status});

  StockDealModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Status'] = status;
    return data;
  }
}

class Data {
  String? finCode;
  String? clientName;
  String? dealType;
  String? quantity;
  String? value;
  String? tradePrice;
  String? dealDate;
  String? exchange;

  Data(
      {this.finCode,
      this.clientName,
      this.dealType,
      this.quantity,
      this.value,
      this.tradePrice,
      this.dealDate,
      this.exchange});

  Data.fromJson(Map<String, dynamic> json) {
    finCode = json['FinCode'];
    clientName = json['ClientName'];
    dealType = json['DealType'];
    quantity = json['Quantity'];
    value = json['Value'];
    tradePrice = json['TradePrice'];
    dealDate = json['DealDate'];
    exchange = json['Exchange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FinCode'] = finCode;
    data['ClientName'] = clientName;
    data['DealType'] = dealType;
    data['Quantity'] = quantity;
    data['Value'] = value;
    data['TradePrice'] = tradePrice;
    data['DealDate'] = dealDate;
    data['Exchange'] = exchange;
    return data;
  }
}
