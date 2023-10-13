import 'package:alta_ui_testing/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Judul Halaman Harus ....', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    // expect(find.text("Page Contact"), findsOneWidget);
    // expect(find.text("Selamat Datang di Alterra Academy"), findsOneWidget);
    // expectLater(find.text("Page Contact"), findsNWidgets(3));

    expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    handle.dispose();
  });
}
