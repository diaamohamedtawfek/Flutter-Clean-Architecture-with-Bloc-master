import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  final int id;
  final String name;

  SampleEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
