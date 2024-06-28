import 'package:campuscareerassignemnet/Screens/FirstScreen.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_bloc.dart';
import 'package:campuscareerassignemnet/bloc/drop_down_search_states.dart';
import 'package:campuscareerassignemnet/models/ItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import'package:mockito/mockito.dart';
void main(){
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  group('testing dropdown items getting selected',(){
    testWidgets('testing dropdown items getting selected', (tester) async {
      // Mock the BLoC (optional)
      final mockBloc = DropdownSearchBloc([]);

      // Provide initial state with Mumbai and Pune
      final initialState = DropdownSearchState(
        allItems: [Item( 'Mumbai'), Item('Pune')],
        selectedItems: [],
        searchText: '',
      );

      when(mockBloc.state).thenReturn(initialState);

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider<DropdownSearchBloc>(
          create: (_) => mockBloc,
          child: FirstScreen(),
        ),
      ));
      // Tap on the text field
      await tester.tap(find.byKey(const ValueKey('Textfield')));
      await tester.pumpAndSettle();

      // Select Mumbai
      await tester.tap(find.byKey(const ValueKey('Mumbai')));
      await tester.pumpAndSettle();

      // Select Pune
      await tester.tap(find.byKey(const ValueKey('Pune')));
      await tester.pumpAndSettle();

      // Tap on Next button
      await tester.tap(find.byKey(const ValueKey('Next')));
      await tester.pumpAndSettle();

      // Verify if Mumbai and Pune are displayed on the next screen
      expect(find.text('Mumbai'), findsOneWidget);
      expect(find.text('Pune'), findsOneWidget);
    });
  });
}