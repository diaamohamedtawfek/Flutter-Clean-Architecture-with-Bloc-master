import 'dart:convert';

import 'package:clean_architecture_sample_code/core/error/exceptions.dart';
import 'package:clean_architecture_sample_code/data/models/sample_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_SAMPLE_DATA = 'CACHED_SAMPLE_DATA';

abstract class LocalSampleDataSource {
  Future<SampleDataModel> getLastSampleModel();

  Future<void> cacheSampleDataModel(SampleDataModel dataToCache);
}

class LocalSampleDataSourceImpl implements LocalSampleDataSource {
  final SharedPreferences sharedPreferences;

  LocalSampleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheSampleDataModel(SampleDataModel dataToCache) {
    return sharedPreferences.setString(
      CACHED_SAMPLE_DATA,
      json.encode(dataToCache.toJson()),
    );
  }

  @override
  Future<SampleDataModel> getLastSampleModel() {
    final jsonString = sharedPreferences.getString(CACHED_SAMPLE_DATA);
    if (jsonString != null) {
      return Future.value(SampleDataModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
