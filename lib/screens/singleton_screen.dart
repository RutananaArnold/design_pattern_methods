import 'package:design_pattern_methods/patterns/factory_method/product_interface.dart';
import 'package:design_pattern_methods/patterns/singleton_method/singleton.dart';
import 'package:flutter/material.dart';

class Singleton extends StatefulWidget {
  const Singleton({super.key});

  @override
  State<Singleton> createState() => _SingletonState();
}

class _SingletonState extends State<Singleton> {
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

  ProductCatalog? catalog = ProductCatalog.instance;
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
                    catalog!.products.add(Product(
                        name: nameController.text,
                        price: int.parse(priceControler.text),
                        category: dropdownvalue));
                  });
                }
              },
              child: const Text("Add product")),

          SizedBox(
              height: size.height * 0.4,
              child: catalog!.products.isEmpty
                  ? const Center(child: Text("No products Added"))
                  : ListView.builder(
                      itemCount: catalog!.products.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          leading: const Icon(Icons.production_quantity_limits),
                          title: Text(catalog!.products[index].name),
                          subtitle: Text(catalog!.products[index].category),
                          trailing:
                              Text(catalog!.products[index].price.toString()),
                        );
                      }))
        ],
      ),
    );
  }
}
