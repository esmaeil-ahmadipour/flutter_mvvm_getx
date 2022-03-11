import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const UiState._();

  const factory UiState.init() = _init<T>;
  const factory UiState.loading() = _loading;
  const factory UiState.success(final T data) = _success<T>;
  const factory UiState.error(final String exception) = _error;

  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading =>  maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
