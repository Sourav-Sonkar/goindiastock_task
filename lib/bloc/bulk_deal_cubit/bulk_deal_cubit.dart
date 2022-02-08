import 'package:bloc/bloc.dart';
import 'package:goindiastocks_task/bloc/commom_stock_state.dart';
import 'package:goindiastocks_task/models/request_status.dart';
import 'package:goindiastocks_task/network/network_connection.dart';

class BulkDealCubit extends Cubit<CommonStockState> {
  BulkDealCubit(NetworkConnection connection)
      : _connection = connection,
        super(CommonStockState());

  final NetworkConnection _connection;

  void getBulkDeal() {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    try {
      _connection.getBulkDeal().then((value) {
        if (value.status == RequestStatus.SUCCESS) {
          emit(state.copyWith(
            isLoading: false,
            stockDeals: value.body,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            errMsg: value.message,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errMsg: "Something went wrong",
      ));
    }
  }

  ///0-All
  ///1-Buy
  ///2-Sell
  void changeType(int type) {
    if (type == 0) {
      emit(state.copyWith(
        isAllType: true,
        isBuyType: false,
        isSellType: false,
      ));
    } else if (type == 1) {
      emit(state.copyWith(
        isAllType: false,
        isBuyType: true,
        isSellType: false,
      ));
    } else if (type == 2) {
      emit(state.copyWith(
        isAllType: false,
        isBuyType: false,
        isSellType: true,
      ));
    }
  }

  void getSearchedStock(String searchText) {
    if (state.searchText == searchText.trim()) return;
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(state.copyWith(searchText: searchText.trim()));
    });
  }
}
