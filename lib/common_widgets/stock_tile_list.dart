import 'package:flutter/material.dart';
import 'package:goindiastocks_task/bloc/commom_stock_state.dart';
import 'package:goindiastocks_task/common_widgets/flitered_stock_tile.dart';

class StockTileList extends StatelessWidget {
  final CommonStockState state;
  const StockTileList({
    Key? key, required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (c, i) {
        if (state.isAllType) {
          return filterStockTile(state.searchText, state.stockDeals!.data![i]);
        } else if (state.isBuyType) {
          if (state.stockDeals?.data![i].dealType == "BUY") {
            return filterStockTile(
                state.searchText, state.stockDeals!.data![i]);
          }
        } else if (state.isSellType) {
          if (state.stockDeals?.data![i].dealType == "SELL") {
            return filterStockTile(
                state.searchText, state.stockDeals!.data![i]);
          }
        }
        return Container();
      },
      itemCount: state.stockDeals?.data!.length,
    );
  }
}
