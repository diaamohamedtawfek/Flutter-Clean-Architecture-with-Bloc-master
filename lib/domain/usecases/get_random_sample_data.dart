import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:clean_architecture_sample_code/core/usecases/usecase.dart';
import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:clean_architecture_sample_code/domain/repositories/sample_data_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomSampleData extends UseCase<SampleEntity, NoParams> {

  SampleDataRepository _sampleDataRepository;
  GetRandomSampleData(this._sampleDataRepository);

  @override
  Future<Either<Failure, SampleEntity>> call(NoParams params) {
    return _sampleDataRepository.getRandomSampleData();
  }
}
