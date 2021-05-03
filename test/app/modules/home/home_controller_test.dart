import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/app/app_module.dart';
import '../../../../lib/app/modules/home/home_controller.dart';
import '../../../../lib/app/modules/home/home_module.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  HomeController? home;
  setUp(() {
        home = Modular.get<HomeController>();
  });

  group('HomeController Test', () {
      test("First Test", () {
        expect(home, isInstanceOf<HomeController>());
      });

      test("Set Value", () {
        expect(home!.value, equals(0));
        home!.increment();
        expect(home!.value, equals(1));
      });
  });
}
