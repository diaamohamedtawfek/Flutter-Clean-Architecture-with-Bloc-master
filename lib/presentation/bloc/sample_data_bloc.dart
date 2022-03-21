import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_sample_code/core/error/failures.dart';
import 'package:clean_architecture_sample_code/core/usecases/usecase.dart';
import 'package:clean_architecture_sample_code/core/util/input_converted.dart';
import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:clean_architecture_sample_code/domain/usecases/get_random_sample_data.dart';
import 'package:clean_architecture_sample_code/domain/usecases/get_sample_data.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sample_data_event.dart';
part 'sample_data_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE ='Invalid Input - The Number Must be a Positive Integer.';

class SampleDataBloc extends Bloc<SampleDataEvent, SampleDataState> {

  final GetSampleData concreteData;
  final GetRandomSampleData randomData;
  final InputConverter inputConverter;


  SampleDataBloc(
      {required this.concreteData,
      required this.randomData,
      required this.inputConverter})
      : super(Empty());

  @override
  Stream<SampleDataState> mapEventToState(
    SampleDataEvent event,
  ) async* {
    if (event is GetConcreteSampleDataEvent) {
      final id = inputConverter.stringToUnsignedInteger(event.id);

      yield* id.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield Loading();
          final failureOrData =
              await concreteData(Params(id: integer, name: event.name));
          yield* _eitherLoadedOrErrorState(failureOrData);
        },
      );
    } else if (event is GetRandomSampleDataEvent) {
      yield Loading();
      final failureOrData = await randomData(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrData);
    }
  }

  Stream<SampleDataState> _eitherLoadedOrErrorState(
    Either<Failure, SampleEntity> failureOrData,
  ) async* {
    yield failureOrData.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (entity) => Loaded(sampleEntity: entity),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
