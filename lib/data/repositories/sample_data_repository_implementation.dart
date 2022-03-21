import 'package:clean_architecture_sample_code/core/error/exceptions.dart';
import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:clean_architecture_sample_code/core/network/network_info.dart';
import 'package:clean_architecture_sample_code/data/datasources/localdata/local_data_source.dart';
import 'package:clean_architecture_sample_code/data/datasources/remotedata/remote_data_source.dart';
import 'package:clean_architecture_sample_code/data/models/sample_data_model.dart';
import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:clean_architecture_sample_code/domain/repositories/sample_data_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<SampleDataModel> _ConcreteOrRandomChooser();



class SampleDataRepositoryImpl extends SampleDataRepository {

  final RemoteSampleDataSource remoteDataSource;
  final LocalSampleDataSource localDataSource;
  final NetworkInfo networkInfo;

  SampleDataRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, SampleEntity>> getRandomSampleData() async {
    return await _getData(() {
      return remoteDataSource.getRandomSampleData();
    });
  }


  @override
  Future<Either<Failure, SampleEntity>> getSampleData(
      {required id, required name}) async {
    return await _getData(() {
      return remoteDataSource.getSampleData(id, name);
    });
  }


  Future<Either<Failure, SampleEntity>> _getData(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final sampleModel = await getConcreteOrRandom();
        localDataSource.cacheSampleDataModel(sampleModel);
        return Right(sampleModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final sampleModel = await localDataSource.getLastSampleModel();
        return Right(sampleModel);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
