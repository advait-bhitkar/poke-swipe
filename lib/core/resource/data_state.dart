import 'failure.dart';

/// Domain layer DataState abstraction for representing success/failure of use case results.
abstract class DataState<T> {
  final T? data;
  final Failure? error;

  const DataState({this.data, this.error});

  bool get isSuccess => error == null;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({super.error});
}

