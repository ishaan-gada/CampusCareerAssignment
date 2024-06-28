import 'package:campuscareerassignemnet/bloc/drop_down_search_events.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_states.dart';
import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownSearchBloc extends Bloc<DropdownSearchEvent, DropdownSearchState> {
  final List<Item> _items;

  DropdownSearchBloc(this._items) : super(DropdownSearchState(
    allItems: _items,
    searchText: '',
    selectedItems: [],
  ));

  @override
  Stream<DropdownSearchState> mapEventToState(
      DropdownSearchEvent event) async* {
    if (event is SearchTextChanged) {
      final filteredOptions = _items.where((option) =>
          option.text.toLowerCase().contains(event.text.toLowerCase()));
      yield state.copyWith(
        allItems: filteredOptions.toList(),
        searchText: event.text,
      );
    } else if (event is ItemSelected) {
      final updatedOptions = _items.map((item) =>
      item.text == event.item.text ? event.item : item).toList();
      final selectedItems = state.selectedItems.toList();
      if (event.item.isSelected) {
        if(!selectedItems.contains(event.item)){selectedItems.add(event.item);}

      } else {
        selectedItems.removeWhere((item) => item.text == event.item.text);
      }
      yield state.copyWith(
        allItems: updatedOptions,
        selectedItems: selectedItems,
      );
    } else if (event is ItemRemoved) {
      final updatedOptions = _items.map((item) =>
      item.text == event.value ? item.copyWith(isSelected: false) : item).toList();
      final selectedItems = state.selectedItems.toList();
      selectedItems.removeWhere((item) => item.text == event.value);
      yield state.copyWith(
        allItems: updatedOptions,
        selectedItems: selectedItems,
      );
    }
  }
}