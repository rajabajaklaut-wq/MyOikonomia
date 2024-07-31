import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('Login screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Don\'t have an account? Sign up'), findsOneWidget);
  });

  testWidgets('Signup screen navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Don\'t have an account? Sign up'));
    await tester.pumpAndSettle();

    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Home screen navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byType(TextField).first, 'testuser');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Kalkulator Keuangan'), findsOneWidget);
    expect(find.text('Berita Ekonomi'), findsOneWidget);
    expect(find.text('Materi Edukasi'), findsOneWidget);
    expect(find.text('Portofolio Investasi'), findsOneWidget);
    expect(find.text('Pengelolaan Anggaran'), findsOneWidget);
    expect(find.text('Simulasi Keuangan'), findsOneWidget);
    expect(find.text('Forum dan Komunitas'), findsOneWidget);
    expect(find.text('Analisis Data'), findsOneWidget);
  });

  testWidgets('Navigate to calculator screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byType(TextField).first, 'testuser');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Kalkulator Keuangan'));
    await tester.pumpAndSettle();

    expect(find.text('Kalkulator Keuangan'), findsOneWidget);
  });
}
