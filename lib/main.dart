import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_smait/bloc/home_bloc.dart';
import 'package:flutter_project_smait/pages/pages.dart';
import 'package:flutter_project_smait/repositories/home_repository.dart';

main() {
  runApp(RepositoryProvider(
      create: (context) => HomeRepository(),
      child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(context.read<HomeRepository>())
            ..add(const LoadingCharacterEvent()),
          child: const MaterialApp(
            home: HomePage(),
          ))));
}
