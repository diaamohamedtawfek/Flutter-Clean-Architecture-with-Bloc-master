import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:clean_architecture_sample_code/domain/repositories/sample_data_repository.dart';
import 'package:clean_architecture_sample_code/domain/usecases/get_sample_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_sample_data_test.mocks.dart';

@GenerateMocks([SampleDataRepository])
void main() {
  late SampleDataRepository mockSampleDataRepository;
  late GetSampleData useCase;
  setUp(() {
    mockSampleDataRepository = MockSampleDataRepository();
    useCase = GetSampleData(mockSampleDataRepository);
  });

  final id = 1;
  final name = "App Sample";
  final SampleEntity sampleEntity = SampleEntity(id: 1, name: name);
  final SampleEntity sampleEntity2 = SampleEntity(id: 2, name: name);

  test(
    "Test Sample Data Repository",
    () async {
      when(mockSampleDataRepository.getSampleData(id: anything, name: anything))
          .thenAnswer((__) async => Right(sampleEntity));
      final result = await useCase.call(Params(id: id, name: name));
      expect(result, Right(sampleEntity));
      // Verify that the method has been called on the Repository
      verify(mockSampleDataRepository.getSampleData(id: id, name: name));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockSampleDataRepository);
    },
  );
}
