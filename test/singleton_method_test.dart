import 'package:design_pattern_methods/patterns/factory_method/product_interface.dart';
import 'package:design_pattern_methods/patterns/singleton_method/singleton.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ProductCatalog instance should be a singleton', () {
    ProductCatalog? catalog1 = ProductCatalog.instance;
    ProductCatalog? catalog2 = ProductCatalog.instance;

    expect(catalog1, equals(catalog2));
  });

  test('ProductCatalog should have an empty product list by default', () {
    ProductCatalog? catalog = ProductCatalog.instance;

    expect(catalog?.products, isEmpty);
  });

  test('ProductCatalog should be able to add products', () {
    ProductCatalog? catalog = ProductCatalog.instance;
    Product product1 = Product(
      name: "Product A",
      price: 100,
      category: 'clothing',
    );
    Product product2 = Product(
      name: "Product B",
      price: 200,
      category: 'electronics',
    );

    catalog!.products.add(product1);
    catalog.products.add(product2);

    expect(catalog.products, containsAll([product1, product2]));
  });
}
