part of 'sample_data_bloc.dart';

// * Base State Class
abstract class SampleDataState extends Equatable {
  const SampleDataState();
}

// * Empty State
class Empty extends SampleDataState {
  @override
  List<Object?> get props => [];
}

// * Loading State
class Loading extends SampleDataState {
  @override
  List<Object?> get props => [];
}

// * Loaded State
class Loaded extends SampleDataState {
  final SampleEntity sampleEntity;
  Loaded({required this.sampleEntity});
  @override
  List<Object?> get props => [sampleEntity];
}

// * Error State
class Error extends SampleDataState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
