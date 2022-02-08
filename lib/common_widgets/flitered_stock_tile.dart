import 'package:flutter/material.dart';
import 'package:goindiastocks_task/common_widgets/stock_design_tile.dart';
import 'package:goindiastocks_task/models/stock_deal_model.dart';
import 'package:goindiastocks_task/utils/constant.dart';
import 'package:goindiastocks_task/utils/extensions/widget_extensions.dart';

Widget filterStockTile(String searchText, Data singleStock) {
  if (searchText.isNotEmpty) {
    if ((singleStock.clientName ?? "")
        .toLowerCase()
        .contains(searchText.toLowerCase())) {
      return StockDesignTile(
        singleStock: singleStock,
        stockTypeColor: singleStock.dealType == "SELL" ? redColor : greenColor,
      ).paddingWithSymmetry(horizontal: 8, vertical: 4);
    }
  } else {
    return StockDesignTile(
      stockTypeColor: singleStock.dealType == "SELL" ? redColor : greenColor,
      singleStock: singleStock,
    ).paddingWithSymmetry(horizontal: 8, vertical: 4);
  }
  return Container();
}
