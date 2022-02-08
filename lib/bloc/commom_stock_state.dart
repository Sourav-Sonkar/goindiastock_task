
import 'package:goindiastocks_task/models/stock_deal_model.dart';

class CommonStockState {
  final bool isLoading;
  final String errMsg;
  final StockDealModel? stockDeals;
  final bool isSellType;
  final bool isBuyType;
  final bool isAllType;
  final String searchText;

  CommonStockState(
      {this.searchText = "",
      this.isSellType = false,
      this.isBuyType = false,
      this.isAllType = true,
      this.isLoading = false,
      this.errMsg = "",
      this.stockDeals});

  CommonStockState copyWith({
    bool? isLoading,
    String? errMsg,
    StockDealModel? stockDeals,
    bool? isSellType,
    bool? isBuyType,
    bool? isAllType,
    String? searchText,
  }) {
    return CommonStockState(
      isLoading: isLoading ?? this.isLoading,
      errMsg: errMsg ?? this.errMsg,
      stockDeals: stockDeals ?? this.stockDeals,
      isSellType: isSellType ?? this.isSellType,
      isBuyType: isBuyType ?? this.isBuyType,
      isAllType: isAllType ?? this.isAllType,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  String toString() {
    return 'CommonStockState(isLoading: $isLoading, errMsg: $errMsg, stockDeals: $stockDeals, isSellType: $isSellType, isBuyType: $isBuyType, isAllType: $isAllType)';
  }
}
