import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// *  Base Class For Any UseCase That Should Implement It
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// *  This Will Be Used By The Code Calling The Use Case Whenever The Use Case Doesn't Accept Any Parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
