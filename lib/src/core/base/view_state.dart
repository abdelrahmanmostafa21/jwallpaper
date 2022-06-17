import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
abstract class ViewState with _$ViewState {
  const factory ViewState.idle() = _Idle;
  const factory ViewState.error({String? error}) = _Error;
  const factory ViewState.loading() = _Loading;
  const factory ViewState.loadingMore() = _LoadingMore;
  const factory ViewState.noMoreData() = _NoMoreData;
  const factory ViewState.dataAvailable() = _DataAvailable;
  const factory ViewState.noDataAvailable() = _NoDataAvailable;
  const factory ViewState.customMessage(String msg) = CustomMessage;
}
