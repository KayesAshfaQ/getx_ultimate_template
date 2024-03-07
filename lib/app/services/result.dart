class Result<R, E> {
  R? _value;
  E? _error;

  Result.success(R value) : _value = value;
  Result.error(E error) : _error = error;

  bool get isSuccess => _value != null;
  bool get isError => _error != null;

  R get value => _value!;
  E get error => _error!;
}

