part of 'sample_data_bloc.dart';

// * Base Event Class
@Immutable(
    "This is Base Sample Data Event Class That Any Sample Data Event Class Should Implement")
abstract class SampleDataEvent extends Equatable {
  const SampleDataEvent();
}

// * Get Sample Data With Parameters Event Class
class GetConcreteSampleDataEvent extends SampleDataEvent {
  final String id;
  final String name;
  GetConcreteSampleDataEvent(this.id, this.name);
  @override
  List<Object?> get props => [id, name];
}

// * Get Random Sample Data Without Parameters Event Class
class GetRandomSampleDataEvent extends SampleDataEvent {
  @override
  List<Object?> get props => [];
}
