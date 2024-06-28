import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:equatable/equatable.dart';

abstract class DropdownSearchEvent extends Equatable {
  const DropdownSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTextChanged extends DropdownSearchEvent {
  final String text;

  const SearchTextChanged(this.text);

  @override
  List<Object> get props => [text];
}

class ItemSelected extends DropdownSearchEvent {
  final Item item;

  const ItemSelected(this.item);

  @override
  List<Object> get props => [item];
}

class ItemRemoved extends DropdownSearchEvent {
  final String value;

  const ItemRemoved(this.value);

  @override
  List<Object> get props => [value];
}