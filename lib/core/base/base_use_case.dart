/// A base class for defining a use case in a clean architecture structure.
///
/// This abstract class represents a use case that processes some input parameters
/// and returns a result asynchronously in the form of a [Future].
///
/// - [Result] represents the expected return type of the use case.
/// - [Params] represents the input parameters that are passed to the use case.
abstract class UseCase<Result, Params> {
  Future<Result> call({Params params});
}
