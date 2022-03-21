import 'dart:convert';

import 'package:clean_architecture_sample_code/core/error/exceptions.dart';
import 'package:clean_architecture_sample_code/data/models/sample_data_model.dart';
import 'package:http/http.dart';


abstract class RemoteSampleDataSource {
  Future<SampleDataModel> getSampleData(int id, String name);

  Future<SampleDataModel> getRandomSampleData();
}


class RemoteSampleDataSourceImpl implements RemoteSampleDataSource {

  final Client client;
  RemoteSampleDataSourceImpl({required this.client});

  @override
  Future<SampleDataModel> getRandomSampleData() => _getSampleDataFromUrl('https://run.mocky.io/v3/a909b0e8-2ab3-48b6-8ee0-b28bdc2777f6/');

  @override
  Future<SampleDataModel> getSampleData(int id, String name) => _getSampleDataFromUrl('https://run.mocky.io/v3/a909b0e8-2ab3-48b6-8ee0-b28bdc2777f6/');



  Future<SampleDataModel> _getSampleDataFromUrl(String url) async {
    final Response response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return SampleDataModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
