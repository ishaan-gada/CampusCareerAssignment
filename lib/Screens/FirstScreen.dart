
import 'package:campuscareerassignemnet/Reusables/SelectedItemContainer.dart';
import 'package:campuscareerassignemnet/Screens/SelectedItemsScreen.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_bloc.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_events.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_states.dart';
import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late final DropdownSearchBloc _bloc;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<DropdownSearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<DropdownSearchBloc, DropdownSearchState>(
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.1*height,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:0.03*width,),
                  Text('Search:'),],),
              Padding(padding: EdgeInsets.symmetric(vertical:0,horizontal: 10),
                child:  TypeAheadField<Item>(
                  key: ValueKey("Textfield"),

                  controller: _controller,


                  suggestionsCallback: (pattern) {
                    print("suggestions is called");
                    context.read<DropdownSearchBloc>().add(SearchTextChanged(pattern));
                    print(state.allItems);
                    return state.allItems;
                  },

                  itemBuilder: (context, suggestion) {
                    return CheckboxListTile(
                      key: ValueKey(suggestion.text),
                      title: Text(suggestion.text),
                      value: suggestion.isSelected,
                      onChanged: (value) {
                        print(value.toString());
                        context.read<DropdownSearchBloc>().add(ItemSelected(suggestion.copyWith(isSelected: value!)));
                      },
                    );
                  },
                  onSelected: (suggestion) {
                    print("this is called");
                    context.read<DropdownSearchBloc>().add(SearchTextChanged(''));

                  },
                ),),
              Container(
                height: state.allItems.length*0.07*height,
                child: ListView.builder(

                  itemCount: state.selectedItems.length,
                  itemBuilder: (context, index) {
                    final item = state.selectedItems[index];
                    return SelectedItemContainer(height: 0.05*height, width:0.05*width, value:item.text, OnPressed:  () => context
                        .read<DropdownSearchBloc>()
                        .add(ItemRemoved(item.text)),);
                  },
                ),
              ),
              ElevatedButton(
                  key: ValueKey('Next'),
                  onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectedItemsScreen()),
                );
              }, child:Text("Next",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey,)),

            ],
          ),
        )
      ),
    );
  }
}