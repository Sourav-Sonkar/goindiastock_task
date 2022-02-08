import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goindiastocks_task/bloc/block_deal_cubit/block_deal_cubit.dart';
import 'package:goindiastocks_task/bloc/commom_stock_state.dart';
import 'package:goindiastocks_task/common_widgets/button_structure.dart';
import 'package:goindiastocks_task/common_widgets/custom_divider.dart';
import 'package:goindiastocks_task/common_widgets/stock_tile_list.dart';
import 'package:goindiastocks_task/utils/constant.dart';
import 'package:goindiastocks_task/utils/extensions/widget_extensions.dart';

class BlockDealTab extends StatelessWidget {
  const BlockDealTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockDealCubit, CommonStockState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.errMsg.isNotEmpty) {
          return Center(
            child: Text(state.errMsg),
          );
        }
        if ((state.stockDeals?.data?.length ?? 0) != 0) {
          return ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonStructure(
                          color: bluegrey,
                          text: "All",
                          isSelected: state.isAllType)
                      .asButton(
                          onTap: () =>
                              context.read<BlockDealCubit>().changeType(0))
                      .expanded(flex: 1),
                  const SizedBox(width: 10),
                  ButtonStructure(
                          color: greenColor,
                          text: "Buy",
                          isSelected: state.isBuyType)
                      .asButton(
                          onTap: () =>
                              context.read<BlockDealCubit>().changeType(1))
                      .expanded(flex: 1),
                  const SizedBox(width: 10),
                  ButtonStructure(
                          color: redColor,
                          text: "Sell",
                          isSelected: state.isSellType)
                      .asButton(
                          onTap: () =>
                              context.read<BlockDealCubit>().changeType(2))
                      .expanded(flex: 1),
                ],
              ).paddingWithSymmetry(horizontal: 16, vertical: 16),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: Border.all(color: greyColor, width: 1),
                ),
                width: double.infinity,
                child: TextField(
                  onChanged: (value) =>
                      context.read<BlockDealCubit>().getSearchedStock(value),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Client Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ).paddingLTRB(24, 8, 16, 16),
              ),
             customdivider().paddingWithSymmetry(horizontal: 16, vertical: 4),
              StockTileList(state: state),
            ],
          );
        }
        return Container();
      },
    );
  }
}

