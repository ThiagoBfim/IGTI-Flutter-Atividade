import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atividade/app/modules/home/home_module.dart';
import 'package:atividade/app/modules/home/home_page.dart';
import 'package:atividade/app/app_module.dart';

main() {
  initModules([AppModule(), HomeModule()]);
  testWidgets('HomePage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage(title: 'Home')));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}
