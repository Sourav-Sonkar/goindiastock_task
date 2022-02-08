import 'package:flutter/material.dart';
import 'package:goindiastocks_task/models/stock_deal_model.dart';
import 'package:goindiastocks_task/utils/constant.dart';
import 'package:goindiastocks_task/utils/extensions/widget_extensions.dart';

class StockDesignTile extends StatelessWidget {
  final Data? singleStock;
  const StockDesignTile({
    Key? key,
    required this.stockTypeColor,
    required this.singleStock,
  }) : super(key: key);
  final Color stockTypeColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 3,
              height: double.infinity,
              decoration: BoxDecoration(
                color: stockTypeColor,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        singleStock?.clientName ?? "",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      (singleStock?.dealDate ?? '').split("T")[0],
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: greyColor,
                          ),
                    ),
                  ],
                ).paddingForOnly(bottom: 8),
                RichText(
                  text: TextSpan(
                    text:
                        '${singleStock?.dealType == "SELL" ? "Sold" : "Brought"} ${singleStock?.quantity} shares ',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: stockTypeColor,
                          fontWeight: FontWeight.bold,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '@ Rs${singleStock?.tradePrice ?? ""}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ).paddingForOnly(bottom: 8),
                Text(
                  "Value Rs ${singleStock?.value}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: bluetext, fontWeight: FontWeight.bold),
                ).paddingForOnly(bottom: 8),
              ],
            ).paddingForOnly(left: 16, right: 16))
          ],
        ).paddingWithSymmetry(horizontal: 4, vertical: 4),
      ),
    );
  }
}
