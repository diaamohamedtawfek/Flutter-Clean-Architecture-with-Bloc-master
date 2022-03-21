import 'package:clean_architecture_sample_code/presentation/bloc/sample_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<SampleDataBloc>(context)
                .add(GetConcreteSampleDataEvent("1", "data"));
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text(
              "Concrete",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<SampleDataBloc>(context)
                .add(GetRandomSampleDataEvent());
          },
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.red,
            child: Text("Random",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
