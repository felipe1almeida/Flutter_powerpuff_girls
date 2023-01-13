import 'package:flutter_test/flutter_test.dart';
import 'package:powerpuff_girls/utils/functions/shared_function.dart';

void main() {
  group('formatDate', () {
    test('should return formatted date', () {
      final result = formatDate(date: '2022-05-01', format: 'dd/MM/yyyy');
      expect(result, '01/05/2022');
    });

    test('formatDate should throw a FormatException when reading an invalid date', () {
      expect(() => formatDate(date: 'invalid', format: 'dd/MM/yyyy'), throwsFormatException);
    });
  });
}
