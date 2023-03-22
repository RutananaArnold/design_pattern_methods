import 'package:design_pattern_methods/patterns/factory_method.dart';
import 'package:flutter_test/flutter_test.dart';

// In this unit test, we use the group and test functions from the test package to group related tests and specify individual tests respectively.

// In each test, we first create an instance of the relevant ProductFactory and use it to create an instance of the corresponding Product. Then, we use the expect function to verify that the created Product is of the correct type and that calling its display method produces the expected output.

// Finally, we can run this unit test using a test runner like flutter test to ensure that the code behaves as expected.

void main() {
  group('Product Factory Tests', () {
    test('Test Electronics Product', () {
      // Arrange
      ProductFactory factory = ElectronicsFactory();

      // Act
      Product product = factory.createProduct();

      // Assert
      expect(product is Electronics, true);
      expect(
          () => product.display(), prints("This is an electronics product\n"));
    });

    test('Test Clothing Product', () {
      // Arrange
      ProductFactory factory = ClothingFactory();

      // Act
      Product product = factory.createProduct();

      // Assert
      expect(product is Clothing, true);
      expect(() => product.display(), prints("This is a clothing product\n"));
    });

    test('Test Groceries Product', () {
      // Arrange
      ProductFactory factory = GroceriesFactory();

      // Act
      Product product = factory.createProduct();

      // Assert
      expect(product is Groceries, true);
      expect(() => product.display(), prints("This is a groceries product\n"));
    });
  });
}
