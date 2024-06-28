import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:equatable/equatable.dart';

class DropdownSearchState extends Equatable {
  final List<Item> allItems;
  final String searchText;
  final List<Item> selectedItems;

  const DropdownSearchState({
    required this.allItems,
    required this.searchText,
    required this.selectedItems,
  });

  DropdownSearchState copyWith({
    List<Item>? allItems,
    String? searchText,
    List<Item>? selectedItems,
  }) {
    return DropdownSearchState(
      allItems: allItems ?? this.allItems,
      searchText: searchText ?? this.searchText,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }

  @override
  List<Object> get props => [allItems, searchText, selectedItems];
}