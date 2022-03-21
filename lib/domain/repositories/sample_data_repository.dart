import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SampleDataRepository {

  Future<Either<Failure, SampleEntity>> getSampleData({required id, required name});

  Future<Either<Failure, SampleEntity>> getRandomSampleData();

}
