import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:clean_architecture_sample_code/core/usecases/usecase.dart';
import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:clean_architecture_sample_code/domain/repositories/sample_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSampleData extends UseCase<SampleEntity, Params> {
  final SampleDataRepository _sampleDataRepository;
  GetSampleData(this._sampleDataRepository);
  @override
  Future<Either<Failure, SampleEntity>> call(params) {
    return _sampleDataRepository.getSampleData(
        id: params.id, name: params.name);
  }
}

class Params extends Equatable {
  final int id;
  final String name;

  Params({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
