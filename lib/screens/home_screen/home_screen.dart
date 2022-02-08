import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goindiastocks_task/bloc/block_deal_cubit/block_deal_cubit.dart';
import 'package:goindiastocks_task/bloc/bulk_deal_cubit/bulk_deal_cubit.dart';
import 'package:goindiastocks_task/network/network_connection.dart';
import 'package:goindiastocks_task/screens/home_screen/widgets/block_deal_tab.dart';
import 'package:goindiastocks_task/screens/home_screen/widgets/bulk_deal_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Text(
                  "Bulk Deal",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Tab(
                icon: Text(
                  "Block Deal",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<BulkDealCubit>(
              create: (BuildContext context) =>
                  BulkDealCubit(context.read<NetworkConnection>())
                    ..getBulkDeal(),
            ),
            BlocProvider(
              create: (_) => BlockDealCubit(context.read<NetworkConnection>())
                ..getBlockDeal(),
            ),
          ],
          child: const TabBarView(
            children: [
              BulkDealTab(),
              BlockDealTab(),
            ],
          ),
        ),
      ),
    );
  }
}
