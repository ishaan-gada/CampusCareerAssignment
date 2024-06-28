import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String text;
  final bool isSelected;

  Item(this.text, {this.isSelected = false});

  Item copyWith({bool? isSelected}) {
    return Item(text, isSelected: isSelected ?? this.isSelected);
  }

  @override
  List<Object> get props => [text, isSelected];
}