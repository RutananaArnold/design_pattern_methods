import 'package:design_pattern_methods/patterns/factory_method/factory_method.dart';
import 'package:flutter/material.dart';

import '../patterns/factory_method/product_interface.dart';

class FactoryMethodPage extends StatefulWidget {
  const FactoryMethodPage({super.key});

  @override
  State<FactoryMethodPage> createState() => _FactoryMethodPageState();
}

class _FactoryMethodPageState extends State<FactoryMethodPage> {
  final nameController = TextEditingController();
  final priceControler = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'clothing';

  // List of items in our dropdown menu
  var items = [
    'clothing',
    'groceries',
    'electronics',
  ];
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: TextFormField(
              controller: nameController,
              validator: ((value) =>
                  value!.isNotEmpty ? null : "This field is required"),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.label,
                    color: Colors.black,
                    size: 20,
                  ),
                  labelText: "Product Name",
                  labelStyle: TextStyle(fontSize: 15),
                  hintText: "Product name",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  suffixStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: TextFormField(
              controller: priceControler,
              validator: ((value) =>
                  value!.isNotEmpty ? null : "This field is required"),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.label,
                    color: Colors.black,
                    size: 20,
                  ),
                  labelText: "Product Price",
                  labelStyle: TextStyle(fontSize: 15),
                  hintText: "Product Price",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  suffixStyle: TextStyle(color: Colors.green)),
            ),
          ),
          // category selection
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),

          // elevated button
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    // Arrange
                    ProductFactory factory = ProductFactory();

                    // Act
                    Product product = factory.createProduct(
                        dropdownvalue,
                        Product(
                            name: nameController.text,
                            category: dropdownvalue,
                            price: int.parse(priceControler.text)));
                  });
                }
              },
              child: const Text("Add product")),

          SizedBox(
              height: size.height * 0.4,
              child: allProducts.isEmpty
                  ? const Center(child: Text("No products Added"))
                  : ListView.builder(
                      itemCount: allProducts.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          leading: const Icon(Icons.production_quantity_limits),
                          title: Text(allProducts[index].name),
                          subtitle: Text(allProducts[index].category),
                          trailing: Text(allProducts[index].price.toString()),
                        );
                      }))
        ],
      ),
    );
  }
}
