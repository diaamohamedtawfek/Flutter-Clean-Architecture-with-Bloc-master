import 'package:clean_architecture_sample_code/injection_container.dart';
import 'package:clean_architecture_sample_code/presentation/bloc/sample_data_bloc.dart';
import 'package:clean_architecture_sample_code/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_module1/test_module1.dart';

class SampleScreen extends StatelessWidget {
  final String appName;
  const SampleScreen(this.appName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.appName),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<SampleDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (__) => getIt<SampleDataBloc>(),
      child: Container(
        child: Column(
          children: [
            TestWidgetHere("Hi From Parent My little Test Widget"),
            BlocBuilder<SampleDataBloc, SampleDataState>(
                builder: (_, SampleDataState state) {
              if (state is Empty) {
                return MessageDisplay(
                  message: 'Start Searching',
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return MainDataDisplay(sampleEntity: state.sampleEntity);
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              }
              return Container();
            }),
            BottomActions(),
          ],
        ),
      ),
    );
  }
}
