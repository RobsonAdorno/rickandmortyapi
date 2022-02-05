import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_smait/bloc/home_bloc.dart';
import 'package:flutter_project_smait/shareds/strings/home_page_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: CustomBody(),
        ));
  }
}

class CustomBody extends StatelessWidget {
  final TextEditingController? controller = TextEditingController();

  CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (BuildContext context, HomeState state) {
          if (state.homeOverviewStatus == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.homeOverviewStatus == HomeStatus.failure) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (state.homeOverviewStatus == HomeStatus.initial) {
            return Container();
          }

          return ListView.separated(
              itemCount: state.listOfCharacter?.length ?? 0,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) =>
                  const VerticalDivider(),
              itemBuilder: (BuildContext context, int index) {
                controller?.text = state.listOfCharacter?[index].name ?? '';

                return Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: controller,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              });
        });
  }
}
