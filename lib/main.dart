import 'package:campuscareerassignemnet/Screens/FirstScreen.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_bloc.dart';
import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:flutter/material.dart';
import'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DropdownSearchBloc>(
      create: (context) => DropdownSearchBloc([Item('Mumbai'),
        Item('Delhi'),
        Item('Kolkata'),
        Item('Bangalore'),
        Item('Pune'),
        Item('Maharashtra'),]),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FirstScreen(),
      ),
    );
  }
}

