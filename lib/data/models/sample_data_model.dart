import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';

class SampleDataModel extends SampleEntity {

  SampleDataModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);


  factory SampleDataModel.fromJson(Map<String, dynamic> json) {
    return SampleDataModel(
      id: (json['id'] as num).toInt(),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
