/// A generic class that represents the result of an API response.
/// 
/// The `Result` class can hold either a successful response of type `R` or an error of type `E`.
/// 
/// Type Parameters:
/// - `R`: The type of the successful response.
/// - `E`: The type of the error or exception.
///
/// Example usage:
/// ```dart
/// Result<String, Exception> result = Result.success("Success");
/// if (result.isSuccess) {
///   print(result.value); // Output: Success
/// } else {
///   print(result.error);
/// }
/// ```
class Result<R, E> {
  R? _value;
  E? _error;

  /// Creates an instance of `Result` representing a successful response.
  /// 
  /// The [value] parameter is the successful response of type `R`.
  Result.success(R value) : _value = value;

  /// Creates an instance of `Result` representing an error.
  /// 
  /// The [error] parameter is the error or exception of type `E`.
  Result.error(E error) : _error = error;

  /// Returns `true` if the result is a success.
  bool get isSuccess => _value != null;

  /// Returns `true` if the result is an error.
  bool get isError => _error != null;

  /// Returns the successful response of type `R`.
  /// 
  /// Throws an exception if the result is not a success.
  R get value => _value!;

  /// Returns the error or exception of type `E`.
  /// 
  /// Throws an exception if the result is not an error.
  E get error => _error!;
}