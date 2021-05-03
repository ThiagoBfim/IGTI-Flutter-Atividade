import 'package:atividade/app/modules/todo/todo_module.dart';
import 'package:atividade/app/modules/todo/todo_page.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {

  setUpAll(() {
    initModule(TodoModule());
  });

  testWidgets('TodoPage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(TodoPage(title: 'TODO')));
    final titleFinder = find.text('TODO');
    expect(titleFinder, findsOneWidget);
  });
}