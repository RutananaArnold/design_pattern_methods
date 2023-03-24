import 'package:design_pattern_methods/patterns/factory_method/factory_method.dart';
import 'package:design_pattern_methods/patterns/factory_method/product_interface.dart';
import 'package:flutter_test/flutter_test.dart';

// In this unit test, we use the group and test functions from the test package to group related tests and specify individual tests respectively.

// In each test, we first create an instance of the ProductFactory and use it to create an instance of the corresponding Product. Then, we use the expect function to verify that the created Product is of the correct type and produces the expected output.

// Finally, we can run this unit test using a test runner like flutter test to ensure that the code behaves as expected.

void main() {
  group('Product Factory Tests', () {
    test('Test Electronics Product', () {
      // Arrange
      ProductFactory factory = ProductFactory();

      // Act
      Product product = factory.createProduct("electronics",
          Product(name: "shirt", category: "electronics", price: 3000));

      // Assert
      expect(product is Electronics, true);
    });

    test('Test Clothing Product', () {
      // Arrange
      ProductFactory factory = ProductFactory();

      // Act
      Product product = factory.createProduct("clothing",
          Product(name: "shirt", category: "clothing", price: 3000));

      // Assert
      expect(product is Clothing, true);
    });

    test('Test Groceries Product', () {
      // Arrange
      ProductFactory factory = ProductFactory();

      // Act
      Product product = factory.createProduct("groceries",
          Product(name: "shirt", category: "groceries", price: 3000));

      // Assert
      expect(product is Groceries, true);
    });
  });
}
