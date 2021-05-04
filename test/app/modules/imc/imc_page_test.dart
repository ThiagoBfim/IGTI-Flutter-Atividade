import 'package:atividade/app/modules/imc/imc_module.dart';
import 'package:atividade/app/modules/imc/imc_page.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {

  setUpAll(() {
    initModule(ImcModule());
  });
  testWidgets('ImcPage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(ImcPage(title: 'IMC')));
    final titleFinder = find.text('IMC');
    expect(titleFinder, findsOneWidget);
  });
}