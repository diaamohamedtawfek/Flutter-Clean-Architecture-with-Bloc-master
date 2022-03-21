import 'package:clean_architecture_sample_code/domain/entities/sample_entity.dart';
import 'package:flutter/material.dart';

class MainDataDisplay extends StatelessWidget {
  final SampleEntity sampleEntity;
  const MainDataDisplay({Key? key, required this.sampleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            sampleEntity.id.toString(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sampleEntity.name.toString(),
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
