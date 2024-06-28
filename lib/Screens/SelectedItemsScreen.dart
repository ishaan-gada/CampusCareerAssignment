import 'package:campuscareerassignemnet/bloc/drop_down_search_bloc.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items'),
      ),
      body: BlocBuilder<DropdownSearchBloc, DropdownSearchState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.selectedItems.length,
            itemBuilder: (context, index) {
              final item = state.selectedItems[index];
              return ListTile(
                title: Text(item.text),
                subtitle: Text('Selected'),
              );
            },
          );
        },
      ),
    );
  }
}